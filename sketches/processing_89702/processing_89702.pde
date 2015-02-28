
PImage bgimage;
PImage jigsaw1;
PImage jigsaw2;
PImage jigsaw3;
PImage jigsaw4;
PImage jigsaw5;
PImage jigsaw6;


int JS1x = 500;
int JS1y = 500;
int JS1size = 325;
 
int JS2x = 300;
int JS2y = 300;
int JS2size = 275;

int JS3x = 200;
int JS3y = 150;
int JS3size = 225;

int JS4x = 100;
int JS4y = 50;
int JS4size = 175;

int JS5x = 500;
int JS5y = 200;
int JS5size = 125;

int JS6x = 0;
int JS6y = 250;
int JS6size = 75;
 
void setup() {
   
  size(640,480);
  smooth();
   
 
  //bluecrystal = loadImage("crystal.png");
 // pinkcrystal = loadImage("crystal2.png");
 
 
   bgimage = loadImage("bgimage.jpg");
   jigsaw1 = loadImage("MJL_puzzle1.png");
   jigsaw2 = loadImage("MJL_puzzle2.png");
   jigsaw3 = loadImage("MJL_puzzle3.png");
   jigsaw4 = loadImage("MJL_puzzle4.png");
   jigsaw5 = loadImage("MJL_puzzle5.png");
   jigsaw6 = loadImage("MJL_puzzle6.png");
}
 
 
void draw() {
 
imageMode(CENTER);
 background(255);
 image(bgimage, width/2, height/2);
  
 image(jigsaw1, JS2x,JS2y,JS2size,JS2size);
 image(jigsaw2, JS1x,JS1y,JS1size,JS1size);
 image(jigsaw3, JS3x,JS3y,JS3size,JS3size);
 image(jigsaw4, JS4x,JS4y,JS4size,JS4size);
 image(jigsaw5, JS5x,JS5y,JS5size,JS5size);
 image(jigsaw6, JS6x,JS6y,JS6size,JS6size);
   
    
    //Move Puzzle Pieces
    
   if(isOverImage((JS6x), (JS6y), (JS6size/(jigsaw1.width+0.0)),  jigsaw1,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    JS6x = JS6x + (mouseX - pmouseX);
    JS6y = JS6y + (mouseY - pmouseY);
   }
    
   if(isOverImage((JS5x), (JS5y), (JS5size/(jigsaw1.width+0.0)),  jigsaw1,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    JS5x = JS5x + (mouseX - pmouseX);
    JS5y = JS5y + (mouseY - pmouseY);
   }
    
   if(isOverImage((JS4x), (JS4y), (JS4size/(jigsaw1.width+0.0)),  jigsaw1,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    JS4x = JS4x + (mouseX - pmouseX);
    JS4y = JS4y + (mouseY - pmouseY);
   }
    
  if(isOverImage((JS3x), (JS3y), (JS3size/(jigsaw1.width+0.0)),  jigsaw1,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    JS3x = JS3x + (mouseX - pmouseX);
    JS3y = JS3y + (mouseY - pmouseY);
   }
  
  if(isOverImage((JS2x), (JS2y), (JS2size/(jigsaw2.width+0.0)) ,jigsaw2,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    JS2x = JS2x + (mouseX - pmouseX);
    JS2y = JS2y + (mouseY - pmouseY);
     
  }
   
    if(isOverImage((JS1x), (JS1y), (JS1size/(jigsaw1.width+0.0)),  jigsaw1,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    JS1x = JS1x + (mouseX - pmouseX);
    JS1y = JS1y + (mouseY - pmouseY);
     
  }

//Resize Puzzle Pieces

  if(isOverImage((JS6x),(JS6y),(JS6size/(jigsaw2.width+0.0)), jigsaw2,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    JS6size = JS6size + 2*(mouseX-pmouseX);
    JS6size = JS6size + 2*(mouseY-pmouseY);
  }

  if(isOverImage((JS5x),(JS5y),(JS5size/(jigsaw2.width+0.0)), jigsaw2,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    JS5size = JS5size + 2*(mouseX-pmouseX);
    JS5size = JS5size + 2*(mouseY-pmouseY);
  }

  if(isOverImage((JS4x),(JS4y),(JS4size/(jigsaw2.width+0.0)), jigsaw2,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    JS4size = JS4size + 2*(mouseX-pmouseX);
    JS4size = JS4size + 2*(mouseY-pmouseY);
  }

  if(isOverImage((JS3x),(JS3y),(JS3size/(jigsaw2.width+0.0)), jigsaw2,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    JS3size = JS3size + 2*(mouseX-pmouseX);
    JS3size = JS3size + 2*(mouseY-pmouseY);
  }

   
  if(isOverImage((JS2x),(JS2y),(JS2size/(jigsaw2.width+0.0)), jigsaw2,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    JS2size = JS2size + 2*(mouseX-pmouseX);
    JS2size = JS2size + 2*(mouseY-pmouseY);
  }
   
   
    if(isOverImage((JS1x),(JS1y),(JS1size/(jigsaw1.width+0.0)), jigsaw1,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    JS1size = JS1size + 2*(mouseX-pmouseX);
    JS1size = JS1size + 2*(mouseY-pmouseY);
  }
   
 
   
}
 
 
 
 
 
 
 
boolean isOverImage(int imgX, int imgY, float scaleIn, PImage img, int x, int y, int tolerance) {
   
  try{
 
    img.loadPixels();
   
    int posX = (int)(((x - imgX)*(1/scaleIn) + img.width/2));
    int posY = (int)(((y - imgY)*(1/scaleIn) + img.height/2));
   
    println(posX);
    println(posY);
    if(posX < 0 || posX > img.width || posY < 0 || posY > img.height)
      return false;
    else {
      int i = posY*img.width+posX;
     println(alpha(img.pixels[i]));
   
   
  if(alpha(img.pixels[i]) > tolerance) {
        return true;
      }
      else {
        return false;
      }
    }
  }
  catch(Exception e ){println("error");return false;}
}
 


