
/*Credit: http://www.openprocessing.org/sketch/50231
YSDN 1006 Interactivity in Design
By: Gina Kim
Prof. Borzu
March 6, 2012
*/

float mx, my;

void setup() {
    size(600,600);

fill(0);


}
void draw() {
  smooth();
  background(255,255,0);
  stroke(100,40,255);
    strokeWeight(4);
    fill(0);
 
  float mv = map(mouseX, 0, 400, 40, 50.5);
  stroke(0);
  strokeWeight(4);
  fill(0);
  mx = 224.0;
  my = 439.0;
  ellipse(70, 100, mv, mv);
  
  

  stroke(0);
  strokeWeight(4);
  fill(0);
  mx = 224.0;
  my = 439.0;
  ellipse(530, 100, mv, mv);

fill(200,20,39);
   ellipse(300,350,mouseX,mouseY);
   
     // Left Eyebrow
  float ebsv = map(mouseX, 0, 500, .5, 7);
  float lev = map(mouseX, 0, 500, 382.63, 390);
  stroke(0);
  strokeWeight(ebsv);
  strokeCap(SQUARE);

  line(20,80,70,30);
   
  // Right Eyebrow
  float rev = map(mouseX, 0, 500, 382.63, 390);

   
  line(580,80, 530,30);
}
 
 

 


