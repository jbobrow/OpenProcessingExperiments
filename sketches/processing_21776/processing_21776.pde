
// C6
void setup() {
  size(400,400);
  smooth();
  background(0);
}
void draw() {
 for (int i=0; i<6; i++){
   pushMatrix();
   translate(200,200);
   rotate(radians(60*i));
   fill(75,17,31);
   noStroke();
   bezier(60,140,0,40,0,0,0,-40);
   bezier(120,60,100,0,100,0,0,-40);
   triangle(40,80,0,-40,60,40);
   strokeWeight(1);
   fill(157,37,37);
   quad(60,40,40,80,80,100,80,80);
   fill(234,115,54);
   triangle(60,40,120,60,80,80);
   fill(234,205,54);
   quad(120,60,140,100,120,120,80,80);
   fill(25,155,112);
   quad(120,120,80,80,80,120,100,160);
   fill(41,101,178);
   quad(80,120,100,160,60,140,60,120);
   fill(62,66,206);
   quad(60,140,60,120,80,100,40,80);
   fill(117,43,170);
   triangle(60,120,80,100,80,120);
   popMatrix();
 }
}

