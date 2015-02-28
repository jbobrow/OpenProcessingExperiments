
void setup(){
  size(800,800);
  background(10,63,247);
}
void keyPressed(){
  background(6,0,0);
}
void keyReleased(){
  background(10,63,247);
}
void draw(){
  ellipse();
  ellipse2();
}
void ellipse(){
  ellipse(mouseX,150,300,300);
  fill(60,255,12);
  if(keyPressed){
    fill(20,90,4);
  }
}
void ellipse2(){
  ellipse(mouseX,650,300,300);
  fill(50,0,255);
  if(keyPressed){
    fill(40,3,80);
  }
}

