
int d = 25;
int w = 2;
int xPos_a =200;
int yPos_a =200;
int xPos_b =200;
int yPos_b =200;




void setup () {
  size (400, 400, P2D);
  background (200);
  smooth (8);  
  strokeWeight (w);
   
}

void draw () {

   
  
   if (keyPressed) {
    if (key == 'c' || key == 'C') {
      fill (30, 45, 60);
      strokeWeight (1);
    }
  } else {
  fill (30, 56, 100);
  
  }
  
   ellipse (xPos_a, yPos_a, 2*d,2*d);
   
  
  if (keyPressed) {

    if (key == 'b' || key == 'B') {
      fill (30, 56, 100);
      strokeWeight (w + 8);
    }

    if (keyCode == RIGHT) {
      xPos_a = xPos_a + 10;
       xPos_b = xPos_b + 10;
    }

    if (keyCode == DOWN) {
      yPos_a = yPos_a +10;
       yPos_b = yPos_b +10;
    }

    if (keyCode == UP) {
      yPos_a = yPos_a - 10;
      yPos_b = yPos_b - 10;
    }

    if (keyCode == LEFT) {
      xPos_a = xPos_a - 10;
      xPos_b = xPos_b - 10;
    }
  } 
  else {
    fill (30, 45, 60);
  }
  
    ellipse (xPos_b, yPos_b, d,d);
  




if (mousePressed) {
    xPos_a = 200;
    yPos_a = 200;
     xPos_b = 200;
    yPos_b = 200;
    background (255);
  } 
  
 
if (keyPressed) {
    if (key == 'x' || key == 'X') {
       xPos_a = xPos_a + 1;
      xPos_b = xPos_b - 2;
   
    }
  } 
  
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
       xPos_a = xPos_a - 1;
      xPos_b = xPos_b + 2;
      
    }
  } 
  
 
}
