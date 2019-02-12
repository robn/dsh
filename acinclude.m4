dnl Useful macros to check libraries which are not implicit
dnl in Solaris, for instance.
dnl https://lists.gnu.org/archive/html/autoconf/2007-04/msg00074.html
AC_DEFUN([CF_LIB_NSL],
[
AC_CHECK_LIB(nsl,gethostbyname,
[
AC_MSG_CHECKING(if libnsl is mandatory)
AC_TRY_LINK([#include <sys/types.h>
             #include <netinet/in.h>
             char *domain;  ],
 [gethostbyname(domain)], dnl
 [AC_MSG_RESULT(no)], dnl
 [AC_MSG_RESULT(yes); LIBS="${LIBS} -lnsl"])
])
])
AC_DEFUN([CF_LIB_SOCKET],
[
AC_CHECK_LIB(socket,socket,
[
AC_MSG_CHECKING(if libsocket is mandatory)
AC_TRY_LINK([#include <sys/types.h>
             #include <netinet/in.h>
             union
             {
                HEADER hdr;
                u_char buf[512];
             }
             response;
             char *domain;
             int requested_type;        ],
 [socket (AF_INET, SOCK_STREAM, 0) ], dnl
 [AC_MSG_RESULT(no)], dnl
 [AC_MSG_RESULT(yes); LIBS="${LIBS} -lsocket"])
])
])
