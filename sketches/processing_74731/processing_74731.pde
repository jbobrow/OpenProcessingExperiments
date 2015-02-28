
int x = 1;
int h = 0;
int b = 90;

void setup() {

size(500,500);
  
}

void draw() {
  
 colorMode(HSB, 500);
 background(h, 300, b-80);
 noStroke();
 fill(h, 500, b);
 ellipse(height/2, width/2, x, x); 
 if (mousePressed && mouseButton==LEFT) {x=x+2; h=h+2; b=b+2;}
 else if (mousePressed && mouseButton==RIGHT) {x=x-2; h=h-2; b=b-2;}
 
 if (x>height) {x=1; h=b=0; ellipse(height/2, width/2, x, x);}
  
}
