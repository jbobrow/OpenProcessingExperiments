
void setup() {
  size(600, 600, P3D);
  noStroke();

  rectMode(CENTER);

  //  frameRate(10);
}

void draw() {
  background(0);
//  if (mousePressed) {
//    fill(100, 50, 0, 70);
//  }
//  else {
//    fill(250, 40, 25, 70);
//  }

  translate(mouseX, mouseY);
  for (int i=0; i<1000; i++) {
    fill(i/10.0, i/50.0, i/18.0, i*100);
    rotateZ(i/1000.0*TWO_PI);
    unit();
  }

  println(frameRate);
}


void unit() {
  pushMatrix();

  rotateZ(frameCount/80.0);
  rotateX(frameCount/100.0);
  rotateY(frameCount/50.0);
  
  ellipse(mouseX*0.3, mouseY*0.3, 5+mouseX*0.2, 5+mouseY*0.2);  
  
  popMatrix();
}


// comand + /
//void mousePressed(){
//  fill(255,0,0);
//  rect(300,20,55,55);
//}
//
//void mouseReleased(){
//  fill(255,255,255);
//  rect(300,20,55,55);
//}


