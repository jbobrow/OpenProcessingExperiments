
PImage [] images = new PImage [51];
PImage [] body = new PImage [4];
PFont font;
PFont font1;

int page = 1;
float x = 1.5;
float y = 3.40;

float tfill=0.0;
float axx=0.0;
float axy=100;
float axc=255;
boolean axfun = false;
boolean arx = false;
boolean turn = false;
float bx = 255;
float arx1=1.5;
int body1 = 1;
int s1 = 1;

float pMillis =0.0;
float tMillis =0.0;
void setup ()
{
  size(700, 420);
  noStroke();
  strokeCap(SQUARE);
  smooth();
  imageMode(CENTER);

  body [1] = loadImage("1.png");
  body [2] = loadImage("2.png");
  body [3] = loadImage("50.png");

  for (int i = 1; i<images.length; i++)
  {
    images [i] = loadImage (i+".png");
  }
  font = loadFont ("BellMT-22.vlw");
  font1 = loadFont ("BellMTItalic-22.vlw");
}

void draw()
{
  if (page == 1) {
    pageOne();
  } 
  else if (page == 2) {
    pageTwo();
  } 
  else if (page == 3) {
    pageThree();
  } 
  else if (page == 4) {
    pageFour();
  }
  else if (page == 5) {
    pageFive();
  }
  else if (page == 7) {
    pageSeven();
  }
  else if (page == 8) {
    pageEight();
  }
  else if (page == 9) {
    pageNine();
  }
  else if (page == 10) {
    pageTen();
  }
  else if (page == 11) {
    pageEleven();
  }
  else if (page == 12) {
    pageTwelve();
  }
  else if (page == 13) {
    pageThirteen();
  }
  else if (page == 14) {
    pageFourteen();
  }
  else if (page == 15) {
    pageFifteen();
  }
  else if (page == 16) {
    pageSixteen();
  }
  else if (page == 17) {
    pageSeventeen();
  }
  else if (page == 18) {
    pageEighteen();
  }
  else if (page==19)
  {
    pageNineteen();
  }
  else if (page==20)
  {
    pageTwenty();
  }
  else if (page==21)
  {
    pageTwentyOne();
  }
  else if (page==22)
  {
    pageTwentyTwo();
  }
}

void mousePressed ()
{
  if (page==1)
  {
    page = 2;
  }

  else if (page==2)
  {
    if (dist(mouseX, mouseY, width/2, height/2) < 157.5)
    {
      page = 3;
    }

    else {
      page = 2;
    }
  }

  else if (page==3)
  {
    if (dist(mouseX, mouseY, width/2, height/2) < 157.5)
    {
      page = 4;
    }
  }

  else if (page==5)
  {
    if (dist(mouseX, mouseY, width/2, height/2) < 157.5)
    {
      page = 7;
    }
  }
 
  else if (page==9)
  {
    if (mouseX>250 && mouseX<750 && mouseY >100 && mouseY<500)
    {
      page = 10;
    }
  }

  else if (page==11)
  {
    if (dist(mouseX, mouseY, width/2, height/2) < 157.5)
    {
      page = 12;
    }
  }
  else if (page==20||page==21||page==22)
  {
    if (dist(mouseX, mouseY, width/2, height/2) < 157.5)
    {
      page = 3;
    }
  }


if ((page==2||page==5||page==9||page==11)&&(dist(mouseX, mouseY, width/2, height/2) > 157.5))    
{
  blend (images [4], 0, 0, 700, 420, 0, 0, 700, 420, EXCLUSION);
}
}

void pageOne()
{
  frameRate(4);
  image (images [(int)random(5, 9)], width/2, height/2); 
  tint(255, 160);
  image(images[3], width/2, height/2);
  filter(BLUR, random(0, 1.5));
}

void pageTwo()
{
  frameRate(4);
  image (images [(int)random(5, 9)], width/2, height/2);

  if (millis() - pMillis >= 7000)
  {
    body1 ++;
    pMillis=millis();
  }

  if (body1>3)
  {
    body1=1;
  }

  blend( body [body1], 0, 0, 358, 339, 180, 75, 358, 339, MULTIPLY);
  filter(BLUR, random(0, 1.5));
}

void pageThree()
{
  frameRate(7);
  tint(255);
  image (images [(int)random(10, 16)], width/2, height/2);
  float ex = random(-10, 10);
  fill(255, 0, 0, 50+ex); 
  noStroke();
  ellipse(width/2, height/2, 315, 315);
}

void pageFour() 
{
  frameRate(6);
  image (images [(int)random(11, 18)], width/2, height/2);
  noFill();
  stroke(255);

  strokeWeight(2);

  arc(width/2, height/2, 315, 315, 1.5*PI, arx1*PI);

  if (arx1 <= 1.75)
  { 
    arx = true;
  } 

  if (arx == true)
  { 
    arx1 += 0.009;
  }

  if (arx1 >= 1.85)
  {
    arx=false;
    page = 5;
  }
}

