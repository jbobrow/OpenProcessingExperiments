
//PROJECT V
//Transform(er)

//Flower of Life

//UCLA DESMA Interactivity 28
//By Stephen Ou

float xE;
float easing = 0.12;
boolean check = false;

void setup()
{
  size(640,480);
  smooth();
  ellipseMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  noCursor();
}

void draw()
{
  if(check == false)
  {
  background(0, 0, 0, 100);
  }
  else
  {
    background(0,0,100,100);
  }
  
  xE = xE + (mouseX - xE)*easing;
  
  if(xE>(width/6*2.4))
  {
    drawCirc(182,33, 5, -172,-100, -43.432*2,-50);
    drawCirc(310,151, 5, 172,100, 43.432*2,50);
    drawCirc(216,59, 5, -172,100, -43.432*2,50);
    drawCirc(94,261, 5, 172,-100, 43.432*2,-50);
    drawCirc(158,336, 5, 0,-200, 0,-100);
    drawCirc(16,200, 5, 0,200, 0,100);
  }
   if(xE>(width/6*1.8))
  {
    drawCirc(271,97, 4, -86,-140, -43.432,-24.027-50);
    drawCirc(197,26, 4, 86, -140, 43.432,-24.027-50);
    drawCirc(103,276, 4, -86,140, -43.432,24.027+50);
    drawCirc(221,50, 4, 86, 140, 43.432,24.027+50);
    drawCirc(14,206, 4, -172,0, -43.432*2,0);
    drawCirc(360,180, 4, 172,0, 43.432*2,0);
  }
  if(xE>(width/6*1.2))
  {
    drawCirc(204,35, 3, 0,100, 0,50);
    drawCirc(69,240, 3, -86,-48, -43.432,-24.027);
    drawCirc(189,360, 3, 86, -48, 43.432,-24.027);
  }
  if(xE>(width/6*0.6))
  {
    drawCirc(232,60, 2, 0,-100, 0,-50);
    drawCirc(293,120, 2, -86,48, -43.432,24.027);
    drawCirc(86,268, 2, 86, 48, 43.432,24.027);
  }
  drawCirc(159,0, 1.2, 0,50, 0,0);  
}

void drawCirc(int h1,int h2, float frac, float xA,float yA, float xB,float yB)
{
  noStroke();
  pushMatrix();
  translate(width/2, height/2);

  //COLOR & TRANSPARENCY
  float xHue = map(xE, 0, width, h1, h2);
  //  float xHue = map(mouseX, 0, width, 0, 50);
  //  float xOpaq = map(mouseX, 0, width, o1, o2);
  float xOpaq = map(mouseX, 0, width, 5, 50);
  fill(xHue, 70, 100, xOpaq);

  //ROTATION
  float rtt = map(xE, 0, width/6*frac, 0, 360);
  if(xE<(width/6*frac) && xE>(-640))
  {
    rotate(radians(rtt));
  }
  else if(xE>(width/6*frac))
  {
  };

  //SCALE
  float scaleDown = map(xE, 0, width/6*frac, 3.5, 1);
  if(xE<(width/6*frac) && xE>(-640))
  {
    scale(scaleDown);
  }
  else if(xE>(width/6*frac))
  {
    scale(1.0);
  }


  //CIRCLE & POSITION
  float posX = map(xE, 0, width/6*frac, xA, xB);
  //  float posX = map(mouseX, 0, width/stageA, 0,0);
  float posY = map(xE, 0, width/6*frac, yA, yB);
  //  float posY = map(mouseX, 0, width/stageA, 50, 0);
  if(xE>(width/6*frac))
  {
    posX = xB;
    posY = yB;
  }
  ellipse(posX, posY, 100, 100);
  popMatrix();
}

void mousePressed()
{
  if(check == false)
  {
    check = true;
  }
  else if(check == true)
  {
    check = false;
  }
}


