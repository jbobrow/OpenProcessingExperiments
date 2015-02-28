
int i = 150;
int j = 174;
int radius = 35;
 
void setup() {
  size(500,350);
  smooth();
  ellipseMode(RADIUS);
}
 
void draw() {

/*CIRCLE*/
  background (161, 234, 207);
  float d = dist(mouseX, mouseY, i, j);
  noStroke();
  if (d<radius) {
    radius++;
    fill(255);
  }
  else {
    fill(0);
  }
  ellipse(i, j, radius, radius);
   
  if (mousePressed == true) {
    radius = 10;
  }
   
/*RECT*/
 
int a = i+150;
int b = j-20;
int w = 80;
int h = 50;
noStroke();
  if ((mouseX > a) && (mouseX < a+w) &&
      (mouseY > b) && (mouseY < b+h)) {
    fill (0);
  } else {
    fill(255);
  }
  rect(a,b,w,h);
   
}



