
float xSpeed = .125;
float xPos =1;
float opacity;
int rot, num;

void setup() {
  size (500, 500); 
  background(0);
  num = 1;
  rot = 0;
  opacity = 150;
}

void draw () {
  rot++;
  fill(0, 10);
  rect(0, 0, width, height);

  translate(width/2, height/2);
  noStroke();
  rotate(radians(rot));
  for (int i=0; i<num; i++) {
    rotate(radians(360/num * i));
  }
//mousePressed();


  //red circle
  pushMatrix();
  //rotate(radians(90));
  fill(255, 0, 0, opacity);
  bounce (xPos, 0, 200); 
  popMatrix();

  //purple circle
  pushMatrix();
  fill(128, 3, 255, opacity);
  rotate(radians(45));
  bounce (xPos, 0, 200); 
  popMatrix();

  //blue circle
  pushMatrix();
  fill(0, 50, 255, opacity);
  rotate(radians(90));
  bounce (xPos, 0, 200); 
  popMatrix();

  //cyan circle
  pushMatrix();
  fill(0, 250, 235, opacity);
  rotate(radians(135));
  bounce (xPos, 0, 200); 
  popMatrix();

  //green circle
  pushMatrix();
  fill(0, 150, 0, opacity);
  rotate(radians(180));
  bounce (xPos, 0, 200); 
  popMatrix();

  //yellow circle
  pushMatrix();
  fill(255, 255, 60, opacity);
  rotate(radians(225));
  bounce (xPos, 0, 200); 
  popMatrix();

  //orange circle
  pushMatrix();
  fill(255, 150, 0, opacity);
  rotate(radians(270));
  bounce (xPos, 0, 200); 
  popMatrix();

  //redorange circle
  pushMatrix();
  fill(250, 109, 0, opacity);
  rotate(radians(-45));
  bounce (xPos, 0, 200); 
  popMatrix();
  
}

void bounce (float x, float y, float size) {
  xPos= xPos + xSpeed;
  ellipse (xPos, y, size, size);

  if (xPos >= width*.5) {
    xSpeed = xSpeed * -1;
  }
  if (xPos <= 0) {
    xSpeed = xSpeed * -1;
  }
}

void mousePressed() {
  if (opacity == 150) {
    opacity = random(10, 200);
  } else{
  opacity = 150;
  }
  }

void keyPressed(){
 if (xSpeed == .125){
 xSpeed = random(.0625, 2);
 } 
 else{
  xSpeed = .125; 
 }
}


