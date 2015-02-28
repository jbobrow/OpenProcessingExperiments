
//Flores Rubalcaba Rodrigo 
PImage foto;
int posx = -400;
int posy = -400;


void setup(){
 size(400,400);

}



void draw()
{
  background(0);
  foto=loadImage("lenna.jpg");
  
  if((posx!=0)&&(posy!=0)){
     image(foto,posx,posy);
     posx++;
     posy++;
    // noLoop();
  }
  else{
   image(foto,posx,posy);
   noLoop();
  }
  
  
}







