

float maxDistance;
int a = 117, b = 183, c = 41;

 
 void setup() {
 size(750 , 750);
 noStroke();
 smooth();
 maxDistance = dist(0, 0, width, height);
 }
 

 
void draw() {
 //scale(0.5);
 background(204);
 for (int i = 250; i <= 500; i += 15) {
  for (int j = 250; j <= 500; j += 15) {
   float mouseDist = dist(mouseX, mouseY, i, j);
   float diameter = (mouseDist / maxDistance) * 350.0;
   float acolor = a + mouseDist/15;
   float bcolor = b + mouseDist/15;
   float ccolor = c + mouseDist/15;
   fill(acolor, bcolor, ccolor);
   ellipse(i, j, diameter, diameter);
  }
 }
 for ( int i = 350; i <= 390; i += 10) {
  for (int j = 270; j <= 470; j += 10) {
    float mouseDist = dist(mouseX, mouseY, i, j);
   float diameter = (mouseDist / maxDistance) * 100.0;
   float acolor = 220 + mouseDist/15;
   float bcolor = 220 + mouseDist/15;
   float ccolor = 220 + mouseDist/15;
   fill(acolor, bcolor, ccolor);
   ellipse(i, j, diameter, diameter);
  }
 } 
 for ( int i = 270; i <= 470; i += 10) {
  for (int j = 350; j <= 390; j += 10) {
    float mouseDist = dist(mouseX, mouseY, i, j);
   float diameter = (mouseDist / maxDistance) * 100.0;
   float acolor = 220 + mouseDist/15;
   float bcolor = 220 + mouseDist/15;
   float ccolor = 220 + mouseDist/15;
   fill(acolor, bcolor, ccolor);
   ellipse(i, j, diameter, diameter);
  }
 } 
    
 
 
 }


