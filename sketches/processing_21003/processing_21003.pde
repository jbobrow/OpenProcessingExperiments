
import processing.pdf.*;
boolean record;
void setup() {
  size(720,480);
  background(169,124,80);
  smooth();

}

void draw() {

  noStroke();
  fill(28,117,188);//Blue Rects
  rect(width/2-54,height/3-124,108,108);
  rect(width/2-54,height/3+24,108,108);
  rect(width/2-54,height/3+174,108,108);
  //lines
  rect(30,80,660,20);
  rect(30,155,660,20);
  rect(30,230,660,20);
  rect(30,302,660,20);
  rect(30,380,660,20);
  //ellipses
  fill(240,90,40);
  ellipse(360,90,58,58);
    ellipse(360,240,58,58);
      ellipse(360,390,58,58);
//oth
  fill(101,45,144);
  rect(100,30,20,418);
  rect(170,30,20,418);
  rect(530,30,20,418);
  rect(600,30,20,418);
  strokeWeight(1);
  stroke(255,255,255,70);
  for (int a = 0; a<1000; a++) {
    rect(a+10,0,1,480);
    a=a+1;
  }
  stroke(194,181,155);
  strokeWeight(20);
  noFill();
  rect(10,10,width-20,height-20); // BACK

  fill(0,0,0);
    if (record) {
    endRecord();
    record = false;
  }
}
void keyPressed () {
  record = true;
}


