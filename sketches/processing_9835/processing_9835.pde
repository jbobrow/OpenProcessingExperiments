
import processing.pdf.*;

void setup(){
  size (500,700);
  frameRate(25);
  smooth();
  background (1,18,80);
  cursor(CROSS);
 // beginRecord(PDF, "test.pdf");
}

void draw(){
  stroke(206,217,255);
  float p= 0;
  float yy=0;
  if (mousePressed){
    yy=yy +700; //2. draw auf klick (distanz von oben)
  }
  p=p+pmouseX-250;
  strokeWeight(0.1);
  noFill();
  float time= millis();
  if (time>15000){
    time=time-time;
  }
  float ra= random(0,700);
  bezier(250+p,yy,-200,mouseY,700,mouseY,250-p,yy); // bezier-kurve time = mouseY
  //
  int steps = 30; // perlen
  for (int i = 0; i <= steps; i++) {
    float t = i / float(steps);
    float punktx = bezierPoint (250+p,-200,700,250-p,t); //perlen positionen
    float punkty = bezierPoint (yy,mouseY,mouseY,yy,t); //perlen positionen
    noStroke();
    fill(255,255,255,255);
    ellipse (punktx,punkty,2,2);
  }
}

//Steuerung


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      loop();
    } 
    else if (keyCode == DOWN) {
      noLoop();
    } 
    else if (keyCode == LEFT) {
      background (1,18,80);
    }
    else if (keyCode == RIGHT) {
      endRecord();
    }
  }
}


