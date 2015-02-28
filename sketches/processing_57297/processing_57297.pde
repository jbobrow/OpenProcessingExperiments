
float x = 60;
float y = 440;
int bodyHeight = 160;
int neckHeight = 70;
int radius = 45;
//int ny = y - bodyHeight - neckHeight - radius;

float easing = 0.02;

void setup () {

  size(360,480);
  smooth();
  strokeWeight(2);
  //background(204);
  ellipseMode(RADIUS);
}

void draw() {
  
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
  if (mousePressed) {
    neckHeight = 16;
    bodyHeight = 90;
    background(255,0,255);
    makeBody(0,255,0);
  } else {
    neckHeight = 70;
    bodyHeight = 160;
    background(204);
    makeBody(0,0,255);
  }
  
  float ny = y - bodyHeight - neckHeight - radius;
  
  makeNeck(ny,radius);
  makeAntenna(ny,radius);
  makeHead(ny,radius);

}

void makeHead (float ny, int rad) {
  smooth();
  noStroke();
  fill(0);
  ellipse(x+12, ny, radius, radius);
  fill(255);
  ellipse(x+24, ny-6, 14, 14);
  fill(0);
  ellipse(x+24, ny-6, 3, 3);
  
}

void makeAntenna (float ny, int rad) {
  
  //Antenna
  smooth();
  line(x+12,ny,x-18,ny-43); // SMALL
  line(x+12,ny,x+42,ny-99); // MEDIUM
  line(x+12,ny,x+78,ny+15); // TALL
  
}
void makeNeck (float ny, int rad) {
   //The Neck of the robot
   smooth();
  stroke(102); //GREY
  line(x+12,y-bodyHeight,x+12,ny);
  
  
  
}
void makeBody (int r, int g, int b){
  smooth();
  noStroke();
  fill(255,0,0);
  ellipse(x, y-33, 33, 33);
  fill(0);
  rect(x-45,y-bodyHeight,90,bodyHeight-33);
  fill(r,g,b);
  rect(x-45,y-bodyHeight,90,6);
  
  
  
}


