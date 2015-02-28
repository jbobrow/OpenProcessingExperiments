
PImage img0;
float angle = 0.0;
float x = 40;  
float maxHeight = 200; //Maximum distance (in pixels) from
                       //the bottom of the screen that leaves will be drawn in
  
void setup() {
  size(525, 700);
   PImage img0 = loadImage("2011_0914Interactivity0055.jpg");
 image (img0, 0, 0, width, height);
  smooth();
  frameRate(40);
  strokeWeight(.1);
} 
 
void draw() {
   if (mouseY > (height - maxHeight)){
    println ("working; mouseY = " + mouseY);
  translate(mouseX, mouseY);
  rotate(angle);
  ellipse(-15, -15, 10, 7);
    if (mouseX>pmouseX) {
    fill(#E8C86E,90);
  }
  else if (mouseX<pmouseX){
    fill(#F08B38,90);
  }

  angle += random(0.9);
  x-=0.1;
  if (x<0){
    x=40;}
  if (mousePressed == true){
  img0 = loadImage("2011_0914Interactivity0055.jpg");
  }
   }
}


