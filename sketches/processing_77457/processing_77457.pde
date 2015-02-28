

void setup () {
  size(800, 600);
  background(255);
  smooth();
  
}
void draw () {
  background(255);
  translate(mouseX,mouseY);//(mouseX+random(-1,1),mouseY+random(-1,1));
  strokeWeight(2);
  beginShape();
  for(int i=1;i<5000;i++)

  {
    curveVertex((i*0.2)*sin(i/4.0),(i*0.2)*cos(i/4.0));
  }
  endShape();
}



