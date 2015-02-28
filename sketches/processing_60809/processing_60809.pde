
void setup() {
  size(400, 400);
  fill(0);
  stroke(0);
  strokeWeight(1);
  smooth();
}

void draw() {
  background(255); 
  ellipse(width/2, height/2, 10, 10);    //center
    
  pushMatrix();                          //planet 1
    translate(width/2, height/2);
    rotate(millis()*0.001*PI/2);
    line(0,0,50,0);
    translate(50, 0);
    ellipse(0, 0, 15, 15);
    pushMatrix();
      rotate(millis()*0.001*PI);
      line(0, 0, 20, 0);
      translate(20,0);
      ellipse(0, 0, 5, 5);
    popMatrix();
    pushMatrix();
      rotate(millis()*0.001*TWO_PI);
      line(0, 0, -15, 0);
      translate(-15,0);
      ellipse(0, 0, 5, 5);
    popMatrix();
  popMatrix();    

  pushMatrix();                          //planet 2
    translate(width/2, height/2);
    rotate(millis()*0.001*PI/5);
    line(0, 0, -90, 0);
    translate(-90, 0);
    ellipse(0, 0, 20, 20);
    pushMatrix();
      rotate(millis()*0.001*PI/1.5);
      line(0, 0, 30, 0);
      translate(30, 0);
      ellipse(0, 0, 10, 10);
    popMatrix();
    pushMatrix();
      rotate(millis()*0.001*PI/1.5);
      line(0, 0, -20, 0);
      translate(-20,0);
      ellipse(0, 0, 5, 5);
    popMatrix();
  popMatrix();

  pushMatrix();                          //planet 3
    translate(width/2, height/2);
    rotate(millis()*0.001*PI/3);
    line(0,0,160,0);
    translate(160, 0);
    ellipse(0, 0, 30, 30);
    pushMatrix();
      rotate(millis()*0.001*PI/1.5);
      line(0, 0, 30, 0);
      translate(30,0);
      ellipse(0, 0, 10, 10);
    popMatrix();
    pushMatrix();
      rotate(millis()*0.001*PI/2);
      line(0, 0, 50, 0);
      translate(50,0);
      ellipse(0, 0, 15, 15);
    popMatrix();
  popMatrix();
}
   

