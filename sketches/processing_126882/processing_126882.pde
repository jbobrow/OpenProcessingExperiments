
import netscape.javascript.*;


PImage img; 

PImage img2; 

int flag = 0; 
  

void setup() { 

  size(450, 450); 

  background(0); 

  tint(0); 


  img = loadImage("oa27.png"); 
  img2 = loadImage("2.png"); 

  image(img, 50, 50); 
} 

void draw() { 


  background(0); 

  image(img, 0, 0); 
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


