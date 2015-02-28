
#include <winbgim.h>
#include <stdio.h>
#include <stdlib.h>

float LN,LF,k,LD,TF,K;
 
int main(){
        
    printf("Encontrar el trabajo requerido para comprimir un resorte. f(x) = kx\n\n");

    printf("\nLongitud natural del resorte (n): ");
    scanf("%f",&LN);    
    
    printf("\nLongitud deseada del resorte : ");
    scanf("%f",&LD);
    
    printf("\nConstante del material (k): ");
    scanf("%f",&k);
    
    LF=LN-LD;
    
    if(LF<0)
    {
    printf("\nError de calculo 'a' > 'b'\n\n\n\n\n");
    }
    else
    {
    printf("\nCompresion del resorte (b): %.2fft\n\n",LF);
    
    K=k/2;
    TF=K*(LF*LF);
    printf("El trabajo necesario es (W): %.2f ft/lb\n\n\n\n",TF);

        
    initwindow(500,500);
    setcolor(WHITE);
    
//Grafica
    line(80,350,400,350);
    line(100,150,100,370);
    outtextxy(90,148,"F(lb)");
    outtextxy(402,344,"x(ft)");
    outtextxy(85,355,"0");
//Resorte normal
    line(100,300,120,350);
    line(120,350,140,300);
    line(140,300,160,350);
    line(160,350,180,300);
    line(180,300,200,350);
    line(200,350,220,300);
    line(220,300,240,350);
    line(240,350,260,300);
    line(260,300,280,350);
    line(280,350,300,300);
    line(300,300,320,350);
    line(320,350,340,300);
    line(340,300,360,350);
    line(360,350,380,300);
//Resorte comprimido
    line(180,200,200,250);
    line(200,250,220,200);
    line(220,200,240,250);
    line(240,250,260,200);
    line(260,200,280,250);
    line(280,250,300,200);
    line(300,200,320,250);
    line(320,250,340,200);
    line(340,200,360,250);
    line(360,250,380,200);
//Compresion de resorte
    setcolor(RED);
    line(180,185,180,370);
    line(110,225,170,225);
    line(170,225,160,215);
    line(170,225,160,235);
    line(380,185,380,370);
//Variables
    setcolor(BLUE);
    outtextxy(138,280,"x");
    line(110,285,135,285);
    line(110,285,115,280);
    line(110,285,115,290);
    line(150,285,170,285);
    line(170,285,165,280);
    line(170,285,165,290);
    setcolor(RED);
    outtextxy(135,210,"F");
    setcolor(GREEN);
    outtextxy(97,375,"a");
    outtextxy(177,375,"b");
    outtextxy(377,375,"n");
//Titulo
    setcolor(WHITE);
    outtextxy(200,100,"GRAFICA DEMOSTRATIVA");
 
getch();
closegraph();

}
 
system("pause");
return 0;
}
