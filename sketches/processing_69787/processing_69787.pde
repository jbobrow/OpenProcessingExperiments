
//Creado por Nieva Ortega Jair Ivan
PFont tipo_letra;
char[] mi_nombre={'J','A','I','R'};
int x,y,x2,y2,x3,y3,x4,y4;
 
 
void setup(){
size(500,500);
  
}
 
void draw()
{
    int m = millis();
    int s = second(); 
   background(0);
   tipo_letra=loadFont("AngsanaNew-Bold-48.vlw");
   textFont(tipo_letra,50);
 
    stroke(#FF0000);
   
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
        
         
       }
         else
         {   
         text(mi_nombre[0],100,250);
         }


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
   
    
       }
         else
         {   
         text(mi_nombre[1],150,250);
         }
          
if(x3!=250 && y3!=250)
       {
          x3=int(random(400));
          y3=int(random(400));
         text(mi_nombre[2], x3,y3);
         x4=int(random(400));
         y4=int(random(400));
         text(mi_nombre[3], x4,y4);
       
         
       }
         else
         {   
         text(mi_nombre[2],200,250);
         }
if(x4!=300 && y4!=250)
       {
         x4=int(random(400));
         y4=int(random(400));
         text(mi_nombre[3], x4,y4);
       
       }
         else
         {   
         text(mi_nombre[3],250,250);
         }

 

   
}


