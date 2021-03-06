
//import controlP5.*;
//
//ControlP5 cp5;



int frequency = 7;
int amp = 25;
float stepSize = 2;
int whiteWash = 3;

boolean looping = true;


Dot d1;
Dot d2;
Dot d3;
Dot d4;
Dot d5;
Dot d6;
Dot d7;
Dot d8;
Dot d9;

int myPos;
float angle;

void setup() {

  frameRate(30);
  background(255);
  size(1000, 1000);
  smooth();

//  cp5 = new ControlP5(this);
//  cp5.addSlider("frequency", 1, 16, 7, 25, 25, 100, 10);
//  cp5.addSlider("amp", 1, 30, 25, 25, 50, 100, 10);
//  cp5.addSlider("stepSize", 0, 2, 1, 25, 75, 100, 10);
//  cp5.addSlider("whiteWash", 0, 255, 0, 25, 100, 300, 10);


  fill(0);


  d1 = new Dot();
  d2 = new Dot();
  d3 = new Dot();
  d4 = new Dot();
  d5 = new Dot();
  d6 = new Dot();
  d7 = new Dot();
  d8 = new Dot();
  d9 = new Dot();
  

}

void draw() {
  noStroke();
  fill(255, whiteWash);
  rect(0, 0, width, height);
  
//  fill(50);
//  rect(10,10, 400,125);
  
//  if (frameCount == 1){
//    noFill();
//  stroke(0);
//  strokeWeight(27);
//  ellipse(width/2,height/2,400,400);
//  }

  pushMatrix();
  translate(width/2, height/2);
  bigStroke();
  


  d1.display(0);
  d1.display(random(1));
  d2.display(120);
  d2.display(random(1)+120);
  d3.display(240);
  d3.display(240+random(1));
  //  d5.display(186);
  //  d6.display(192);
  //  d7.display(240);
  //  d8.display(246);
  //  d9.display(252);


  popMatrix();
  
  
  
}

class Dot {
  float xPos;
  float yPos;
  float counter = 270;

  Dot() {
  }

  void display(float startPos) {
    if (counter == 270) {
      myPos = int(floor(startPos));
      angle = counter+myPos;
      float radius = 200;
      radius += amp*(sin(radians(counter*frequency)));
      xPos = radius * cos(radians(angle));
      yPos = radius * sin(radians(angle));
      counter += stepSize;
      float savedX = xPos;
      float savedY = yPos;
      line(xPos, yPos, savedX, savedY);
    } 
    else {
      myPos = int(floor(startPos));
      angle = counter+myPos;
      float radius = 200;
      radius += amp*(sin(radians(counter*frequency)));
      float savedX = xPos;
      float savedY = yPos;
      xPos = radius * cos(radians(angle));
      yPos = radius * sin(radians(angle));
      fill(50, 70, 0);
      stroke(150,200,125);
      //noStroke();
      float myRandom = random(4,8);
      strokeWeight(myRandom);
      line(savedX, savedY, xPos, yPos);
      counter += stepSize;
      

      if (random(1) < .05){
      translate(xPos, yPos);
      float myAngle = atan2((savedY-yPos),(savedX-xPos));
      rotate(myAngle+HALF_PI);
      branch(0);
              if(random(1.0) < 0.3){
        fill(200,50,10);
        noStroke();
        ellipse(myRandom*2,0,myRandom*4,myRandom*4);
        ellipse(myRandom*-2,0,myRandom*4,myRandom*4);
        }

      }
    }
  }

  void branch(int depth) {
    if (depth < 4) {
      line(0, 0, 0, 15);

      translate(0, 15);
      rotate(random(-0.1, 0.1)); 

      if (random(1.0) < 0.6) { // branching  
        rotate(0.3);
        scale(0.7);
        pushMatrix();

        branch(depth + 1);
        popMatrix();    
        rotate(-0.6);
        pushMatrix();
        branch(depth + 1);   
        popMatrix();
      }
      else { // continue  
        branch(depth);
      }
    }
  }
}

void keyPressed(){
  if (looping == true){
    noLoop();
    looping = false;
  } else {
    loop();
    looping = true;
  }
}

  void bigStroke(){
  noFill();
  stroke(0,whiteWash);
  strokeWeight(27);
  ellipse(0,0,400,400);
  }
