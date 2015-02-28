
//When mouse pressed, everything will stop and when mouse is released, the colors will start to change again. 
void setup() {
size(400,400);
frameRate(8);
}
void draw() {
  background(random(200,255));
for (int x=0; x<=400; x+=30)
for (int y=0; y<=400; y+=30) {
  //stroke(255);
  //strokeWeight(2);
  //line(x,y,width/2, height/2);
  fill(random(255),random(255),random(255));
  noStroke();
  ellipse (x,y,x/10,y/10);
}
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}


  


