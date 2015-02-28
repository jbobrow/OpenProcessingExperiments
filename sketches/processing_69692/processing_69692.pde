
PFont tipo_letra;
char[] mi_nombre={'S','U','A','R','E','Z'};
int x,y,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6;


void setup(){
size(500,500);
    //frameRate(20);  
}

//Arturo Suarez
void draw()
{
    int m = millis();
    int s = second();  
   background(0);
   tipo_letra=loadFont("AgencyFB-Bold-48.vlw");
   textFont(tipo_letra,50);

    stroke(#FF0000);
 //////////// letra A///////////    
       if(x!=150 && y!=250)
       {
        x=int(random(400));
          y=int(random(400));
         text(mi_nombre[0], x,y);
          x2=int(random(400));
          y2=int(random(400));
         text(mi_nombre[1], x2,y2);
          x3=int(random(400));
          y3=int(random(400));
         text(mi_nombre[2], x3,y3);
         x4=int(random(400));
         y4=int(random(400));
         text(mi_nombre[3], x4,y4);
         x5=int(random(400));
         y5=int(random(400));
         text(mi_nombre[4], x5,y5);
         x6=int(random(400));
          y6=int(random(400));
         text(mi_nombre[5], x6,y6);
       }
         else
         {    
         text(mi_nombre[0],100,250);//a
         }
////////////letra R /////////////  

if(x2!=200 && y2!=250)
       {
          x2=int(random(400));
          y2=int(random(400));
         text(mi_nombre[1], x2,y2);
          x3=int(random(400));
          y3=int(random(400));
         text(mi_nombre[2], x3,y3);
         x4=int(random(400));
         y4=int(random(400));
         text(mi_nombre[3], x4,y4);
         x5=int(random(400));
         y5=int(random(400));
         text(mi_nombre[4], x5,y5);
         x6=int(random(400));
          y6=int(random(400));
         text(mi_nombre[5], x6,y6);
       }
         else
         {    
         text(mi_nombre[1],150,250);//a
         }
         
 /////////////// letra T////////////
if(x3!=250 && y3!=250)
       {
          x3=int(random(400));
          y3=int(random(400));
         text(mi_nombre[2], x3,y3);
         x4=int(random(400));
         y4=int(random(400));
         text(mi_nombre[3], x4,y4);
         x5=int(random(400));
         y5=int(random(400));
         text(mi_nombre[4], x5,y5);
         x6=int(random(400));
          y6=int(random(400));
         text(mi_nombre[5], x6,y6);
       }
         else
         {    
         text(mi_nombre[2],200,250);//a
         }
///////// letra U /////////
if(x4!=300 && y4!=250)
       {
         x4=int(random(400));
         y4=int(random(400));
         text(mi_nombre[3], x4,y4);
         x5=int(random(400));
         y5=int(random(400));
         text(mi_nombre[4], x5,y5);
         x6=int(random(400));
          y6=int(random(400));
         text(mi_nombre[5], x6,y6);
       }
         else
         {    
         text(mi_nombre[3],250,250);//a
         }
///////////// letra R /////////////

if(x5!=350 && y5!=250)
       {
         x5=int(random(400));
         y5=int(random(400));
         text(mi_nombre[4], x5,y5);
         x6=int(random(400));
          y6=int(random(400));
         text(mi_nombre[5], x6,y6);
       }
         else
         {    
         text(mi_nombre[4],300,250);//a
         }
///////// letra O///////////
if(x6!=350 && y6!=250)
       {
          x6=int(random(400));
          y6=int(random(400));
         text(mi_nombre[5], x6,y6);
       }
         else
         {    
         text(mi_nombre[5],350,250);//a
         }
  
}