void pageFive() 
{
  frameRate(4);
  image (images [(int)random(5, 9)], width/2, height/2); 

  if (millis() - pMillis >= 7000)
  {
    body1 ++;
    pMillis=millis();
  }

  if (body1>3)
  {
    body1=3;
  }

  blend( body [body1], 0, 0, 358, 339, 180, 75, 358, 339, MULTIPLY);
  
  filter(BLUR, random(0, 1.5));
  tint(255, 160);
}

void pageSeven()

{
  tint(255);
  frameRate(6);
  image (images [(int)random(17, 22)], width/2, height/2);

  noFill();
  arc(width/2, height/2, 315, 315, 1.5*PI, arx1*PI);

  if (arx1 <= 2)
  { 
    arx = true;
  } 

  if (arx == true)
  { 
    arx1 += 0.009;
  }

  if (arx1 >= 2)
  {
    arx=false;
    page = 8;
  }
}

void pageEight()

{
  image (images [(int)random(22, 27)], width/2, height/2);
  arc(width/2, height/2, 315, 315, 1.5*PI, arx1*PI);

  if (arx1 <= 2.5)
  { 
    arx = true;
  } 

  if (arx == true)
  { 
    arx1 += 0.009;
  }

  if (arx1 >= 2.5)
  {
    arx=false;
    page = 9;
  }
}

void pageNine()
{
  frameRate(4);
  image (images [(int)random(5, 9)], width/2, height/2); 
 
  if (millis() - pMillis >= 7000)
  {
    body1 ++;
    pMillis=millis();
  }

  if (body1>3)
  {
    body1=2;
  }

  blend( body [body1], 0, 0, 358, 339, 180, 75, 358, 339, MULTIPLY);
  filter(BLUR, random(0, 1.5));
  tint(255, 160);
}

void pageTen()
{
  frameRate(6); 
  tint(255);
  image (images [(int)random(24, 29)], width/2, height/2);
  arc(width/2, height/2, 315, 315, 1.5*PI, arx1*PI);

  if (arx1 <= 3)
  { 
    arx = true;
  } 

  if (arx == true)
  { 
    arx1 += 0.009;
  }

  if (arx1 >= 3)
  {
    arx=false;
    page = 11;
  }
}

void pageEleven()
{
  frameRate(4);
  image (images [(int)random(5, 9)], width/2, height/2); 
 
  if (millis() - pMillis >= 7000)
  {
    body1 ++;
    pMillis=millis();
  }

  if (body1>3)
  {
    body1=1;
  }

  blend( body [body1], 0, 0, 358, 339, 180, 75, 358, 339, MULTIPLY);
  filter(BLUR, random(0, 1.5));
  tint(255, 160);
}

void pageTwelve()
{
  frameRate(6);
  tint(255);
  image (images [(int)random(25, 32)], width/2, height/2);
  arc(width/2, height/2, 315, 315, 1.5*PI, arx1*PI);

  if (arx1 <= 3.25)
  { 
    arx = true;
  } 

  if (arx == true)
  { 
    arx1 += 0.009;
  }

  if (arx1 >= 3.25)
  {
    arx=false;
    page = 13;
  }
}

void pageThirteen()
{
  image (images [(int)random(31, 38)], width/2, height/2);
  arc(width/2, height/2, 315, 315, 1.5*PI, arx1*PI);
  stroke(255);

  if (arx1 <= 3.40)
  { 
    arx = true;
  } 

  if (arx == true)
  { 
    arx1 += 0.009;
  }

  if (arx1 >= 3.40)
  {
    arx=false;
    arx1 = 1.5;
    page = 14;
  }
}

void pageFourteen()
{
  image (images[(int)random(32, 38)], width/2, height/2);

  arc(width/2, height/2, 315, 315, x*PI, y*PI);

  if (page==14)
  {
    turn = true;
  }

  if (turn == true)
  {
    x +=  0.0097;
    y +=  0.0097;
  }

  if (x>=1.75)
  {
    page = 15;
  }
}

void pageFifteen()
{
  frameRate(6);
  image (images[(int)random(32, 45)], width/2, height/2);
  arc(width/2, height/2, 315, 315, x*PI, y*PI);

  if (page==15)
  {
    turn = true;
  }

  if (turn == true)
  {
    x +=  0.0097;
    y +=  0.0097;
  }

  if (x>=2.5)
  {
    page = 16;
  }
}

void pageSixteen()
{
  frameRate(7);
  image (images[(int)random(39, 47)], width/2, height/2);
  arc(width/2, height/2, 315, 315, x*PI, y*PI);

  if (page==16)
  {
    turn = true;
  }

  if (turn == true)
  {
    x +=  0.0097;
    y +=  0.0097;
  }
  if (x>=3.35)
  {
    page = 17;
  }
}

