
void setup(){
  size(300,300);
  background(255,255,255);
}
 
void draw(){
  noFill();
  stroke(255,0,0);
  beginShape();
vertex(30, 250);
bezierVertex(30,250, 115,230, 80,170);
bezierVertex(80,170, 40, 70, 150,110);
bezierVertex(150,110, 170,120, 150,90);
bezierVertex(150,90, 110,10, 190,80);
bezierVertex(190,80, 200,100, 260,125);
bezierVertex(260,125, 300,140, 290,180);
bezierVertex(290,180, 280,200, 285,230);
bezierVertex(285,230, 282,240, 260,230);
endShape();

}


