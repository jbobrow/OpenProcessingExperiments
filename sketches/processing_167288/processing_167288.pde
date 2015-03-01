
//import processing.pdf.*;


float x, y;
float angle = 200;
float r = 250;
float d = 1;

void setup() {

  size(600, 600);

  //beginRecord(PDF, "CosSinTan.pdf");
  background(0,0,60);
}

void draw() {
  
  x = r * cos (angle);
  y = r * sin (angle);


noFill();
ellipse(300,300, 530,530);
ellipse(300,300, 550,550);
  stroke(0, 20);
  stroke(random(0,0), random(127, 255), random(100,255));
noFill();
  translate(width/2, height/2);
  rotate(angle);
  line (0, 0, x, y);
  rect(0, 0,x, y);

  //angle = angle+ 1;
  angle += 10;
  r = r -d;

  if (r == 0 || r== 250) {
    d = d * -1;
  }






  println(x+ " : " +y);
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
