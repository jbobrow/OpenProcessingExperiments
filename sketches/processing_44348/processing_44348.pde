
int x =10;
int y = 10;
int a = 10;
int b = 10; 
int speedX =1;
int speedY = 30;
   
void setup() {
  size(600, 600);
  smooth();
  rect(0, 0, width, height);
}
   
void draw() {
  ///colore sfondo//
  fill(#FF08DF);
  noStroke ();
  
  //colore rettangolo pigiato///

  rect (0, 0, width, height); 
  fill(#CE0202);
  
  //se pigio il mouse//
   
  if (mousePressed) {  
   
    if (x > width || x < 0) {
      x=0;
    }
    else if (a > width || a < 100) {
      a=width;
    }
    
    //grandezza dei quadrati piagiati///
    ellipse(x, y, 200, 100);
   ellipse(a, b, 200, 100);
   
   
    speedX = 1;
    x = x - speedX;
    y = y - speedY;
    a = a + speedX;
    b = b + speedY;
  }
   
  else {
    if (x > width || x < 0) {
      x=0;
    }
    else if (a > width || a < 0) {
      a=width;
    }
    
    //colori rettangoli non piagiati//
    
    fill(#FFEB08);
    ellipse(x, y, 100, 100);
    ellipse(a, b, 100, 100);
   
    x = x + speedX;
    a = a - speedY;
    speedX= 1;
    y=0;
    b=500;
  }
}
 
                

