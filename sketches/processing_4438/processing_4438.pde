
/* original code from Mars by Janne Aukia 
http://www.openprocessing.org/visuals/?visualID=3603
*/


float o,i=o,t=320; 
void setup() {
  size(400, 400, P3D);
 stroke(0,0); 
}

void draw() {
  background(0);
  stroke(255, 50);
  translate(200, 200, 0);
  rotateX(mouseY * 0.05+i+.1*o);
  rotateY(mouseX * 0.05+o);
  fill(mouseX/2, 10, mouseX*200);
  // mouse slow change colour, try to keep into gem colours, low red
  sphereDetail( 100-mouseX);
  // reverse order, start with more side and refine to gem shape
  // form sphere detail instead of using sphere(t);}} 
  sphere(200);
  rotateX(o+=.01);
rotateY(o);
for(float i=0;i<3;i+=.1);
rotateX(i+.1*o);
rotateY(i);
}

