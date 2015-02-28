
int ellipseSize = 100;

void setup(){
  size(400,600);
  background(128, 211, 176);
}

void draw(){
  noStroke();
  fill(250, 218, 114);
  ellipse(200, 100, ellipseSize, ellipseSize); //head
  
  fill(0);
  stroke(0);
  strokeWeight(2);  
  ellipse(190, 80, 10, 10); //lefteye
  ellipse(210, 80, 10, 10); //righteye

  stroke(0);
  strokeWeight(5); 
  line(200, 150, 200, 400); //body  
  line(50, 250, 200, 200 ); //right arm
  line(350, 250, 200, 200 ); //left arm
  line(100, 550, 200, 400 ); //right leg
  line(300, 550, 200, 400 ); //right leg
  
}


