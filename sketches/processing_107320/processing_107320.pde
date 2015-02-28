
float x = 0;
float y = 0;
float xspeed = 7;
float yspeed =4.3;

void setup() {
  size(640, 480);
  frameRate(30);
   background(255);
}

void draw() {
 
  displayball();
  moveball();
  edgebounce();
//  saveFrame("images/export-"+"-#####.jpeg");
// if ( frameCount >= 6000 ) {
//        exit();
//    } 

}

void displayball() {
    noStroke();
  fill(255,2);
  rect(0,0,width,height);
  float r = 54;
  fill(255,0,0);
  ellipse(x, y, r, r);
}

void moveball() {

  x = x +xspeed;
  y = y + yspeed;
}

void edgebounce() {
  if (x>width || x<0) {
    xspeed = xspeed* -1;
  }
  if ( y>height || y<0) {
    yspeed = yspeed*-1;
  }
}



