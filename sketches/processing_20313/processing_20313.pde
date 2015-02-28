
void setup() {
  size(900,900);
  background(0,0,0);
  smooth();
}
void draw() {
  noStroke();
  fill(255);
  //rectMode(CENTER);
  fill(random(255),random(255),random(255));
}
void keyPressed(){
  int e1=int(random(150,2));
  noStroke();
  fill(108,255,0,50);
  ellipse(mouseX,mouseY,e1,e1);
   if(key=='s') {
    saveFrame();
  }
}
void mousePressed(){
  int e1=int(random(150,2));
  noStroke();
  fill(0,0,0,50);
  ellipse(mouseX,mouseY,e1,e1);
}
                
                                                                
