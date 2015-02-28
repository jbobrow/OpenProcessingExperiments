
PImage i1;
PImage i2;

void setup(){
  size(1000,700);
  i1=loadImage("free_high_res_texture_346.jpg");

}

void draw(){

 tint(255,255,255,10);
  image(i1,mouseX,mouseY,400,400); 
 

}

