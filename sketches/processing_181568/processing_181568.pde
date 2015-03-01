
void setup() {
  size(800,600);
}

void draw(){
  background(63,124,204);
  //Materhorn
  noStroke();
  strokeWeight(3);
  fill(120,120,120);
  beginShape();//maternorn outline
  vertex(140,300);
  vertex(300,210);
  vertex(320,140);
  vertex(355,125);
  vertex(356,95);
  vertex(375,60);//tip
  vertex(405,65);
  vertex(450,115);
  vertex(475,175);
  vertex(472,200);
  vertex(493,205);
  vertex(525,235);
  vertex(568,238);
  vertex(680,290);
  vertex(680,500);
  vertex(140,500);
  endShape();
  fill(200,200,200);
  beginShape();//materhorn shadow
  vertex(375,60);
  vertex(400,120);
  vertex(420,125);
  vertex(410,143);
  vertex(400,200);
  vertex(200,400);
  vertex(140,300);
  vertex(300,210);
  vertex(320,140);
  vertex(355,125);
  vertex(356,95);
  endShape();
  fill(85,123,42);
  beginShape();//mid hill
  curveVertex(0,240);
  curveVertex(60,245);
  curveVertex(120,255);
  curveVertex(180,267);
  curveVertex(240,290);
  curveVertex(300,325);
  curveVertex(360,380);
  curveVertex(500,540);
  curveVertex(0,240);
  endShape();
  beginShape();
  vertex(0,243);
  vertex(60,243);
  vertex(400,420);
  vertex(0,600);
  endShape();
  strokeWeight(3);
  fill(108,133,31);
  beginShape();//foreground
  vertex(0,520);
  vertex(0,600);
  vertex(800,600);
  vertex(800,200);
  endShape();
  fill(68,78,18);
  beginShape();
  vertex(200,500);
  vertex(300,500);
  vertex(250,250);
  endShape();
  beginShape();
  vertex(550,420);
  vertex(650,420);
  vertex(600,170);
  endShape();
  beginShape();
  vertex(600,450);
  vertex(700,450);
  vertex(650,200);
  endShape();
  beginShape();
  vertex(180,530);
  vertex(220,530);
  vertex(200,430);
  endShape();
  fill(185,130,92);//House
  rect(450,400,120,70);
  stroke(4);
  stroke(62,37,19);
  beginShape();
  vertex(440,400);
  vertex(580,400);
  vertex(510,360);
  vertex(440,400);
  endShape();
  line(450,407,570,407);
  line(450,414,570,414);
  line(450,421,570,421);
  line(450,428,570,428);
  line(450,435,570,435);
  line(450,442,570,442);
  line(450,449,570,449);
  line(450,456,570,456);
  line(450,463,570,463);
  line(450,470,570,470);
  rect(500,420,20,50);
  rect(465,425,20,20);
  rect(535,425,20,20);
  noStroke();
  fill(200,30,30);
  rect(500,373,20,20);
  stroke(5);
  stroke(254,254,254);
  line(505,383,514,383);
  line(510,377,510,388);
  
  
  
  
  
  
}


