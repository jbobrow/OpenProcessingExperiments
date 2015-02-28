
void setup(){
size(640,480);
background(#FFFFFF);
frameRate(800);
smooth();
PImage watercolour;
watercolour = loadImage("background.jpg");
image (watercolour,0,0, 640, 480);

}
 
void draw(){
noFill();
stroke(125,255,0,50);
bezier(320, 0, mouseX, mouseY, 500, 500,320, 268);
stroke(#77D7DB,50);
bezier(80, 0, mouseX, mouseY, 500, 500,320, 268);
stroke(#9E5BED,50);
bezier(600, 0, mouseX, mouseY, 500, 500,320, 268);
 if(mousePressed){
   PImage watercolour;
 watercolour = loadImage("background.jpg");
image (watercolour,0,0, 640, 480);
 }
 }



