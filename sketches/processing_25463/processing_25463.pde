
void setup () {
  size(600,600);
  smooth();
  rectMode(CENTER);
  colorMode(RGB, 100,100,100); //limit rgb value scale to 0-100
  background(100); //white background
}

void draw () {
  //size and placement of grid
  for (int x = 40; x < width; x += 85) {
    for ( int y = 40; y < height; y += 85) {
      CDC ( x, y ); //initiate CDC inside each unit on grid
    }
  }
}
//CDC function places one line and one rectangle of varying size and location each frame
void CDC (int x, int y) {
  noStroke();
  fill(random (0,100),random (0,50),random(0,25),random (0,40));
  rect(x += random(-20,40), y += random(-20,30), random(5,35), random(5,35));
  strokeWeight(1);  
  stroke(random (0,20),random (0,60),random (0,100));
  line(x += random(-45,45), y += random(-55,55),x += random(-50,50), y += random(-45,45));
}





