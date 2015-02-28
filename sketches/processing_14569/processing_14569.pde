
void setup() {
  size(300,300);
  background(0);
}
void draw() {
  for( float y=0; y<300; y=y+30) {
    for( float x=0; x<300; x=x+30 ) {
      pushMatrix();
      translate(x,y);
      rotate(radians(frameCount*5));
      translate(x/2,y/2);
      rotate(radians(frameCount*5));
      scale(0.2);
      mydraw();
      popMatrix();
    }
  }
}
void mydraw() {
  fill(60);
  ellipse(68,45,30,30);
  ellipse(130,45,30,30);
  //얼굴
  fill(60);
  ellipse( 100, 90, 120, 100 );
  fill( 0 );
  ellipse(70,80,10,20);
  ellipse(130,80,10,20);
  //입
  fill(60);
  ellipse(100,120,150,60);
  strokeWeight(2);
  ellipse(80,115,10,10);
  ellipse(120,115,10,10);
  strokeWeight(1);
  line(50,128,150,128);
  //이빨
  fill(255);
  beginShape();
  vertex(60,128);
  vertex(60,135);
  vertex(70,135);
  vertex(70,128);
  endShape(CLOSE);

  fill(255);
  beginShape();
  vertex(125,128);
  vertex(125,135);
  vertex(135,135);
  vertex(135,128);
  endShape(CLOSE);
}
           
                
