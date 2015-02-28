
void setup(){
  size(500,300);
}

void draw(){
  background(#2C3539);
  beginShape();
  vertex(214,90);
  vertex(251,125);
  vertex(288,90);
  vertex(395,90);
  vertex(432,125);
  vertex(467,90);
  vertex(467,195);
  vertex(432,163);
  vertex(414,198);
  vertex(378,233);
  vertex(305,233);
  vertex(269,198);
  vertex(251,163);
  vertex(216,195);
endShape(CLOSE);

fill(mouseX,mouseY, 40);
rect(288,125,20, 20);
rect(380,125,20, 20);

beginShape();
vertex(305, 162);
vertex(377, 162);
vertex(305, 178);
vertex(377, 178);
endShape(CLOSE);

beginShape();
vertex(323,197);
vertex(323,215);
vertex(359,215);
vertex(359,198);
endShape(CLOSE);


}



