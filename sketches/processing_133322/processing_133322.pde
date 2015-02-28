
void setup() {

  size(650, 450);
  background(100, 100, 90);

  //estrelas
  for (int j =0; j<650; j=j+25) {
    float i= random (650);
    point (i, j);
  }
}

int a=450;
int x;
void draw() { 
  strokeWeight(1);
  background(81, 79, 162);
  x++; 
  // Nuvens
  noStroke();
  fill (255);
  ellipse (x-500, 20, 110, 5);
  ellipse (x+175, 90, 89, 5);
  ellipse (x+150, 70, 150, 7);
  ellipse (x-100, 50, 130, 5);
  ellipse (x-175, 120, 100, 9);
  ellipse (x-120, 100, 90, 5);
  ellipse (x-400, 110, 70, 5);
  ellipse (x-450, 130, 80, 5);

  if (x>width) 
    x=0;

  //estrelas
  strokeWeight(2);
  stroke(223, 223, 240);
  for (int j =0; j<650; j=j+25) {
    float i= random (650);
    point (i, j);
  }
//fogos1:
  strokeWeight(2);
  stroke(200, 227, 170);
  point(random(0, 700), random(0, 700));
  noStroke();

  fill(255);
  if (a>150)
    ellipse(230, a, 5, 5);
  else
  { 

    for (int i=0; i<20; i++)
    {
      stroke(random(255), random(255), random(255));
      line(300, a, 300+ random(-90, 90), a+random(-90, 90));
    }
  }    
  a=a-1;
  if (a<50) {
    a=400;
  }
  //fogos2:
  noStroke();

  fill(255);
  if (a>150)
    ellipse(380, a, 5, 5);
  else
  { 

    for (int i=0; i<20; i++)
    {
      stroke(random(255), random(255), random(255));
      line(400, a, 400+ random(-90, 90), a+random(-90, 90));
    }

  }    a=a-1;
    if (a<50) {
      a=400;
    }


  //Torres, ponte
  smooth();
  noStroke();
  rectMode(CORNERS);

  //Lua
  fill(250, 248, 197);
  ellipse(56, 46, 55, 55);

  //lago
  fill(29, 132, 178);
  rect(0, 350, 650, 450);

  // lua no lago
  fill(250, 248, 197, 70);
  ellipse(56, 400, 50, 55);


  fill(188, 47, 47);
  stroke(0);

  //Torres
  beginShape();
  vertex(75, 400);
  vertex(75, 325);
  vertex(95, 325);
  vertex(95, 75);
  vertex(165, 75);
  vertex(165, 325);
  vertex(185, 325);
  vertex(185, 400);
  vertex(75, 400);
  endShape();

  beginShape();
  vertex(575, 400);
  vertex(575, 325);
  vertex(555, 325);
  vertex(555, 75);
  vertex(485, 75);
  vertex(485, 325);
  vertex(465, 325);
  vertex(465, 400);
  vertex(575, 400);
  endShape();

  strokeWeight(3);
  line(556, 325, 484, 325);
  line(556, 315, 484, 315);
  line(556, 275, 484, 275);
  line(556, 265, 484, 265);
  line(556, 175, 484, 175);
  line(556, 165, 484, 165);
  line(556, 125, 484, 125);
  line(556, 115, 484, 115);

  line(94, 325, 166, 325);
  line(94, 315, 166, 315);
  line(94, 275, 166, 275);
  line(94, 265, 166, 265);
  line(94, 175, 166, 175);
  line(94, 165, 166, 165);
  line(94, 125, 166, 125);
  line(94, 115, 166, 115);

  strokeWeight(1);
  fill(188, 47, 47);
  //triãngulos centro, coloridos
  triangle(535, 85, 505, 85, 520, 15);
  triangle(115, 85, 145, 85, 130, 15);
  fill(175);
  triangle(95, 75, 115, 75, 105, 25);
  triangle(165, 75, 145, 75, 155, 25);
  triangle(555, 75, 535, 75, 545, 25);
  triangle(485, 75, 505, 75, 495, 25);

  //cabos base
  fill(188, 47, 47);
  rect(165, 135, 485, 155);
  rect(555, 310, 650, 325);
  rect(0, 310, 95, 325);
  fill(255);
  rect(0, 312, 90, 318);
  rect(560, 312, 650, 318);
  rect(170, 140, 480, 150);

  stroke(255);
  fill(0);
  rectMode(CENTER);
  rect(130, 300, 5, 20);
  rect(120, 300, 5, 20);
  rect(140, 300, 5, 20);
  rect(510, 300, 5, 20);
  rect(530, 300, 5, 20);
  rect(520, 300, 5, 20);
  rect(130, 250, 5, 20);
  rect(120, 250, 5, 20);
  rect(140, 250, 5, 20);
  rect(510, 250, 5, 20);
  rect(530, 250, 5, 20);
  rect(520, 250, 5, 20);
  rect(130, 150, 5, 20);
  rect(120, 150, 5, 20);
  rect(140, 150, 5, 20);
  rect(510, 150, 5, 20);
  rect(530, 150, 5, 20);
  rect(520, 150, 5, 20);

  //bases que levantam
  strokeWeight(15);
  stroke(160);
  pushMatrix();
  translate(185, 325);
  rotate(radians((-325+mouseY)/10));
  line(0, 0, 135, 0);
  popMatrix();
  translate(465, 325);
  rotate(PI-radians((-325+mouseY)/10));
  line(0, 0, 135, 0);
}

