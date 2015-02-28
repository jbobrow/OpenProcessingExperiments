
PImage table;
PImage tormentorBody;
PImage victim;
PImage bubble;
PImage piping;
int prevSec;
int millisRolloverTime;
int H;
int M;
int S;
float wd;
int mils;
PFont font;
String ho;
String mi;
float coverOpacity;

void setup()
{
  size(650, 700);
  
  table = loadImage("torture_board.png");
  tormentorBody = loadImage("tormentor copy.png");
  victim = loadImage("victim.png");
  bubble = loadImage("speech_bubble.png");
  bubble.resize(225, 225);
  piping = loadImage("piping.png");
  piping.resize(525, 250);
  
  font = loadFont("FranklinGothic-Medium-22.vlw");
  textFont(font);
  
  imageMode(CENTER);
  ellipseMode(CENTER);
  
  millisRolloverTime = 0;
  
  
  background(180);
}

void draw()
{
  background(180);
  noStroke();
  fill(120);
  quad(-5, 550, 50, 450, 650, 450, 650, 550);
  rect(-5, 550, 655, 155);
  stroke(120);
  strokeWeight(5);
  line(50, 450, 50, 0);

  image(tormentorBody, 125, 425);
  image(table, 225, 585);
  image(victim, 200, 575);


  fill(31, 98, 203, 100);
  noStroke();
  ellipse(399, 239, 18.0/60 * second(), 18.0/60 * second());
  image(piping, 416, 125);
    
  if(minute()  == 0 && second() <= 15)
  {
    drawBubble(510, 450, ho, mi);
    if(second() > 9)
    { 
      coverOpacity += 255.0/100.0;
      fill(180, 180, 180, coverOpacity);
      rect(350, 300, 400, 150); 
      fill(120, 120, 120, coverOpacity);
      rect(350, 450, 400, 150);
    }
  }
  else
  {
    coverOpacity = 0;
    ho = Integer.toString((int)random(1, 12));
    mi = nf((int)random(0, 59), 2);
  }
  
  H = hour();
  M = minute();
  S = second();
  wd = 100;
  
  if(prevSec != S)
  {
     millisRolloverTime = millis();
  }
  prevSec = S;
  mils = millis() - millisRolloverTime;
  
  drawArms();
  drawVHead();
  
  if(second() < 9)
  {
    drawStream();
  }

}

void drawArms()
{
  stroke(0);
  strokeWeight(30);
  strokeCap(ROUND);
  
  float anchorX = 165;
  float anchorY = 325;
  float amplitude1 = 50;
  float amplitude2 = 40;
  float period = .0005;

  float metricSecond = mils;
  float endX1;
  float endY1;
  float endX2;
  float endY2;
  
  if(metricSecond > 500)
  {
     endX1 = anchorX + amplitude1 * sin(3 * PI / 2 - metricSecond*(3 * PI)*period);
     endY1 = anchorY + amplitude1 * cos(PI - metricSecond*(TWO_PI)*period);
     endX2 = endX1 + amplitude2 * sin(-3 * HALF_PI - metricSecond*(-3 * PI)*period);
     endY2 = endY1 + amplitude2 * cos(-3 * HALF_PI - metricSecond*(-3 * PI)*period - PI / 6);
  }
  else
  {
    endX1 = anchorX + amplitude1 * sin(metricSecond * (3 * PI) * period);
    endY1 = anchorY + amplitude1 * cos(metricSecond * (TWO_PI) * period);
    endX2 = endX1 + amplitude2 * sin(metricSecond*(-3 * PI)*period);
    endY2 = endY1 + amplitude2 * cos(metricSecond*(-3 * PI)*period - PI/6);
  }
  
  line(anchorX, anchorY, endX1, endY1); //left arm bottom half
  line(endX1, endY1, endX2, endY2); //left arm top half
  drawStick(endX2, endY2); //the stick (if I have time, I will condense it into this function)
  line(anchorX - 75, anchorY - 5, endX1 - 70, endY1); //right arm bottom half
  line(endX1 - 70, endY1, endX2, endY2); //right arm top half
}

void drawStick(float x, float y)
{
  stroke(121, 76, 16);
  strokeWeight(5);
  strokeCap(ROUND);
  
  float anchorX = x;
  float anchorY = y;
  float amplitude = 220;
  float period = .0005;
  float metricSecond = mils;
  
  float endX;
  float endY;

  if(metricSecond > 500)
  {
     endX = anchorX + amplitude * sin(2 * PI - metricSecond*(4 * PI)*period + QUARTER_PI);
     endY = anchorY + amplitude * cos(PI - metricSecond*(TWO_PI)*period + QUARTER_PI);
  }
  else
  {
    endX = anchorX + amplitude * sin(metricSecond * (4 * PI) * period + QUARTER_PI);
    endY = anchorY + amplitude * cos(metricSecond * (TWO_PI) * period + QUARTER_PI);
  }

  line(anchorX, anchorY, endX, endY);
  
  stroke(0);
  strokeWeight(30);
}

void drawVHead()
{
  noStroke();
  fill(0);
  float amplitude = 50;
  float period = .0005;
  float metricSecond = mils;
  
  float xPos;
  float yPos;


  xPos = 350 - amplitude * sin(metricSecond*(-PI/4)*period - PI/3);
  yPos = 610 - amplitude * cos(metricSecond*(-PI/4)*period - PI/3);
  
  ellipse(xPos, yPos, 65, 65);
  fill(255);
  rect(xPos - 23, yPos - 22, 47, 30);
  arc(xPos, yPos, 65, 65, 5 * PI / 4, 7 * PI / 4);
  
}

void drawBubble(int x, int y, String HO, String MI)
{
  int xPos = x;
  int yPos = y;
  fill(0);
  textAlign(CENTER);
  
  String time;
  
  if(hour() > 12) time = HO + " : " + MI + " PM.";
  else time = HO + " : " + MI + " AM.";
  image(bubble, xPos, yPos);
  
  text("Okay, I'll confess", xPos + 5, yPos - 22);
  text("the time! It's", xPos + 5, yPos);
  text(time, xPos + 5, yPos + 22);
  text("Please stop!", xPos + 5, yPos + 44);
}

void drawStream()
{
  int xPos = 399;
  int yPos = 239;
  
  rectMode(CORNER);
  fill(31, 98, 203, 100);
  rect(390, 239, 18, 340);
  arc(399, 579, 18, 18, 0, PI);
  
  for(int i = 0; i < 20; i++)
  {
    stroke(31, 98, 203, 100);
    strokeWeight(3);
    float lineX = 390 + random(0, 18);
    float lineY1 = 239 + random(0, 349);
    float lineY2 = 239 + random(0, 349);
    line(lineX, lineY1, lineX, lineY2);
  }
  
  for(int j = 0; j < 10; j++)
  {
    noFill();
    float vx1 = random(380, 418);
    float vy1 = random(569, 589);
    float vx2 = random(380, 418);
    float vy2 = random(569, 589);
    float vx3 = random(380, 418);
    float vy3 = random(569, 589);
    float vx4 = random(380, 418);
    
    beginShape();
    curveVertex(vx1, vy1);
    curveVertex(vx1, vy1);
    curveVertex(vx2, vy2);
    curveVertex(vx3, vy3);
    curveVertex(vx4, vy1);
    curveVertex(vx4, vy1);
    endShape();
  }
}

