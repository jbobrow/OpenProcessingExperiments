
PImage Me;
PImage Matrix;

void setup(){
  size(480,630);
  Me=loadImage("photo.JPG");
  Matrix=loadImage("matrix.jpg");
}

void draw(){

  image(Me,0,0);
  Me.filter(THRESHOLD);
  fill(0, 0, 0);
  stroke(0,160,0);
  beginShape();
  vertex(0,0);
  vertex(0, 545);
  vertex(100, 510);
  vertex(150, 440);
  vertex(165, 430);
  vertex(145, 360);
  vertex(106, 200);
  vertex(120, 110);
  vertex(130, 95);
  vertex(160, 70);
  vertex(180, 60);
  vertex(200, 50);
  vertex(230, 45);
  vertex(250, 0);
  endShape(CLOSE);
  beginShape();
  vertex(250, 0);
  vertex(230, 45);
  vertex(245, 50);
  vertex(260, 55);
  vertex(280, 60);
  vertex(300, 65);
  vertex(330, 80);
  endShape(CLOSE);
  beginShape();
  vertex(480, 0);
  vertex(480, 505);
  vertex(470, 485);
  vertex(450, 470);
  vertex(430, 460);
  vertex(400, 455);
  vertex(375, 460);
  vertex(365, 465);
  vertex(355, 468);
  vertex(345, 470);
  vertex(315, 445);
  vertex(295, 430);
  vertex(295, 410);
  vertex(300, 400);
  vertex(315, 360);
  vertex(320, 320);
  vertex(330, 280);
  vertex(350, 200);
  vertex(360, 160);
  vertex(320, 70);
  vertex(250, 0);
  endShape(CLOSE);
  rect(20, 30, 40, 100);
  rect(30, 160, 30, 50);
  rect(350, 300, 20, 100);
  rect(400, 400, 40, 20);
  rect(400, 150, 20, 200);
  rect(60, 300, 60, 50);
  fill(0, 0, 0);
  stroke(160,0,0);
  beginShape();
  vertex(240, 229);
  vertex(270, 210);
  vertex(310, 220);
  vertex(320, 260);
  vertex(310, 320);
  vertex(263, 300);
  vertex(257, 292);
  vertex(250, 285);
  endShape(CLOSE);
  
  fill(160,0,0);
  int counter = 0;
  for(counter=0; counter<200; counter++)
  {
  if(counter/2>1)
  {
  ellipse(280, 247, 40, 40);
  }
  }
  stroke(160,0,0);
  line(280, 247, 250, 260);
  line(280, 247, 300, 200);
  line(300, 200, 320, 300);
  line(280, 247, 260, 310);
  line(260, 310, 300, 340);
}



