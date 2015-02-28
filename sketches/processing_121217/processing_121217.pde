
//by changing the "float" commands you can completely alter the sketch
//for example, if you lower all of the numbers the shapes will no longer flash in a pattern, they will quickly bounce around

float x = 100;
float y = 100;
float xspeed = 200;
float yspeed = 160;

//I changed the size and background color based simply on personal preference
void setup() {
  size(1000,1000);
  smooth();
  background(255);
}

//I added the rectangle for the sake of adding more elements to the piece
void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  x = x + xspeed;
  y = y + yspeed;

  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

//I added the ellipse and rect and stroke commands to change the color and thickness of the shapes
  stroke(10);
  fill(20,45,100);
  ellipse(x,y,50,50);
  rect(x+175,y,40,15);
}


