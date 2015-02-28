
//Author: Liliam Rodas
//Purpose: To practice how to apply movement, regresion and time.
//Functioning: Shows the course of a bouncing ball.
//Reference: previous excercise provided in class and processing.

//Background

void setup() {
  size(200,400);
  background (17,13,60);
  frameRate (90);
  x=random(width);
  y=random(height);
  w = random(10);
  h = random(10);
  ellipse(x, y, x2, y2);
}


float x, y, w, h;
float x2=10;
float y2=10;


//Directions of ball

void ballMovement () {
  
  stroke(86,147,248,50);
  if (x>=width-x2) {
    w=-w;
    fill(62,132,248);
    }
  
  if (x<=0+x2) {
    w=-w;
    fill(49,129,176,50);
    }
 
  if (y>=height-y2 ) {
    h=-h;
    fill(10,192,192,50);
    }
    
  if (y<=0+y2 ) {
    h=-h;
    fill(29,67,99,50);
    }
 
  fill(38,89,132,50);
  x=x+w;
  y=y+h;
  
  ellipse(x, y, x2, y2);
}

 
void draw() {
   
  ballMovement ();
  
  
}
 
   
void keyPressed() {
  saveFrame("ball desing.jpg");
}

