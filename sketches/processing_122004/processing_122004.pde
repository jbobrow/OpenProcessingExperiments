
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int i,n;
float suma,h,I,x,a,b,evaluar_f(float x),PI=3.1416;

int main()
{
      printf("\n-*-*-*- Metodo del trapecio               -*-*-*\n");
      printf("-*-*-*-                                   -*-*-*\n");
      printf("-*-*-*- Datos de Entrada                  -*-*-*\n");
      printf("-*-*-*-                                   -*-*-*\n");
      printf("-*-*-*- limites de integracion            -*-*-*\n\n");
      printf("Limite a\n");
      scanf("%f",&a);
      printf("Limite b\n");
      scanf("%f",&b);
      printf("Numero de Segmentos\n");
      scanf("%d",&n);
      printf("\n\n");
                     
     h=(b-a)/n;
     x=a;
     suma=evaluar_f(x);   
     for (i=1;i<=n-1;i++){
         x=x+h;
         suma=suma+(2*evaluar_f(x));
         }
     x=b;
     suma=suma+evaluar_f(x);
     I=(b-a)*(suma/(2*n));
     
     printf("-*-*-*-      Resultados metodo trapecio         -*-*-*\n\n");
     printf("I=%.9f",I);
     printf("\n\n");
     
     system("pause");
      return 0;
 
     }
