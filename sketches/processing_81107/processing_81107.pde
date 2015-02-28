
void setup(){ //Programn runs when any key is being held down.
  size(800,800);//When realesed programn will stop drawing.
  background(#4B4A3F);
  frameRate(100);
}
  void draw(){
    fill(#E85805);
    stroke(#E85805);
    ellipse(mouseX,mouseY,20,20);
    fill(#007CBC);
    stroke(#007CBC);
    ellipse(800-mouseX,800-mouseY,20,20);
  }
void keyPressed(){
  key='j';
  loop();
}
void keyReleased(){
  key='j';
  noLoop();
}
  



