
float x;
float easing = 0.01;
float diameter = 12;


void setup() {
  size(900, 600);
  smooth();
  //frameRate(15);
  noFill();
  //stroke(0,50);
  background(250);
}
void draw() {
  //float targetX = mouseX;
    x =  x + (mouseX - x)* easing;
 colorMode(HSB,100);
 //strokeWeight(abs((mouseX - x)*0.02));
 float color1 = map(mouseY, 0,height, 0, 100);
 
 
 stroke(color1,90,950,10);
  ellipse(x, 300, (mouseX - x)* 5, 500);
  println(mouseX + " : " + x);
}


