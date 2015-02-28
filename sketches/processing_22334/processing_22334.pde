
PImage colourtree;
PImage ornament;
PImage ornament2;


float bx = -200;
float by = -10;
float cx = -50;
float cy = -20;
int bs = 20;
boolean move = false;
boolean lock = false;
float bdifx = 0.0; 
float bdify = 0.0; 
float cdifx = 10.0; 
float cdify = 10.0; 

void setup() {
  size(500, 800);
  smooth();
  colourtree = loadImage("colourtree.jpg");
  ornament = loadImage("star.png");
  ornament2 = loadImage("ornament2.png");
}

void draw() {
  image(colourtree, 0, 0);
  
  // Test if the cursor is over the box 
  if (mouseX > bx-ornament.width && mouseX < bx+ornament.width && 
      mouseY > by-ornament.height && mouseY < by+ornament.height) {
    move = true;
    
      // Test if the cursor is over the box 
  if (mouseX > cx-ornament2.width && mouseX < cx+ornament2.width && 
      mouseY > cy-ornament2.height && mouseY < cy+ornament2.height) {
    move = true;
      }
      
      
  } else {
    move = false;
  }
  
  image(ornament, bx, by); 

}



void mousePressed() {
  if(move) { 
    lock = true; 
    fill(255, 255, 255);
  } else {
    lock = false;
  }
  bdifx = mouseX-bx; 
  bdify = mouseY-by; 
 

}

void mouseDragged() {
  if(lock) {
    bx = mouseX-bdifx; 
    by = mouseY-bdify; 
  
  }
}

void mouseReleased() {
  lock = false;
}



