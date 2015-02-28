
void setup() {
  size(600, 600);
  smooth();
  rectMode(CENTER);

}

void draw() {
  background(250, 250, 250);
  

  

  //blue lollipop
  pushMatrix();
    translate(50, 0);
    rotate(map(mouseX, 0, width, -2, 2));
    fill(255, 0, 0);
    line(width/2, height/2, 100, 500);
  popMatrix();
  
  strokeWeight(30);
  
  pushMatrix();
    rotate(map(mouseX, 0, width, -2, 2));
    translate(50, 0);
    fill(103, 244, 255);
    ellipse(width/2, height/2, 100, 100);
  popMatrix();
  
  //pink lollipop
   pushMatrix();
    translate(-200, 0);
    rotate(map(mouseX, 0, width, -2, 2));
    fill(255, 0, 0);
    line(width/2, height/2, 100, 500);
  popMatrix();
  
  strokeWeight(30);
  
  pushMatrix();
    rotate(map(mouseX, 0, width, -2, 2));
    translate(-200, 0);
    fill(255, 57, 103);
    ellipse(width/2, height/2, 100, 100);
  popMatrix();
  
  
  //yellow lollipop
   pushMatrix();
    translate(300, 0);
    rotate(map(mouseX, 0, width, -2, 2));
    fill(255, 0, 0);
    line(width/2, height/2, 100, 500);
  popMatrix();
  
  strokeWeight(30);
  
  pushMatrix();
    rotate(map(mouseX, 0, width, -2, 2));
    translate(300, 0);
    fill(254, 255, 33);
    ellipse(width/2, height/2, 100, 100);
  popMatrix();
  
  
    textSize(30);
    fill(0);
  text("Yum!", 10, 30);
  

}
