
/* @pjs preload = "oa27.png, 2.png"; */

PImage img; 

PImage img2; 

int flag = 0; 

void setup() {  
  size(450, 450);
  background(0); 
img = loadImage("oa27.png"); 
img2 = loadImage("2.png"); 

image(img, 1, 1); 
}

void draw() { 

background(0); 

  image(img, 0, 0);
  fill(random(255),100,255,50);
  
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 20, 20);
  }
  
  else {

  }
}
void mousePressed() { 

tint(255); 
} 
  void mouseReleased() { 

  tint(255,0,0); 
} 

void mouseDragged() {
for (int x = 0; x <= width; x +=450) {
for (int y = 0; y <= width; y +=450) {
image(img2, x, y); 
}
}
image(img, 5, 5); 
noStroke(); 
}



