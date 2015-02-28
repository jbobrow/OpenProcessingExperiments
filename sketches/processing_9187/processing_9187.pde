
void setup () {
  size(500,500);
}



void draw () {
  //background(255);
  //println(mouseX + "," + mouseY);
  //ellipse(mouseX, mouseY, 10, 10);
  stroke(mouseX, mouseY, 0);
  strokeWeight(abs(mouseX+pmouseY));
  point(pmouseX, mouseY) ;
  point(pmouseY, mouseX) ;
}

void mousePressed() {
  point(210, 200);
  point(200, 210);
}

void mouseDragged () {
  stroke(10);
  fill(0,255,0,125);
  arc(140,145,140,140,0, PI/2);
  noFill();

  stroke(10);
  fill(0,255,0,125);
  arc(140,145,100,100,0, PI/2);
  noFill();

  stroke(10);
  fill(0,255,0,125);
  arc(340,345,240,240,0, PI/2);
  noFill();

  stroke(10);
  fill(0,255,0,125);
  arc(340,345,200,200,0, PI/2);
  noFill();

  stroke(10);
  fill(0,255,0,125);
  arc(340,345,150,150,0, PI/2);
  noFill();

  stroke(10);
  fill(0,255,0,125);
  arc(340,345,100,100,0, PI/2);
  noFill();

  stroke(10);
  fill(0,255,0,125);
  arc(340,345,50,50,0, PI/2);
  noFill();

}


