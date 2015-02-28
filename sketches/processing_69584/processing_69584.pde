
 PFont tipo;
 char[] mi_nombre={'A','b','r','a','h','a','m'};         
     void setup ()
         {
           size (800,400);
           tipo=loadFont("Arial-Black-48.vlw");
         }
         
     void draw()
        {
         float x=int(random(0,400));
         float y=int(random(0,350));
         float x1=int(random(0,400));
         float y1=int(random(0,350));
         float x2=int(random(0,400));
         float y2=int(random(0,350));
         float x3=int(random(0,400));
         float y3=int(random(0,350));
         float x4=int(random(0,400));
         float y4=int(random(0,350));
         float x5=int(random(0,400));
         float y5=int(random(0,350));
         float x6=int(random(0,400));
         float y6=int(random(0,350));
          background(0);
          textFont(tipo,60);
          if((x!=150) && (y!=350))
            {
          text(mi_nombre[0],x,y);
          text(mi_nombre[1],x1,y1);
          text(mi_nombre[2],x2,y2);
          text(mi_nombre[3],x3,y3);
          text(mi_nombre[4],x4,y4);
          text(mi_nombre[5],x5,y5);
          text(mi_nombre[6],x6,y6);
            }           
           else
             {
             text(mi_nombre[0],140,130);
             text(mi_nombre[1],190,130);
             text(mi_nombre[2],230,130);
             text(mi_nombre[3],270,130);
             text(mi_nombre[4],320,130);
             text(mi_nombre[5],370,130);
             text(mi_nombre[6],420,130);
             
             noLoop();
             }
         
                    
          
        }

