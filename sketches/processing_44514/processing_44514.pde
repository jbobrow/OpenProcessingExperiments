
PImage img0;

void setup(){
  size(700,525);
 PImage img0 = loadImage("2011_0914Interactivity0019.jpg");
 image (img0, 0, 0, width, height);
}
  
void draw(){
  if (mousePressed==true) {
  stroke(#C1C1C1,35);
  line(mouseX,random(width),mouseY,random(height));
  }
}

void keyReleased() {
   if(key == DELETE || key == BACKSPACE);
    PImage img0 = loadImage("2011_0914Interactivity0019.jpg");
 image (img0, 0, 0, width, height);
}

