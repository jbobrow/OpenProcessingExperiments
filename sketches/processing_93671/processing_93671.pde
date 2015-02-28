
//RandomSize
float x;
float y;

//RandomColour
float r=0;
float g=100;
float b=200;
float a=150;

void setup() {
    
  size(500,500);
  noStroke();
  
  }

void draw() {
    
   background(250);
    if (mousePressed) {
    fill(random(r),random(g),random(b),random(a)); 
    ellipse(mouseX,mouseY,x = random (50,200),y = random (50,200));
    
  }
  }
