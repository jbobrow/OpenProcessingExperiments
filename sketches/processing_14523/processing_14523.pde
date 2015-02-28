

void setup() {
  size(500,500);
}

void draw() {
  background(255);

  for(float y= 0; y<=500; y=y+40)
  {
    for(float x= 0; x<=500; x=x+40)
    {
      pushMatrix();
      translate(x,y);
      rotate(radians(frameCount+x));
      scale(0.3);
      rect(0,0,10,10);
      kang_draw();
      popMatrix();
    }
  }
}

void kang_draw() {

  //얼굴
  noStroke();
  fill(252,198,248);
  ellipse(100,90,140,140);
  //눈(화이트써클)
  int x=30;
  fill(255);
  ellipse(70,70+x,25,25);
  ellipse(135,70+x,25,25);

  //눈(초록)
  int a=30;
  fill(10,166,130);
  ellipse(70,70+a,20,20);
  ellipse(135,70+a,20,20);

  //눈(흰자)
  int b= 30;
  fill(255);
  ellipse(60,75+a,5,5);
  ellipse(125,75+a,5,5);

  //입
  fill(186,17,91);
  beginShape();
  vertex(95,115);
  vertex(110,115);
  vertex(103,125);
  endShape(CLOSE);

  //귀
  fill(252,198,248);
  beginShape();
  vertex(65,30);
  vertex(40,75);
  vertex(25,25);
  endShape(CLOSE);

  beginShape();
  vertex(130,30);
  vertex(160,65);
  vertex(175,30);
  endShape(CLOSE);

  //귓구멍
  fill(5,1,4);
  beginShape();
  vertex(55,35);
  vertex(40,55);
  vertex(35,35);
  endShape(CLOSE);

  beginShape();
  vertex(140,35);
  vertex(160,55);
  vertex(165,35);
  endShape(CLOSE);


  //다리
  fill(186,17,91);
  beginShape();
  vertex(85,160);
  vertex(60,170);
  vertex(115,160);
  vertex(145,170);
  endShape(CLOSE);
}
            
