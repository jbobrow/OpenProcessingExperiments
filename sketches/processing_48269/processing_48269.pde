
/* CSC106
CALM -Final Project - STAR OF BETHLEHEM
*/
int a=800, b=a/2;
void setup () {
  background(0);
  size(800, 800);
}

void draw() {
  for (float y=b*1.3;y>0;y-=.1) {
    float x=y*(mouseY-mouseX*100)*.000001;
    
    stroke(#6D8EF0);
    //stroke(#6C4719);
    strokeWeight(1);
    point(b+cos(x)*y*sin(y), b+sin(x)*y*sin(y));
    point(b+cos(x)*y*sin(.005*y), b+sin(x)*y*tan(.05*y));
    point(b+cos(x)*y*sin(.025*y), b+sin(x)*y*tan(.025*y));
    stroke(225);
    point(random(width), random(height));
  }
  filter(11);
  filter(1);
  blend(0, 0, a, a, -2, 2, a+3, a-5, 1);
}

/* Reference
Blurred Spiral	 by Callum Rogers, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID=4878	
License: 
http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/
*/

