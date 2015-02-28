
int x = 375;
int y = 175;
int r = 50;


void setup() {
  size(600,600);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  background(0); 

  //quad 1~10
  fill(0,230,191);
  quad(0,0, 240,0, 100,140, 0,40);
  fill(0,93,70);
  quad(120,140, 240,20, 246,26, 126,146);

  fill(164,216,204);
  quad(0,340, 200,140, 280,220, 0,500);
  fill(61,90,85);
  quad(380,120, 500,0, 580,0, 420,160);

  fill(176,227,217);
  quad(480,120, 600,0, 600,10, 485,125); 
  fill(81,170,153);
  quad(500,200, 600,100, 600,220, 560,260);

  fill(180,234,224);
  quad(440,280, 480,240, 600,360, 600,440);
  fill(8,77,64);
  quad(515,380, 520,375, 600,455, 600,465); 

  fill(39,144,124);
  quad(240,540, 250,530, 320,600, 300,600);
  fill(61,90,85);
  quad(80,540, 140,480, 260,600, 140,600);


  //ellipse 1~4
  noFill();
  stroke(208,242,236);
  strokeWeight(4);
  ellipse(290,130, 100,100);
  noFill();
  stroke(188,255,242);
  strokeWeight(2);
  ellipse(210,260, 380,380);
  noFill();
  stroke(165,227,215);
  strokeWeight(6);
  ellipse(315,395, 150,150);


  //vertex
  noStroke();
  fill(27,180,151);
  beginShape();
  vertex(320,520);
  vertex(440,400);
  vertex(600,560);
  vertex(600,600);
  vertex(400,600);
  vertex(320,520);
  endShape();


  /*project2*/


  /* moving quad */
  noCursor();
  noStroke();
  fill(237,255,252);
  quad(mouseX+12,mouseY-17, 600,500, 600,520, mouseX,mouseY);


  /* bigging ellipse */
  fill(255);
  float d = dist(mouseX, mouseY, x, y);
  if(key=='P'||key=='p') { 
    r = r+2;
  }
  else {
    fill(255);
  }
  ellipse(x, y, r, r);


  /* click to color reverse */
  if(mousePressed == true) {

    background(255);

    //quad 1~10
    fill(255,25,64);
    quad(0,0, 240,0, 100,140, 0,40);
    fill(255,162,185);
    quad(120,140, 240,20, 246,26, 126,146);

    fill(91,39,41);
    quad(0,340, 200,140, 280,220, 0,500);
    fill(189,165,170);
    quad(380,120, 500,0, 580,0, 420,160);

    fill(79,28,38);
    quad(480,120, 600,0, 600,10, 485,125); 
    fill(174,85,112);
    quad(500,200, 600,100, 600,220, 560,260);

    fill(75,21,31);
    quad(440,280, 480,240, 600,360, 600,440);
    fill(247,188,181);
    quad(515,380, 520,375, 600,455, 600,465); 

    fill(216,111,131);
    quad(240,540, 250,530, 320,600, 300,600);
    fill(194,165,170);
    quad(80,540, 140,480, 260,600, 140,600);


    //ellipse 1~4
    noFill();
    stroke(47,13,19);
    strokeWeight(4);
    ellipse(290,130, 100,100);
    noFill();
    stroke(67,0,13);
    strokeWeight(2);
    ellipse(210,260, 380,380);
    noFill();
    stroke(90,28,40);
    strokeWeight(6);
    ellipse(315,395, 150,150);
    fill(0);
    noStroke();
    ellipse(x, y, r, r);


    //vertex
    noStroke();
    fill(228,75,104);
    beginShape();
    vertex(320,520);
    vertex(440,400);
    vertex(600,560);
    vertex(600,600);
    vertex(400,600);
    vertex(320,520);
    endShape();

    //moving quad
    noStroke();
    fill(18,0,3);
    quad(mouseX+12,mouseY-17, 600,500, 600,520, mouseX,mouseY);
  }
}