void pageSeventeen()
{
  frameRate(8);
  image (images[(int)random(41, 50)], width/2, height/2);
  arc(width/2, height/2, 315, 315, x*PI, y*PI);

  if (page==17)
  {
    turn = true;
  }

  if (turn == true)
  {
    x +=  0.0097;
    y +=  0.0097;
  }

  if (x>=3.5)
  {
    page = 18;
  }
}
void pageEighteen()
{
  frameRate(6);
  image (images [(int)random(5, 9)], width/2, height/2); 
  tint (255, 200);
  arc(width/2, height/2, 315, 315, x*PI, y*PI);

  if (page ==18)
  {
    turn = true;
  }

  if (turn==true)
  { 
    y +=  0.0097;
    x +=0;
  }

  if (y>=5.5)
  {
    turn = false;
    page=19;
    x = 1.5;
    y = 3.40;
  }
}

void pageNineteen()
{
  tint (255, 170);

  fill (255, axc, axc, axx);
  stroke(255, axc, axc, axy);
  image (images [(int)random(5, 9)], width/2, height/2); 
  blend( images [50], 0, 0, 358, 339, 180, 75, 358, 339, MULTIPLY);


  ellipse(width/2, height/2, 315, 315);

  if (page==19)
  {
    axfun=true;
  }

  if (axfun=true)
  {
    axx +=0.7; 
    axy -=3;
    axc-=5;
  }

  if (axx>=50)
  {
    axfun=false;
    pMillis=millis();
    tMillis=millis();
    axx=0.0;
    axy=100;
    axc=255;
    tfill=0;
    page = (int)random(20, 23);
  }
}

void pageTwenty ()
{
  image (images [(int)random(5, 9)], width/2, height/2); 
  float ex = random(-10, 10);

  if (millis() - pMillis >= 7000)
  {
    body1 ++;
    pMillis=millis();
  }

  if (body1>3)
  {
    body1=1;
  }

  blend( body [body1], 0, 0, 358, 339, 180, 75, 358, 339, MULTIPLY);
  fill(255, 0, 0, 50+ex); 
  noStroke();
  ellipse(width/2, height/2, 315, 315);

  if (millis() - tMillis >= 2000)
  {
    tfill+=5;
    fill(255, tfill);

    String s ="''To die will be an awfully big adventure.''";
    String s2 = "- JM Barie";
    textFont(font);
    textLeading (24);
    text (s, 160, 180, 475, 500);

    textFont(font1);
    text(s2, 400, 250, 300, 30);
  }
}

void pageTwentyOne ()
{
  image (images [(int)random(5, 9)], width/2, height/2); 
  float ex = random(-10, 10);

  if (millis() - pMillis >= 7000)
  {
    body1 ++;
    pMillis=millis();
  }

  if (body1>3)
  {
    body1=1;
  }

  blend( body [body1], 0, 0, 358, 339, 180, 75, 358, 339, MULTIPLY);
  fill(255, 0, 0, 50+ex); 
  noStroke();
  ellipse(width/2, height/2, 315, 315);

  if (millis() - tMillis >= 2000)
  {
    tfill+=5;
    fill(255, tfill);

    String s ="''A man dies...only a few circles in the water prove that he was ever there. And even they quickly disappear. And when they're gone, he's forgotten, without a trace, as if he'd never even existed. And that's all.''";
    String s2 = "- Wolfgang Borchert";
    textFont(font);
    textLeading (24);
    text (s, 125, 160, 475, 500);

    textFont(font1);
    text(s2, 400, 290, 300, 30);
  }
}

void pageTwentyTwo()
{
  image (images [(int)random(5, 9)], width/2, height/2); 
  float ex = random(-10, 10);

  if (millis() - pMillis >= 7000)
  {
    body1 ++;
    pMillis=millis();
  }

  if (body1>3)
  {
    body1=1;
  }

  blend( body [body1], 0, 0, 358, 339, 180, 75, 358, 339, MULTIPLY);
  fill(255, 0, 0, 50+ex); 
  noStroke();
  ellipse(width/2, height/2, 315, 315);

  if (millis() - tMillis >= 2000)
  {
    tfill+=5;
    fill(255, tfill);

    String s ="''In my dream I know I am falling. But there is no up or down, no walls or sides or ceilings, just the sensation of cold and darkness everywhere. I wonder, if you fall forever and never touch down, is it really still falling?''";
    String s2 = "- Lauren Oliver";
    textFont(font);
    textLeading (24);
    text (s, 125, 160, 490, 500);

    textFont(font1);
    text(s2, 420, 290, 300, 30);
  }
}


