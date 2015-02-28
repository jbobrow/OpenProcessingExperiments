
void setup() {
  smooth();
  size (800, 600);
  
}
void draw () {
  stroke (30,mouseY,139);
  strokeWeight (30);
  fill (mouseX,180,100,150);
  ellipse (width/2,height/2,mouseX,mouseY);
  ellipse (width/2+250,height/2,mouseX,mouseY);
  ellipse (width/2-250,height/2,mouseX,mouseY);
  ellipse (width/2,height/2-200,mouseX,mouseY);
  ellipse (width/2+250,height/2-200,mouseX,mouseY);
  ellipse (width/2-250,height/2-200,mouseX,mouseY);
  ellipse (width/2,height/2+200,mouseX,mouseY);
  ellipse (width/2+250,height/2+200,mouseX,mouseY);
  ellipse (width/2-250,height/2+200,mouseX,mouseY);
  //saveFrame("gabriele_01_###.png");
}



