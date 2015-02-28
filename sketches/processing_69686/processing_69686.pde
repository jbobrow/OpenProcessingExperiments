
PFont tipo_letra;
char[] mi_nombre={'A','N','G','I','E'};
int j=0;
int x=1, y=2;


void setup(){
size(500,500);
}
void draw()
{
   background(0);
   tipo_letra=loadFont("AgencyFB-Bold-48.vlw");
   textFont(tipo_letra,40);

     if((x!=j)&&(y!=250))
     {
        x=int(random(500));
        y=int(random(500));
        text(mi_nombre[0],x,y);
     }   
   else
      {  
         y=250;
         text(mi_nombre[0],j,y); 
         j=j+50;
      }
      if((x!=j)&&(y!=250))
      {
         x=int(random(0,500));
         y=int(random(0,500));
        text(mi_nombre[1],x,y);
      }
       else
       {
        y=250;
         text(mi_nombre[1],j,y); 
         j=j+50;
         
       } 
         if((x!=j)&&(y!=250))
      {
         x=int(random(0,500));
         y=int(random(0,500));
        text(mi_nombre[2],x,y);
      }
       else
       {
        y=250;
         text(mi_nombre[2],j,y); 
         j=j+50;
         
       }  
      if((x!=j)&&(y!=250))
      {
         x=int(random(0,500));
         y=int(random(0,500));
        text(mi_nombre[3],x,y);
      }
       else
       {
        y=250;
         text(mi_nombre[3],j,y); 
         j=j+50;
         
        } 
      if((x!=j)&&(y!=250))
      {
         x=int(random(0,500));
         y=int(random(0,500));
        text(mi_nombre[4],x,y);
      }
       else
       {
        y=250;
         text(mi_nombre[4],j,y); 
         j=+50;
       } 
      
}
