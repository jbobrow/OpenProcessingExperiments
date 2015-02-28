
//Eleni Katrini
//ekatrini@andrew.cmu.edu
//copyright © Eleni Katrini, October 2013
//HW07_The Peace Maker

float x1, y1, wdp, htp, dx1, dy1;
float x2, y2, dx2, dy2;
color colp1, colp2;

PImage lightening;
PFont BoldFont;
int disputes;

void setup()
{
  size(700,700);
  rectMode(CENTER);
  x1= width*0.2;
  y1= height*0.15;
  dx1= random(5, 12);
  dy1= random(5, 12);
  
  x2= width*0.9;
  y2= height*0.8;
  dx2= random(5, 12);
  dy2= random(5, 12);
  
  wdp= 45;
  htp= 180;
  colp1= color(0,0,0);
  colp2= color(0,0,0);
  
  lightening= loadImage("lightening.png");
  BoldFont= loadFont("BoldFont.vlw");
  frameRate(35);
}

void draw()
{
  prepWindow();
  moveMan();
  drawMan();
  moveWoman();
  drawWoman();
  checkCollision(); 
  showStats();
  drawCommunicationLost();
}

void mousePressed()
{  
  prepWindow();
  disputes= 0;
  x1= random(0, width);
  x2= random(0, width);
  y1= random(0, height);
  y2= random(0, height);
  dx1= random(5, 12);
  dy1= random(5, 12);
  dx2= random(5, 12);
  dy2= random(5, 12);
}

void keyPressed()
{
 if (keyCode == UP)
 {
  dx1++;
  dy1++;
}
 else if (keyCode == DOWN)
 {
   dx1--;
   dy1--;
 }
 
 else if (keyCode == LEFT)
 {
   dx2--;
   dy2--;
 }
 
 else if (keyCode == RIGHT)
 {
   dx2++;
   dy2++;
 }
 
}

void prepWindow()
{
  fill(0,0,0);
  rect(width*0.5, height*0.5, width, height);
}

void drawMan()
{
  strokeWeight(2);
  stroke(255, 255, 255);
  fill(colp1);
  ellipse(x1, y1 - htp*.45, wdp*.4, htp*.1); 
  rect(x1 - wdp*.18, y1 + htp*.25, wdp*.3, htp*.45, wdp*.14);
  rect(x1 + wdp*.18, y1 + htp*.25, wdp*.3, htp*.45, wdp*.14);
  rect(x1, y1- htp*.15, wdp, htp*.45, wdp*.14);
}

void drawWoman()
{
  strokeWeight(2);
  stroke(255, 255, 255);
  fill(colp2);
  ellipse(x2, y2 - htp*.45, wdp*.4, htp*.1); 
  rect(x2, y2 - htp*.15, wdp, htp*.45, wdp*.14);
  rect(x2 - wdp*.18, y2 + htp*.25, wdp*.3, htp*.45, wdp*.14);
  rect(x2 + wdp*.18, y2 + htp*.25, wdp*.3, htp*.45, wdp*.14);
  beginShape();
  vertex(x2 - wdp*.15, y2 - htp*.2);
  vertex(x2 - wdp*.70, y2 + htp*.2);
  vertex(x2 + wdp*.70, y2 + htp*.2);
  vertex(x2 + wdp*.15, y2 - htp*.2);
  endShape();
}

void moveMan()
{
  x1 += dx1;
  if (x1 > width + wdp*0.5)
  {
    x1 = 0;
  }
  if (x1 < - htp*0.5)
  {
    x1 = width;
  }
  
  y1 += dy1;
  if (y1 > height + htp*0.5)
  {
   y1 = 0; 
  }
  if (y1 < - htp*0.5)
  {
   y1 = height;
  }
}

void moveWoman()
{
  float tempdx2= dx2;
  float tempdy2= dy2;
  
  x2 += dx2;
  if (x2> width - wdp*0.5 || x2 - wdp*0.5 <0)
  {
   dx2= - tempdx2;
  }
  
  y2 += dy2;
  if (y2> height - htp*0.5 || y2 - htp*0.5 <0)
  {
   dy2 = - tempdy2;
  }
}

void checkCollision()
{
  float DS = dist(x1, y1, x2, y2); 
  float tempdx1= dx1;
  float tempdy1= dy1;
  
  if (DS <= htp*0.9)
  {
    //bouncing movement
    dx1= dx2;
    dx2= tempdx1;
    dy1= -dy2;
    dy2= tempdy1;
    
    //lightening
    drawLightening();
    
    //Disputes count
    disputes++;
  }
}

void showStats()
{
 textFont(BoldFont, 10);
 fill(255, 255, 255);
 text("press UP-DOWN to change Man's speed", width*0.05, height*0.03);
 text("press LEFT-RIGHT to change Woman's speed", width*0.05, height*0.05);
 text("Disputes: " + disputes, width*0.05, height*0.07); 
}

void drawLightening()
{
  float DS = dist(x1, y1, x2, y2); 
  float tempdx1= dx1;
  float tempdy1= dy1;
  
  if (DS <= htp*2.5)
  {
   image(lightening, random(0, width), random(0, height), lightening.width*0.05, lightening.height*0.05);
   image(lightening, random(0, width), random(0, height), lightening.width*0.1, lightening.height*0.1);
   image(lightening, random(0, width), random(0, height), lightening.width*0.2, lightening.height*0.2); 
   image(lightening, random(0, width), random(0, height), lightening.width*0.3, lightening.height*0.3);
   image(lightening, random(0, width), random(0, height), lightening.width*0.4, lightening.height*0.4);
   image(lightening, random(0, width), random(0, height), lightening.width*0.5, lightening.height*0.5);
   image(lightening, random(0, width), random(0, height), lightening.width*0.6, lightening.height*0.6);
   image(lightening, random(0, width), random(0, height), lightening.width*0.7, lightening.height*0.7);
  }
}

void drawLightening2()
{
   image(lightening, random(0, width), random(0, height), lightening.width*0.05, lightening.height*0.05);
   image(lightening, random(0, width), random(0, height), lightening.width*0.1, lightening.height*0.1);
   image(lightening, random(0, width), random(0, height), lightening.width*0.2, lightening.height*0.2); 
   image(lightening, random(0, width), random(0, height), lightening.width*0.3, lightening.height*0.3);
   image(lightening, random(0, width), random(0, height), lightening.width*0.4, lightening.height*0.4);
   image(lightening, random(0, width), random(0, height), lightening.width*0.5, lightening.height*0.5);
   image(lightening, random(0, width), random(0, height), lightening.width*0.6, lightening.height*0.6);
   image(lightening, random(0, width), random(0, height), lightening.width*0.7, lightening.height*0.7);
}

void drawCommunicationLost()
{
 if (disputes >= 20)
 {
  drawLightening2();
  fill(0,0,0, 95);
  rect(width*0.5, height*0.5, width, height);
  textFont(BoldFont, 70);
  fill(255, 255, 255);
  textMode(CENTER);
  text("COMMUNICATION", width*0.05, height*0.45);
  textFont(BoldFont, 120);
  text("LOST", width*0.3, height*0.63);
  textFont(BoldFont, 20);
  text("click to reboot equilibrium", width*0.31, height*0.67);
 }
}





