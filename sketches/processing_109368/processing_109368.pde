
/**
 * Constrain. 
 * 
 * Move the mouse across the screen to move the circle. 
 * The program constrains the circle to its box. 
 */
 
float mx;
float my;
float easing = 0.05;
int radius = 24;
int edge = 100;
int inner = edge + radius;


void setup() {
  size(640, 360);
  ellipseMode(RADIUS);
  rectMode(CORNERS);
  background(0);

}


void draw() { 
  stroke(153);
  strokeWeight(4);
  strokeCap(SQUARE);
  background(51);
  
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }
  
  mx = constrain(mx, inner, width - inner);
  my = constrain(my, inner, height - inner);
  fill(76);
  rect(edge, edge, width-edge, height-edge);
  fill(255);  
  ellipse(mx, my, radius, radius);
  int a = 50;
int b = 120;
int c = 180;

line(a, b, a+c, b);
line(a, b+10, a+c, b+10);
line(a, b+20, a+c, b+20);
line(a, b+30, a+c, b+30);

a = a + c;
b = height-b;

line(a, b, a+c, b);
line(a, b+10, a+c, b+10);
line(a, b+20, a+c, b+20);
line(a, b+30, a+c, b+30);

a = a + c;
b = height-b;

line(a, b, a+c, b);
line(a, b+10, a+c, b+10);
line(a, b+20, a+c, b+20);
line(a, b+30, a+c, b+30);


}


