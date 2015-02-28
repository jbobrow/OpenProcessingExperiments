
//Hao-Yun Mei, hmei
//Copy Right_Hao-Yun Mei_Carnegie Mellon University
//Press space to view top 5 population city from 1900 - 2005.
//move over mouse to check the population of the city. 
//Data from 192021.org





PImage p;
int [] TPop1900 = {
  6480000, 4242000, 3330000, 2707000, 1717000
};
int [] TPop1950 = {
  12463000, 8860000, 7000000, 5900000, 5406000
};
int [] TPop2005 = {
  35197000, 19411000, 18718000, 18333000, 18196000
};
float step = 0;

void setup()
{
  size ( 1357, 627);
  p = loadImage("world blank.png");
  image(p, 0, 0);
  //  rectMode(CENTER);
  smooth();
  noStroke();
  fill(255, 0, 0, 50);
  //noLoop();
}

void draw()
{
  image(p, 0, 0);
  if (step == 1)
  {
    Pop1900();
    Poptext1900();
  }
  else if (step == 2)
  {
    Pop1900();
    Pop1950();
    Poptext1950();
  }
  else if (step == 3)
  {
    Pop1900();
    Pop1950();
    Pop2005();
    Poptext2005();
  }
  else if (step > 3)
  {
    step = 0;
    image(p, 0, 0);
  }
  
  if (keyPressed) saveFrame("hw12.jpg");
}



void keyReleased()
{
  if (key == ' ')
  {
    step = step +1;
  }
}

void mousePressed ()
{
  point (mouseX, mouseY);
  println ("vertex("+mouseX +", " +mouseY+");");
}

void Pop1900()
{
  // fill (255, 0, 0, 30);

  ellipse (555, 130, 30, 30); //London
  ellipse(260, 198, 25, 25); //New York
  ellipse(565, 168, 18, 18); // Paris
  ellipse(573, 152, 20, 20); // Berlin
  ellipse(222, 181, 14, 14); //Chicago
  pushStyle();
  fill(255);
  rect(1102, 550, 150, 60);
  popStyle();
  pushStyle();
  fill(255,0,0);
  stroke(255, 0, 0); 
  strokeWeight(3);
  textSize(60);
  text("1900", 1100, 600);
  popStyle();
}

void Pop1950()
{
  //fill (255, 0, 0, 30);
  ellipse(260, 198, 60, 60); //New Yotk
  ellipse(555, 130, 35, 35); //London
  ellipse(1099, 200, 32, 32); //Tokyo
  ellipse(565, 168, 28, 28); //Paris
  ellipse(1042, 233, 26, 26); // Shanghai
  pushStyle();
  fill(255);
  rect(1102, 550, 150, 60);
  popStyle();
  pushStyle();
  fill(255,0,0);
  strokeWeight(3);
  textSize(60);
  text("1995", 1100, 600);
  popStyle();
  //noLoop();
}

void Pop2005()
{
  ellipse(1099, 200, 150, 150); //Tokyo
  ellipse(148, 266, 80, 80); //Mexico
  ellipse(260, 198, 76, 76); //New York
  ellipse(339, 398, 75, 75); // Sao Paulo, Brazil
  ellipse(859, 270, 72, 72);// Mombai
  pushStyle();
  fill(255);
  rect(1102, 550, 150, 60);
  popStyle();
  pushStyle();
  fill(255,0,0);
  strokeWeight(3);
  textSize(60);
  text("2005", 1100, 600);
  popStyle();
  // noLoop();
}

void Poptext1900()
{
  pushStyle();
  fill(0); 
  strokeWeight(5);
  textSize(15);
  float distNewYork = dist (mouseX, mouseY, 260, 198);
  if ( distNewYork < 10)
  {
    text("2. NewYork", 270, 180);
    text(TPop1900[1], 270, 200);
  }


  float distLondon = dist (mouseX, mouseY, 555, 130);
  if (distLondon < 10)
  {
    text("1. London", 565, 110);
    text(TPop1900[0], 565, 130);
  }

  float distParis = dist (mouseX, mouseY, 565, 168);
  if (distParis < 10)
  {
    text("3. Paris", 575, 148);
    text(TPop1900[2], 575, 168);
  }
  float distBerlin = dist (mouseX, mouseY, 573, 152);
  if ( distBerlin <10)
  {
    text("4. Berlin", 583, 132);
    text(TPop1900[3], 583, 152);
  }

  float distChicago = dist (mouseX, mouseY, 222, 181);
  if (distChicago < 10)
  {
    text("5. Chicago", 232, 161);
    text(TPop1900[4], 232, 181);
  }
  popStyle();
}

void Poptext1950()
{
  pushStyle();
  fill(0); 
  textSize(15);
  float distNewYork = dist (mouseX, mouseY, 260, 198);
  if ( distNewYork < 10)
  {
    text("1. NewYork", 270, 180);
    text(TPop1950[0], 270, 200);
  }


  float distLondon = dist (mouseX, mouseY, 555, 130);
  if (distLondon < 10)
  {
    text("2. London", 565, 110);
    text(TPop1950[1], 565, 130);
  }

  float distTokyo = dist (mouseX, mouseY, 1099, 200);
  if (distTokyo < 10)
  {
    text("3. Tokyo", 1109, 180);
    text(TPop1950[2], 1109, 200);
  }
  float distParis = dist (mouseX, mouseY, 565, 168);
  if ( distParis <10)
  {
    text("4. Paris", 575, 148);
    text(TPop1950[3], 575, 168);
  }

  float distShanghai = dist (mouseX, mouseY, 1042, 233);
  if (distShanghai < 10)
  {
    text("5. Shanghai", 1052, 213);
    text(TPop1950[4], 1052, 233);
  }
  popStyle();
}

void Poptext2005()
{
  pushStyle();
  fill(0); 
  textSize(15);
  float distNewYork = dist (mouseX, mouseY, 260, 198);
  if ( distNewYork < 10)
  {
    text("3. NewYork", 270, 180);
    text(TPop2005[2], 270, 200);
  }


  float distMexico = dist (mouseX, mouseY, 148, 266);
  if (distMexico < 10)
  {
    text("2. Mexico", 158, 246);
    text(TPop1950[1], 158, 266);
  }

  float distTokyo = dist (mouseX, mouseY, 1099, 200);
  if (distTokyo < 10)
  {
    text("1. Tokyo", 1109, 180);
    text(TPop2005[0], 1109, 200);
  }
  float distSanpaulo = dist (mouseX, mouseY, 339, 398);
  if ( distSanpaulo <10)
  {
    text("4. San Paulo", 348, 378);
    text(TPop2005[3], 348, 398);
  }

  float distMobai = dist (mouseX, mouseY, 859, 270);
  if (distMobai < 10)
  {
    text("5. Mobai", 869, 250);
    text(TPop2005[4], 869, 270);
  }
  popStyle();
}

