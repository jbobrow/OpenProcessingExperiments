
PImage img;
PImage img2;

int transparency;
int lightup;

void setup(){
   
   size(800,500);
   transparency = 255;
   lightup = 3;
   img2 = loadImage("eyes2.jpg");
   img = loadImage("black.png");

}

void draw(){

  background(img2);
   image(img, 0, 0);
   
   if(mousePressed){
    tint(255,transparency);
   
    if(transparency > 0){
    transparency-=lightup;
  }
  

   }
}

