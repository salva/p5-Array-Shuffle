#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"


MODULE = Array::Shuffle		PACKAGE = Array::Shuffle		

PROTOTYPES: DISABLE

BOOT:
#if (PERL_VERSION >= 14)
    fprintf(stderr, "hello 5.14\n"); fflush(stderr);
    sv_setpv((SV*)GvCV(gv_fetchpvs("Array::Shuffle::shuffle_array", 0, SVt_PVCV)), "+");
#else
    sv_setpv((SV*)GvCV(gv_fetchpvs("Array::Shuffle::shuffle_array", 0, SVt_PVCV)), "+");
#endif

void
shuffle_array(av)
    AV *av
CODE:
    if (SvRMAGICAL(av)) {
        IV i;
        for (i = av_len(av); i > 0; i--) {
            int j = (i + 1) * Drand01();
            SV **svpi = av_fetch(av, i, 0);
            SV *svi = (svpi ? newSVsv(*svpi) : &PL_sv_undef);
            SV **svpj = av_fetch(av, j, 0);
            SV *svj = (svpj ? newSVsv(*svpj) : &PL_sv_undef);
            if (!av_store(av, i, svj)) SvREFCNT_dec(svj);
            if (!av_store(av, j, svi)) SvREFCNT_dec(svi);
        }
    }
    else {
        SV **svp = AvARRAY(av);
        IV i;
        for (i = av_len(av); i > 0; i--) {
            int j = (i + 1) * Drand01();
            SV *tmp = svp[i];
            svp[i] = svp[j];
            svp[j] = tmp;
        }
    }
                      
