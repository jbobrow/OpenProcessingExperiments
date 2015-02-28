


void setup(){
  size(200,150);
  smooth();
  background(0);
  frameRate(50);
  
}

void draw(){
  stroke(mouseX,0,mouseY);
  float distance =dist(pmouseX,pmouseY, mouseX, mouseY);
  float maxStroke =8;
  strokeWeight(maxStroke - constrain(distance,0,maxStroke));
   fill(242,171,100);
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill(166, 252,234,100);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/6, (inverseY/6)+20, (inverseY/6)+20);
  fill(125,252,126, 100);
  ellipse(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);


}

void keyPressed(){
  background(0);
}

void mousePressed(){
  background(255);
} 

