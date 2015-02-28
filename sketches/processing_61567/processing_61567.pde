
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 2;

void setup() {
  size(400, 400);
  smooth();
  background(255);
}

void draw() {
  noStroke();
  fill(205, 10, 80);


  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  // Display at x,y location
  stroke(240);
  fill(250,250,10);
  ellipse(x, y, 100, 100);
  fill(250, 250,10);

 
  
  ellipse(x, 10, 200, 100); 
   ellipse(x, 60, 200, 100);
   ellipse(x, 110, 200, 100);
  ellipse(x, 160, 200, 100);
 ellipse(x, 210, 200, 100);  
 ellipse(x, 270, 200, 100);
   ellipse(x, 320, 200, 100);  
    ellipse(x,370, 200, 100); 
   
  fill(250,10,10);
  ellipse(width/2, y, 50, 50);
  if (mousePressed)
  {ellipse(mouseX, mouseY, 200, 100);fill (130,10);noStroke();noCursor ();}
 else {ellipse( x, 10, 200, 100); fill(250,250,10);}
 if (mousePressed)
  {ellipse(mouseX, mouseY, 20, 10);fill (250,250,10);noStroke();noCursor ();}
 else {ellipse( x, y, 100, 100);
}}
