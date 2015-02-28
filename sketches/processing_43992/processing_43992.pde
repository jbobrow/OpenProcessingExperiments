

                
                int x=-25;

int speedX = 1;

int x1 = 425;
 
int speedX1 = -1;


void setup() {
  size(400,400);
  smooth();
  background(254,255,70);
}

void draw() {
  background(254,255,70);
  
  if (mousePressed){
    background(114,119,250);
    //speedX = speedX +1;
  }
  
  noStroke();
  fill(255,8,202);
  ellipse(x,25,50,50);
  x = x + speedX;
  
  
  
 if (x > 425) {
   x = -25;
 }
 
fill(108,15,88); 
ellipse (x1,75,50,50);
x1 = x1 + speedX1;

if (x1 < 0) {
  x1 = 425;
}

fill(255,8,202);
  ellipse(x,125,50,50);
  x = x + speedX;
  
 if (x > 425) {
   x = -25;
 }

fill(108,15,88); 
ellipse (x1,175,50,50);
x1 = x1 + speedX1;

if (x1 < 0) {
  x1 = 425;
}

fill(255,8,202);
  ellipse(x,225,50,50);
  x = x + speedX;
  
 if (x > 425) {
   x = -25;
 }

fill(108,15,88); 
ellipse (x1,275,50,50);
x1 = x1 + speedX1;

if (x1 < 0) {
  x1 = 425;
}


fill(255,8,202);
  ellipse(x,325,50,50);
  x = x + speedX;
  
 if (x > 425) {
   x = -25;
 }

fill(108,15,88); 
ellipse (x1,375,50,50);
x1 = x1 + speedX1;

if (x1 < 0) {
  x1 = 425;
} 
  
  println(x);
  
  
    
  
  
}
