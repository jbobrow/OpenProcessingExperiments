
// variables

float r = 255;
float b = 170;
float g = 0;
int w = 600;
int h = 150;
int fr = 5;

void setup() {
  size(600,600);
  background(0);
  noFill();
  strokeWeight(0);
  frameRate (60);
}

void draw() {
    
    
 if(mouseX > width/2) {
    r = r + 1; 
  } else {
    r = r - 1;
 }
 
 if(r>255) {
   r = 255; 
 } else {
   if(r<0) {
     r = 0;
    }
   } 
  
 if(w > 0)  {
    w = w - 1;
    h = h + 1; 
  } else {
    w = w - 1;
    h = h - 1;
  }

if((h > 600)||(h < 0)){
  h=600;
  w=-100;
}
    ellipse(300,300,w,h);
    stroke(r,g,b);
}
  
  

 

