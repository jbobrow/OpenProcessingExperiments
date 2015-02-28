
float x1, x2, y1, y2;
float bx1, by1, bx2, by2;
float w1, h1, n1;
float d, d1, dx, dy;
float r, g, b, bw;
float r1, g1, b1;
float neck, mouthx, mouthy, earx, eary, bulb;
float spacer;
float alph;

float liny1;
float liny2;

void setup()
{
  smooth();
  strokeCap(SQUARE);
  size(900, 375);
  noLoop();
}

void draw()
{
  background(255);
  spacer = width/4.1;
  for (int i = 120; i<width; i+=spacer)
  {
    x1 = random(30, 40);
    y1 = random(15, 35);
    x2 = random(35, 45);
    y2 = random(35, 45);
    n1 = random(4, 10);

    d = random(6, 12);
    d1 = random(4, 20);
    dx = random(17, 20);
    dy = random (-5, 7);
    neck = random(20, 45);
    mouthx = random(20, 60);
    mouthy = random(0, 12);

    r = random(255);
    g = random(255);
    b = random(255);
    r1 = random(255);
    g1 = random(255);
    b1 = random(255);
    bw = random(120, 230);

    alph = random(50, 100);

    eary = random(0, 10);
    earx = random(0, 30);

    bulb = random(8, 12);

    bx1 = random(40, 55);
    by1 = random(33, 43);
    bx2 = random(40, 50);
    by2 = random(45, 65);

    head(i, x1, x2, y1, y2, neck, d, d1, dx, dy, r, g, b, alph, mouthx, mouthy, bw, n1, earx, eary, bulb, bx1, by1, bx2, by2, r1, g1, b1);
  }
}

void head(float x, float x1, float x2, float y1, float y2, float neck, float d, float d1, float dx, float dy, float r, float g, float b, float alph, float mouthx, float mouthy, float bw, float n1, float earx, float eary, float bulb, float bx1, float by1, float bx2, float by2, float r1, float g1, float b1)
{

  pushMatrix();
  rectMode(CENTER);
  translate(x, height/3.5);
  strokeWeight(2);


  triangle(0, -y1*1.4, 5, 0, -5, 0);

  fill(r, g, 0);
  if (y1>25)
  {  
    ellipse(0, -y1*1.5, bulb, bulb);
  }

  else 
  {
    pushMatrix();
    translate(0, -y1*1.5);
    triangle(-6, -6, 6, -6, 0, 5);

    popMatrix();
  }


  fill(r, b, 120);
  rect(0, -d1, neck, neck); 




  //EARS
  fill(r, 70, 70, 60);
  rect(x1+3, eary, earx*1.4, y1/1.2);
  rect(-x1-3, eary, earx*1.4, y1/1.2);
  fill(r, 70, 70);
  rect(x1, eary, earx, y1*1.3);
  rect(-x1, eary, earx, y1*1.3);

  //NECK

  fill(bw-30);
  rect(0, 50, neck, 100);
  float step1 = random(3.5, 10);
  for (int i =0; i<100; i+=step1)
  {
    line(-neck/2, i, neck/2, i);
  }

  //WAIST

  fill(bw-30);
  rect(0, 120, bx2*2 - 25, 80);
  float step2 = random(3.5, 10);
  for (int i =80; i<160; i+=step2)
  {
    line(-bx2+12.5, i, bx2-12.5, i);
  }

  //LOWER WAIST
  fill(bw);
  float waist = random( -10, 15);
  float waisty = random( 25, 35);
  rect(0, 175, bx2*2 + waist, waisty);

  //HEAD
  fill(bw);
  quad(-x1, -y1, x1, -y1, x2, y2, -x2, y2);

  //MOUTH
  fill(255);
  rect(0, 0, n1, y1);
  pushMatrix();
  translate(0, y2-12);
  rect(0, 0, mouthx, mouthy);
  float step = random(4, 15);
  for (int i =0; i<(mouthx/2); i+=step)
  {
    line(i, (-mouthy/2.1), i, mouthy/2.1);
    line(-i, (-mouthy/2.1), -i, mouthy/2.1);
  }
  //EYES
  popMatrix();
  rectMode(CENTER);
  fill(r, g, 0, alph);
  ellipse(-dx, dy, d1, d1);
  ellipse(dx, dy, d1, d1);

  float c1 = random(180, 245);
  fill(c1, c1, 0);
  ellipse(-dx, dy, d, d);
  ellipse(dx, dy, d, d);

  //BROWS
  float brow = random(2, 10);

  strokeWeight(brow);

  liny1 = dy-(random(12, 17));
  liny2 = dy-(random(12, 17));

  line(-dx-9, liny1, -dx+9, liny2);
  line(dx-9, liny2, dx+9, liny1);

  pushMatrix();
  translate(0, 90);

  strokeWeight(2);


  //LEFT ARM
  float armrandom = random(15, 25);
  float arm1 = random(20, 35);
  float armr = random(0, 5);
  float army = random(60, 85);
  float arm = random(0, 20);
  float armPush = random (20, 25);

  fill(g1, g1, 0, alph);
  quad(-bx1-arm1+6, -by1+armrandom, -bx1-arm1+6-arm, army, -bx1-arm1-arm +armPush, army, -bx1-arm1+armPush, -by1+armrandom);

  //RIGHT ARM
  quad(-(-bx1-arm1+6), -by1+armrandom, -(-bx1-arm1+6-arm), army, -(-bx1-arm1-arm +armPush), army, -(-bx1-arm1+armPush), -by1+armrandom);

  strokeWeight(15);
  float circ = random (-15, 15);
  noFill();
  arc(-bx1-arm1+15-arm, army+13, 32, 32, radians(120+circ), radians(390+circ));  
  arc(bx1+arm1-15+arm, army+13, 32, 32, radians(150+circ), radians(410+circ));  
  strokeWeight(2);
  //ARM PADS
  fill(bw-50);
  quad(-bx1-arm1, -by1+armr, bx1+arm1, -by1+armr, bx1+arm1, -by1+armrandom, -bx1-arm1, -by1+armrandom);

  //BODY
  fill(bw);
  quad(-bx1, -by1, bx1, -by1, bx2, by2, -bx2, by2);

  //CHEST
  if (bx1%2<=1)
  {
    float py = random(-10, 45);
    fill(r1, g1/1.5, b1/1.5, alph);
    triangle(-bx1+1, -by1, bx1-1, -by1, 0, py);
    //    ellipse(20, 20, 10, 10);  
    //    ellipse(20, 40, 10, 10);
  }
  else 
  {
    float px1 = random(0, 45);
    fill(r1, g1/1.5, b1/1.5, alph/1.5);
    quad(-bx1+20, -by1, bx1-20, -by1, bx2-20, by2-px1, -bx2+20, by2-px1);
  }

  popMatrix();
  popMatrix();
}

void mousePressed()
{
  redraw();
}


