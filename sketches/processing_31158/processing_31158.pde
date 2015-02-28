
// globals
float angle = 0;
int digit = 10;

// setup
void setup()
{
  size(640, 360);
  smooth();
  frameRate(60);
}

// draw
void draw()
{
  fill(200);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);    
  fill(175);
  arc(0, 0, 800, 800, 0, angle);  
  textSize(196);
  textAlign(CENTER);
  fill(0);
  stroke(0);
  strokeWeight(2);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);
  text(digit, 0, 64); 
  strokeWeight(4); 
  
  line(0, 0, 800 * cos(angle), 800 * sin(angle));
  if (mousePressed == false) angle += PI/32;
  if (angle > (2 * PI))
  {
    if (--digit < 0) digit = 10;
    angle = 0;
  }
  
  strokeWeight(3);
  stroke(255);
  noFill();
  ellipse(0, 0, 250, 250);
  ellipse(0, 0, 280, 280);   
}



