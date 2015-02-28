
int width=10;
int height=10;
int color_v=0;

PImage img; 
 
void setup() {
  size(300, 300);
  background(255);
  img = loadImage("HATE.png");
}
 
void draw(){
  image(img, 0, 0);
  
}
 
 
void mouseDragged() {
  noStroke();
  fill(0+color_v*0.5, 0+color_v, 0+color_v);
  ellipse(mouseX, mouseY, width, height);
}
 
 
void keyPressed() {
  if (key == 'r') {
    color_v=256;
  }
 
  if (key == 'g') {
    color_v= 200;
  }
 
  if(key == 'e') {saveFrame("screenshot-####.png");}

 
  if (key == 'b') {
    color_v= 128;
  }
 
    if (key == 'w') {
    color_v= 0;
  }
   
   
  if (key == 'c') {
    background(256, 256, 256);
  }
 
  if (key == 'a') {
    width=30; 
    height=30 ;
  }
 
 
  if (key == 'd') {
    width=5; 
    height=5 ;
  }
 
  if (key == 's') {
    width=10; 
    height=10 ;
  }
}


