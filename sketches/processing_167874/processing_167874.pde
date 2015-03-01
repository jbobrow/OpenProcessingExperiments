

float y = 0;
float x= 0;
float speedx = 2;
float speedy = 2;

void setup() {
  size (500,500);
  noStroke();
}


void draw() {
  background(200);
  rectMode(CENTER);
  // && == UND
  // || == Oder
  x= x+ speedx;
  y= y+ speedy;
  

  ellipse (x, y,20,20);
  rect (mouseX, mouseY, 50, 100);
  
 if (x >  mouseX - 25 && (y > mouseY-50 && y < mouseY + 50)) {
    speedx = -5;
  }
  
   if (x >  mouseX + 25 && (y > mouseY-50 && y < mouseY + 50)) {
    speedx = 5;
  }
  
   if (x > width -10) {
    speedx =-5;
  }
  
 if (x < 10 ) {
    speedx = 10;
  }
  if (y > height -10) {
    speedy =-5;
  }
  
  if ( y < 10) {
    speedy = 10;
  }
   
  
  println(x);
  
}
