
//import processing.pdf.*;
float count;
/*float g;
float gAng;
float rad;
float rgrowth;
float cur = 0;
float rot = 0;
float x,y;
*/

void setup() {
  size(600, 600);
  colorMode(HSB);
  //smooth();
  //background(#EAC089);
  //frameRate(5);
  /*g = 1/1.618033989;
  gAng = 360-360 * g + 0; //change this value for varying effects
  rad = 5;
  rgrowth = 1.004;*/
  //beginRecord(PDF, "everything.pdf");
}
//med uret
void draw() {
  fill(#EAC089);
  rect(0, 0, width, height);
  //udgangspunkt: midten 
  translate(width/2, height/2);
  /*cur++;
  rot += gAng;
  rot -= int(rot/360) * 360;
  rad *= rgrowth;*/
  noStroke();
  /*x = cos(rot * PI/180) * rad + width/2;
  y = sin(rot * PI/180) * rad + height/2;*/
  fill(0);
  ellipse(0, 0, 415, 415);
  stroke(#EAC089);
  //forloops
  for (int j = 0; j<360; j = j+30) {
   pushMatrix();
   rotate(radians(j));
   for (int i = 0; i<10; i++) {
   rotate(radians(20));
   scale(1.1);
   line(0, 0, 0, 20);
   translate(0, 20);
   }
   popMatrix();
   }
   for (int j = 0; j<360; j = j+30) {
   pushMatrix();
   rotate(radians(j));
   //forloops
   for (int i = 0; i<10; i++) {
   rotate(radians(-20));
   scale(1.1);
   line(0, 0, 0, 20);
   translate(0, 20);
   }
   popMatrix();
   }
}

void keyPressed() {
  if (key == 'q') {
    //endRecord();
    exit();
  }
}

