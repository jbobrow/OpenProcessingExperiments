
#include <stdio.h>
#include <stdlib.h>

float LN,LF,k,LD,TF,K;

int main(){
    
    printf("Encontrar el trabajo requerido para comprimir un resorte con una longitud de\n___ft a una longitud de ___ft, usando una constante de ___lb/ft.\n\n");

    printf("\nIngresa la longitud natural del resorte: ");
    scanf("%f",&LN);    
    
    printf("\nIngresa la longitud deseada del resorte: ");
    scanf("%f",&LD);
    
    printf("\nIngresa la constante del problema (K): ");
    scanf("%f",&k);
    
    LF=LN-LD;
    printf("\nLa compresion del resorte seria de %.2fft\n\n",LF);
    
    K=k/2;
    
    TF=K*(LF*LF);
    printf("El trabajo necesario para comprimir el resorte %.2fft es %.2f ft/lb\n\n",LF,TF);
    
system("pause");
return 0;

}
