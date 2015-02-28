
int Tamx=600;
int Tamy=300;
int tamano=50;
int t=0;
int[]  coorx={-1,-1,-1,-1};
int[]  coory={-1,-1,-1,-1};
char[] mi_nombre={'L','u','i','s'};

void setup()
{
//  size(Tamx,Tamy);
  size(600,300);
  background(0);
  frameRate(2);
  
}
void draw()
{
 
 PFont tipo_letra;
 tipo_letra=loadFont("SansSerif.bolditalic-48.vlw"); 
 textFont(tipo_letra,tamano);
 
 if(t<4)
   {
    coorx[t]=(int)random(20,Tamx-20);
    coory[t]=(int)random(20,Tamy-20);
   }
 else
   {
    if(t<8)
       {
        coorx[t-4]=(t-3)*50;
        coory[t-4]=Tamy/2;
       }
   }
  
 t=t+1;
 background(0);
 text(mi_nombre[0],coorx[0],coory[0]);
 text(mi_nombre[1],coorx[1],coory[1]);
 text(mi_nombre[2],coorx[2],coory[2]);
 text(mi_nombre[3],coorx[3],coory[3]);  
 
 if(t==8)
     {
       t=0;
       coorx[0]=-1;
       coory[0]=-1;
       coorx[1]=-1;
       coory[1]=-1;
       coorx[2]=-1;
       coory[2]=-1;
       coorx[3]=-1;
       coory[3]=-1;       
     }  
     
 if(t==9)
    background(0); 
    
}

