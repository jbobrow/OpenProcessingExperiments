
/*
NATHAN STETTER
ART 3001: Internet Art
PROJECT 2: 'Snake Life'
*/


class Snake {
 float x1, x2, y1, y2;
 int s, g, len;
 
 Snake(float xx1, float yy1, float xx2, float yy2) {
   x1 = xx1;
   y1 = yy1;
   x2 = xx2;
   y2 = yy2;
   len = 5;
   s = 5;
   g = 2;
 } 
  
 void display() {
   if (mousePressed == false) {
     line(x1, y1, x2, y2);
   } else {
     line(y1, x1, y2, x2); 
   }
     
 }
 
 void grow() {
    y2 += g;
    len += g;
 }
 
 void move() {
   if (mousePressed == false) {
     if (y2 < 0) {
       y1 = height;
       y2 = height + len; 
     }
   } else {
     if (y2 < 0) {
       y1 = width;
       y2 = width + len; 
     }
   }
   
   y1 -= s;
   y2 -= s;
 }
 
 void resetSize() {
   len = 5; 
 }

}

Snake[] s1;
boolean rl, ud;
int c = 0;
int count;

void setup() {
  size(950, 700);
  background(255);  
  strokeWeight(1);
  count = width/2;
  s1 = new Snake[count];
  float x1 = 0;
  float y1, y2;
  //fill array of snakes
  for (int i = 0; i < count; i++) {
    y1 = random(height);
    y2 = y1 + random(20);
    s1[i] =  new Snake(x1, y1, x1, y2);
    x1 += 2;  
  }
}

void draw() {
  background(255);
  stroke(c);
  //draw our row of snakes and let them move and grow
  for (int j = 0; j < count; j++) {
    s1[j].display();
    s1[j].move();
    s1[j].grow(); 
  }
  
  if (c < 0) {
      c = 255;
    } else if (c > 255) {
      c = 0;
    }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      c+=5;
    }
    if (keyCode == DOWN) {
      c-=5;
    }
    
  
  }
  if (key == ' ') {
    for (int k = 0; k < count; k++) {
    s1[k].resetSize();
    }
  }  
  
}
