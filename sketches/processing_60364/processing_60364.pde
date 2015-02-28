
int r,g,b = 0;
float circle = 1;
float a = 0;

color c = color(255, 0, 0);


float noiseScale = 0.02;

void setup() {
  size(800, 800);
  smooth();
//  noStroke();
  colorMode(RGB, 255, 255, 255, 100);
  background(0,0,255);
  strokeWeight(0.5);
}

void draw() {

}

void mouseDragged() {
  drawCircles(mouseX,mouseY,6,90);

//  circle = map(mouseX+mouseY, 0,width+height, 10, 140);
//  
//  a = map(mouseX,0,width,0,100);
//  
//  r = (int) map(mouseX,0,width,0,255);
//  b = (int) map(mouseY,0,height,0,255);
//  
//  noFill();
//  stroke(r,0,b,a);
//  
//  ellipse(mouseX, mouseY, circle*noise(0.8,2.2), circle*noise(0.8,2.2));
//  
//  fill(r, 0, b, a);
//  noStroke();
//  ellipse(mouseX, mouseY, circle, circle);


}

void drawCircles(int mouse_x, int mouse_y, int circleNum, int circleSize) {
  float e_radius = 70;
  
  fill(c);
  stroke(255);  
  for(int i=1;i<=circleNum;i++) {
    e_radius = e_radius - 0.3 * e_radius;
    println(e_radius);

    ellipse(mouse_x, mouse_y, e_radius, e_radius);
  }
}

void keyPressed() {
  if(key == 's' || key == 'S') {
    fill(0,0,255);
    rect(0,0,width,height);
  }
  
  if(key == 'r' || key == 'R') c = color(255,0,0);
  if(key == 'g' || key == 'G') c = color(0,255,0);
  if(key == 'b' || key == 'B') c = color(0);
}

