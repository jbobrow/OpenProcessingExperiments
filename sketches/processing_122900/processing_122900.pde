
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

float h,I,x,a,b,n,fa,fb,fab;

int main()
{
      printf("\n-*-*-*-                Metodo del trapecio               -*-*-*\n\n");
      printf("                         Integral de finida                     \n\n");
      printf("Limite a: ");
      fflush( stdin );
      scanf("%f",&a);
      printf("Limite b: ");
      fflush( stdin );
      scanf("%f",&b);
      printf("Numero de Segmentos (n): ");
      fflush( stdin );
      scanf("%f",&n);
      printf("\n\n");
                     
     h=(b-a)/n;
     printf("h = (b-a)/n = %.2f\n\n",h); 
     
     fa=0.2+(25*a)-(200*a*a)+(675*a*a*a)-(900*a*a*a*a)+(400*a*a*a*a*a);
     printf("f(a) = 0.2  = %.2f\n");
     
     fb=0.2+(25*b)-(200*b*b)+(675*b*b*b)-(900*b*b*b*b)+(400*b*b*b*b*b);
     printf("f(b) = 0.2 = %.2f\n\n");
     
     fab=(fa+fb)/2;
     printf("[f(a) + f(b)] / 2 = %.2f\n\n\n",fab);
     
     printf("-*-*-*-        Formula del metodo del trapecio           -*-*-*\n\n");
     printf("I = [(b-a)/n] [[f(a) + f(b)] / 2]\n\n");
     printf("I = [%.2f]*[%.2f]\n\n\n",h,fab);
     I=h*fab;
     
     
     printf("-*-*-*-           Resultados metodo trapecio             -*-*-*\n\n");
     printf("I=%.4f\n\n\n",I);
     
     system("pause");
     return 0;
}
