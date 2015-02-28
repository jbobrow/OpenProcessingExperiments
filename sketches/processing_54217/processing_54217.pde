
color bgColor = color(0);

void setup() {
  size(700,700);
  smooth();
  background(0);
  mouseX=width/2; mouseY=height;
}

void draw() {
  //blue//
  stroke(random(255));
  strokeWeight(random(5));  
  float s=random(70);
  fill(75,213,random(255));
  ellipse(mouseX,mouseY,s,s);
  
  //pink//
  stroke(255);
  strokeWeight(random(5));
  float t=random(50);
  fill(237,109,random(255));
  ellipse(mouseX,mouseY/2,t,t);
  
  //yellow//
  stroke(0);
  strokeWeight(random(1));
  float r=random(30);
  fill(255,231,random(255)); 
//  noStroke();
  ellipse(mouseX,mouseY/5,r,r);

}

void keyPressed() {
  if (key==' ') {
    background(bgColor);
  }
}

