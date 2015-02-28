


PImage img1;

void setup() {

  size(600,600);
  background(255);

  img1 = loadImage ("img1.jpg");
  smooth();
}

void draw() {


  fill(0);
  noStroke();
  beginShape();
  vertex(0,580);
  vertex(40,580);
  vertex(40,540);
  vertex(60,540);
  vertex(60,580);
  vertex(120,580);
  vertex(120,560);
  vertex(140,560);
  vertex(140,580);
  vertex(160,580);
  vertex(160,520);
  vertex(180,520);
  vertex(180,580);
  vertex(240,580);
  vertex(240,260);
  vertex(260,260);
  vertex(260,220);
  vertex(280,220);
  vertex(280,460);
  vertex(260,460);
  vertex(260,560);
  vertex(280,560);
  vertex(280,540);
  vertex(300,540);
  vertex(300,580);
  vertex(340,580);
  vertex(340,560);
  vertex(360,560);
  vertex(360,580);
  vertex(380,580);
  vertex(380,460);
  vertex(480,460);
  vertex(480,580);
  vertex(540,580);
  vertex(540,560);
  vertex(560,560);
  vertex(560,580);
  vertex(580,580);
  vertex(580,540);
  vertex(600,540);
  vertex(600,600);
  vertex(0,600);
  vertex(0,580);
  endShape();

  fill(120);
  noStroke();
  rect(20,300,160,200);

  fill(70);
  noStroke();
  rect(300,80,300,320);

  fill(255);
  noStroke();
  rect(340,120,240,240);

  image (img1,320,120);

  fill(0);
  noStroke();
  rect(140,320,240,20);

  fill(200);
  noStroke();
  rect(0,100,80,40);
  rect(60,140,60,20);
  rect(120,100,60,10);
  rect(120,110,20,10);
  rect(140,80,60,10);


  fill(200);
  noStroke();
  beginShape();
  vertex(60,0);
  vertex(440,0);
  vertex(440,10);
  vertex(380,10);
  vertex(380,40);
  vertex(340,40);
  vertex(340,20);
  vertex(260,20);
  vertex(260,40);
  vertex(300,40);
  vertex(300,60);
  vertex(260,60);
  vertex(260,70);
  vertex(180,70);
  vertex(180,60);
  vertex(200,60);
  vertex(200,40);
  vertex(60,40);
  vertex(60,0);
  endShape();


  if(mousePressed) {
    fill(0,0,255);
  } 
  else {
    fill(255,0,0);
  }
  ellipse(mouseX,mouseY,30,30);
}


