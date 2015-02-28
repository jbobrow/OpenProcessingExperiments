
int x = 0;
int speed = 1;
 
void setup() {
  size(500,500);
  smooth();
}
 
void draw() {
  background(random(200),25,190);
   
 
   
 
  // Add the current speed to the x location.
  x = x + speed;
 
  // Remember, || means "or."
  if ((x > width) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speed = speed * -1;
  }
 
  // Display circle at x location
 
  stroke(50);
  fill(random(240),230,0);
  ellipse(x,250,100,100);
   
   stroke(50);
  fill(random(240),230,0);
  ellipse(x,250,100,100);
   
   stroke(50);
  fill(20,20,0);
  ellipse(x,270,10,10);
   
     stroke(50);
  fill(20,20,20);
  ellipse(300,230,10,50);
 
    stroke(50);
  fill(20,20,20);
  ellipse(320,230,10,50);
   
     stroke(50);
  fill(240,240,240);
  ellipse(320,240,10,20);
   
       stroke(50);
  fill(240,240,240);
  ellipse(300,240,10,20);
}
