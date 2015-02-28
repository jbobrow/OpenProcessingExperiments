
PImage flowa;
PImage damask;

void setup(){
  size(600,300);
  noStroke();
  flowa = loadImage("celebration_floral_vector_pattern.jpg");
  damask = loadImage("elegant-patterns-6.png");
}
void draw(){
 
 tint(120,80,180,80);
 image(flowa,0,0,600,300);
 image(damask,0,0,600,350);
 
 if(mousePressed == true){
   fill(20);
 }else{
   fill(225,225,225,80);
 }
 rect(0,125,600,50);
 }

