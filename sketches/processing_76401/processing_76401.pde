
float ang1;
float ang2;
float ang3;
float angFinger;
float angBody;
float angLeg;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);  
  smooth();

  ang1 =  0.5 * (noise(millis()/1000.0) - 0.5);
  ang2 =  0.7 * (noise(millis()/2000.0) - 0.5);
  ang3 =  1.2 * (noise(millis()/1000.0) - 0.5);
  angFinger = 1.3 *(noise(millis()/900.0) - 0.5);
  angBody = 1.3*(noise(millis()/2000.0)-.5);
  angLeg = 0.8 * (noise(millis()/1000.0) - 0.5);


  noStroke();

  pushMatrix();
  //head
  translate(width/2-50, height*.1);
  fill(255);
  rect(0.0, 0.0, 100.0, 50, 10.0); 
  fill(0);
  ellipse(10, 10, 5, 5);
  ellipse(90, 10, 5, 5);
  fill(255);

  //neck
  translate(50, 47);
  rotate( ang1 ); 
  rect(-10, 0, 20, 30, 10); 

  //chest
  translate(0, 20); 
  rotate( ang2);
//  fill(0);
//  ellipse(0,0,10,10);
//  
//  fill(255);
  rect(-100, 0, 200, 70, 20);

  pushMatrix();
  
  drawArmAndFingersLeft();
  popMatrix();
  pushMatrix();
  drawArmAndFingersRight();
  popMatrix();
  
  drawBody();
  pushMatrix();
  drawLeftLeg();
  popMatrix();
  drawRightLeg();




  //popMatrix();
  popMatrix();
}


void drawLeftLeg(){
  fill(255);
  translate(-30,95);
  //rotate(radians(20));
  rotate(angLeg);
  rect(0,0,20,100,4);
  
  translate(0,95);
  rotate(-radians(20));
  rotate(angLeg);
  rect(0,0,20,50,4);
  
  translate(0,45);
  fill(255,0,0);
  rect(20,0, -40,15,3);
  
  
}

void drawRightLeg(){
  fill(255);
  translate(30,95);
  //rotate(-radians(20));
  rotate(-angLeg);
  rect(0,0,-20,100,4);
  
  translate(0,95);
  rotate(radians(20));
  rotate(-angLeg);
  rect(0,0,-20,50,4);
  
  translate(0,45);
  fill(255,0,0);
  rect(-20,0, 40,15,3);
  
}

void drawBody(){
  translate(0,64);
  rotate(angBody);
//  fill(0);
//  ellipse(0,0,10,10);
//  
//  fill(255);
  rect(-40,0,80,100,10);
  
}

void drawArmAndFingersLeft(){
  //arms
  translate(-90, 35);
  rotate(radians(-270));
  rotate(ang3);
  rect(0, 0, 100, 30, 5);

  translate(95, 0);
  rotate(ang3);
  rect(0, 10, 70, 20, 5);
  
  //fingers
  translate(65, 10);
  rotate(angFinger);
  rect(0, 0, 30, 6, 2);

  translate(0, 10);
  rotate(radians(10));
  rotate(angFinger);
  rect(0, 0, 30, 6, 2);
  
  translate(0, 5);
  rotate(radians(10));
  rotate(angFinger);
  rect(0, 0, 30, 6, 2);
  
}

void drawArmAndFingersRight(){
  //arms
  translate(90, 35);
  rotate(radians(-270));
  rotate(-ang3);
  rect(0, 0, 100, -30, -5);

  translate(95, 0);
  rotate(-ang3);
  rect(0, -10, 70, -20, 5);
  
  //fingers
  translate(65, -10);
  rotate(-angFinger);
  rect(0, 0, 30, -6, 2);

  translate(0, -10);
  rotate(radians(-10));
  rotate(-angFinger);
  rect(0, 0, 30, -6, 2);
  
  translate(0, -5);
  rotate(radians(-10));
  rotate(-angFinger);
  rect(0, 0, 30, -6, 2);
  
}
