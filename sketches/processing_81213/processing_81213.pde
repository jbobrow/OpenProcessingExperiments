
PImage foto;
int posx;
int posy;
 
void setup()
  {
    size(180,180);
    foto = loadImage("walle.jpg");
    posx = -400;
    posy = -400;
  }
   
 void draw()
   {
     background(0);
     if(posx != 0)
       image(foto, posx,posy);
 
     posx++;
     posy++;
      
     if(posx == 0 && posy == 0)
         noLoop();
   }


