
float angle = 0.0;
float angleDirection = 1;
float speed = 0.005;

void setup() {
  size(1000, 500);
  background(30);
  frameRate(17);
  smooth();
}

void draw() {
    translate(mouseX,mouseY); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
    stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    fill(11,16,139);
    line(0, 0, 20, 0);
     stroke(30);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0); 
     stroke(30);
    translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     stroke(30);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     stroke(30);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     stroke(30);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     stroke(30);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     stroke(30);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     stroke(30);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     stroke(30);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
     stroke(30);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);
     translate(20,24); //move to start position 
    rotate(angle);
    strokeWeight(12);
    line(50, 20, 40, 90);
    translate(40, 0); //move to next joint
    rotate(angle * 2.5);
    strokeWeight(3);
    rect(0, 0, 20, 0);
    angle += speed * angleDirection;
    if ((angle > QUARTER_PI) || (angle < 0)) {
  }
  }
  
void mousePressed() {
   if (mousePressed) {
    background(random(0,255));
   }
}
