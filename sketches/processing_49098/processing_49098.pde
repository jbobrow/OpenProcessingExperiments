
int x, y;

void setup()
{
  size(640,480);
  //background(0);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
 
}
void draw()
{
 
background(0);
 
    x = x;
     y =y;
 
   translate(x,y);
 
  fill(255);
 
 
  //body
 
  noStroke();
  fill(255);
  rect(320, 253, 75, 75);
  rect(362, 240, 15, 15);
  rect(278, 240, 15, 15);
  fill(252,124,25);
  arc(320,215,75,50,PI,PI+PI);
  fill(0);
  
  //eyes
 
  noStroke();
  fill(0);
  ellipse(305,230,15,20);
  ellipse(335,230,15,20);
  fill(255);
  arc(305,241,10,14,PI,PI+PI);
  arc(335,241,10,14,PI,PI+PI);
 
  //mouth
 
  fill(0);
  rect(320,250,15,2);
}
 

   void mousePressed() {
   if (mouseButton == LEFT) {
  
     x = x - 10;
     y =y;
 
   translate(x,y);
  } else if (mouseButton == RIGHT) {
     x = x + 10;
     y =y;
 
   translate(x,y);
   
  }
}

