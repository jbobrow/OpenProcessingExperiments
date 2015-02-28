
int gx= 90;
int gy =90;
float rightColor=0.2;
float leftColor=0.7;

void setup(){
 size(600,600);
colorMode(RGB,1.0);
smooth();
  
  
}

void draw(){
  background(0.0);
  if (mousePressed && (mouseButton == LEFT)) {

    fill(0);

  } else if (mousePressed && (mouseButton == RIGHT)) {

    fill(255);

  } else {

    fill(126);

  }
  noStroke();
fill(0.10, leftColor + 0.6, leftColor + 0.7);
ellipse(100,mouseY,50,50);
fill(0.9, leftColor + 0.4, leftColor + 0.7);
  ellipse(mouseX,mouseY,100,100);
  fill(0.0, rightColor + 0.2, rightColor + 0.4);
  ellipse(mouseX*2,mouseY*2,200,200);
  
}
void update(int x) {
  leftColor = -0.002 * x/2 + 0.06;
  rightColor =  0.002 * x/2 + 0.06;
	
  gx = x/2;
  gy = 100-x/2;

  if (gx < 10) {
    gx = 10;
  } else if (gx > 90) {
    gx = 90;
  }

  if (gy > 90) {
    gy = 90;
  } else if (gy < 10) {
    gy = 10;
  }
}





