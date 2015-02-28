
PImage foto;
int posx;
int posy;

 void setup() {
               size(400,400);
               foto=loadImage("lena.jpg");
               posx=-500;
               posy=-500;
            
 }

void draw() {
                 background(0);
                                  
                 if(posx<0 && posy<0)
                 {
                    image(foto,posx,posy);
                    posx++;
                    posy++;
                 
                 }
                 
                 
                 else
                   {
                    image(foto,0,0);
                    noLoop();
                   }
                 
                 
                 
                 
             }   

