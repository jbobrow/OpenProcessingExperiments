
//---Eunsil Choi 11/08/2013
 
int a = 50;
int b = width;
void setup() {
  size(600, 300);
}
void draw() {
  background(200, 180, 100);
  float secVal= map( second(), 0, 59, 0, width);
  float minVal = map( minute(), 0, 59, 0, width);
  float hourVal = map( hour(), 0, 23, 0, width);
  strokeWeight(50);
  line(secVal, 0, b, 0);
  line(secVal, a, b, a);  
  line(secVal, 2*a, b, 2*a);
  line(secVal, 3*a, b, 3*a);
  line(secVal, (height/2)+50, width, (height/2)+50);
  line(secVal, 5*a, b, 5*a);
  line(secVal, height, b, height);
 
  strokeWeight(10);
  fill(200, 0, 100);
  ellipse(secVal, 0, 20, 20);
  fill(150, 50, 200);
  ellipse(secVal, 50, 20, 20);
  fill(255, 100, 150);
  ellipse(secVal, 100, 20, 20);
  fill(100, 150, 255);
  ellipse(minVal,150,20,20);
  fill(255,100,200);
  ellipse(hourVal, (height/2)+50, 20, 20);
  fill(200, 200, 200);
  ellipse(secVal, (height/2)+50, 20, 20);
  fill(200, 120, 200);
  ellipse(secVal, height/2, 20, 20);
  fill(100, 200, 100);
  ellipse(secVal, 250, 20, 20);
  fill(200, 200, 100);
  ellipse(secVal, 300, 20, 20);
 
  fill(200);
  textSize(33);
  text("toc", hourVal, (height/2)+50);
  text("tic", secVal, 50);
  text("tac", minVal, height/2);
}

