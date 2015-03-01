
float r = int(random(0, 255));
float g = int(random(0, 255));
float b = int(random(0, 255));


void setup() {
  size(400, 400);
  background(245, 217, 180);
  strokeWeight(2.5); 
  smooth();

  //left eye
  fill(255);
  ellipse(100, 200, 120, 55);
  //color
  fill(10, 250, 152);
  ellipse(100, 200, 50, 50);
  //pupil
  fill(0);
  ellipse(100, 200, 25, 25);
  //lashes
  line(45, 188, 35, 178);
  line(60, 179, 50, 169);
  line(75, 174, 65, 164); 
  line(90, 172, 80, 162);
  line(105, 172, 95, 162); 
  line(120, 173, 110, 163);
  line(135, 177, 125, 167); 
  line(150, 185, 140, 172);

  //right eye
  fill(255);
  ellipse(300, 200, 120, 55);
  //color
  fill(10, 250, 152);
  ellipse(300, 200, 50, 50);
  //pupil
  fill(0);
  ellipse(300, 200, 25, 25);
  //lashes
  line(250, 185, 260, 172);
  line(265, 177, 275, 167);
  line(280, 173, 290, 163);
  line(295, 172, 305, 162);
  line(310, 172, 320, 162);
  line(325, 174, 335, 164); 
  line(340, 179, 350, 169);
  line(355, 188, 365, 178);

  //nose round
  noFill();
  ellipse(200, 326, 75, 40);
  //dumb nose
  noStroke();
  fill(245, 217, 180);
  rectMode(CORNERS);
  rect(176, 260, 224, 325);
  //nose lines
  stroke(0);
  line(175, 260, 175, 310);
  line(225, 260, 225, 310);

  //mouth
  fill(232, 87, 87);
  ellipse(200, 407, 120, 45);
}


void draw() {
  //triangle color change
  r = int(random(50, 250));
  b = int(random(50, 250)); 
  
  frameRate(5);
  fill(r,0,b); 
  triangle(100, 130, 300, 130, 200, 10);

  //third eye
  fill(255);
  ellipse(200, 85, 90, 45);
  //color
  fill(162, 81, 206);
  ellipse(200, 85, 40, 40);
  //pupil
  fill(0);
  ellipse(200, 85, 18, 18);
}

void mousePressed() {
  fill(245, 217, 180);
  //left eye
  ellipse(100, 200, 120, 55);

  //right eye
  ellipse(300, 200, 120, 55); 
}

void mouseReleased(){
  //left eye
  fill(255);
  ellipse(100, 200, 120, 55);
  //color
  fill(10, 250, 152);
  ellipse(100, 200, 50, 50);
  //pupil
  fill(0);
  ellipse(100, 200, 25, 25);
  
   //right eye
  fill(255);
  ellipse(300, 200, 120, 55);
  //color
  fill(10, 250, 152);
  ellipse(300, 200, 50, 50);
  //pupil
  fill(0);
  ellipse(300, 200, 25, 25);
}
