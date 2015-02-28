
int a=0;
int b=0;

void setup () {
  size(500, 350);
  background(255);
}

void draw () {
  

  for (int b=0; b<350; b=b+20) {
    float c=random(350);
    
    if (c<350) {
    fill(250,255,33);
    stroke(0);
    strokeWeight(2);
    ellipse (250, 175, c, c);
    frameRate(10);
    }
    if (b>350) {
      b=0; 
      c=0;
    }
  }
  
  fill(150, 105, 10);
  ellipse(250, 350, 300, 175);
  noFill();
  stroke(10);
  
  stroke(5);
  
  line(180, 300, 225, 315);
  line(225, 315, 180, 330);
  line(320, 300, 275, 315);
  line(275, 315, 320, 330);
  questionMark();
}
/*for (a=0; a<500; a+=10) {
 int c= (int) random(50);
 int d= (int) random(30);
 float t=random (500);
 float o=random (250);
 float p=random (400);
 frameRate(10);
 fill(o, p, p);
 rect (a+10, b, 10, 10);
 a=a+c;
 b=b+d;
 
 if (a>500) {a=250;
 }
 if (b>350) {b=200;
 }
 }
 }
/*  questionMark (200,40);
 }*/

void questionMark () {
  strokeWeight(3);
  beginShape();
  vertex(225, 50);
  bezierVertex(295, 25, 295, 120, 250, 150);
  endShape();
  line(250, 150, 250, 220);
  point(250, 235);
}



