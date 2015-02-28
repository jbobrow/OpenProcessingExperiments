
/*
NATHAN STETTER
HW #2
ART 3001
*/

int x1, y1, x, y;
int a1, b1, a, b;
int fill1, fill2, fill3, opacity;

void setup() {
 size(750, 750);
 background(255);
 strokeWeight(1);
 fill1 = 0;
 fill2 = 115;
 fill3 = 253;
 opacity = 0;
 x1 = 500;
 y1 = 300;
}

void draw(){
  
  if (fill1 > 255) {
    fill1 = 0;
  }
  if (fill2 > 255) {
    fill2 = 0;
  }
  if (fill3 > 255) {
   fill3 = 0; 
  }
  if (opacity > 75) {
    opacity = 0;
  }
  
  
  y = y1 + (height/2) - int(random(height/3));
  x = x1 + (height/2) - int(random(height/3));
  /*
  b = b1 + (height/2) - int(random(height/3));
  a = a1 + (height/2) - int(random(height/3));
  */
  stroke(fill1, fill2, fill3, opacity);

  line(x1,y1,x,y);
  
  stroke(fill2, fill3, fill1, opacity);
  line(x1,y1,y,x);
  
  x1 = int(random(height));
  y1 = int(random(width));
  
  fill1++;
  fill2++;
  fill3++;
  opacity++;
  
}

