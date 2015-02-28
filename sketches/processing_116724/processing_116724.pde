
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;



float x1, y1, sz1, dx1, dy1, t1;
float x2, y2, sz2, dx2, dy2;
color col1;
color col2;
PImage pic;
PImage bg;
PFont f1;
int hits;
int lastCollisionTime;
float temp = dx1;
float easing = 0.03;
float drot;
float z = 0;  


//Minim m;
//AudioPlayer s1, s2;

void setup ()
{
  rectMode ( CENTER );
  imageMode( CENTER );
  noStroke();
  pic = loadImage("image.png");
  bg = loadImage("background.png");
  size (400, 400);
  
  //m = new Minim( this );
  //s1 = m.loadFile( "bounce.wav");
  //s2 = m.loadFile("collide.wav");
  x1 = 100;
  y1 = 100;
  sz1 = 42;
  dx1 = 1;
  dy1 = 1;
  col1 = color(200, 255, 100);
  x2 = 200;
  y2 = 200;
  sz2 = 35;
  dx2 = 3;
  dy2 = 5;
  hits = 0;
  lastCollisionTime = 0;
  f1 = loadFont ("f2.vlw");
  col2 = color (212, 40, 125);
  
}

void stop()
{
  //s1.close();
  //s2.close();
  //m.stop();
  //super.stop();

}

void draw ()
{
  //saveFrame("frame-####.png");
  prepScreen ();
  
  float targetX = mouseX;
  float dx1 = targetX - x1;
  if(abs(dx1) > 1) {
    x1 += dx1 * easing;
  }
  
  float targetY = mouseY;
  float dy1 = targetY - y1;
  if(abs(dy1) > 1) {
    y1 += dy1 * easing;
  }
  
  showStats();
  showTime();
  
  movFig1();
  fig1();
 
  movFig2();
  fig2();
  
  checkCollision();
}

void showStats()
{
  textFont (f1, 12);
  fill (0);
  text ("Files Recovered:" + hits, width*.35, height*.98);

}

void showTime()
{
  fill (0);
  text ("Time:" + millis()/1000, width*.2, height*.98);
  fill(255);
}


void checkCollision()
{
  float d =dist(x1, y1, x2, y2);
  float colDist = sz1/2 + sz2/2;
  if (d < (colDist))
  {
    x1 -=dx1*5;
    y1 -=dy1*5;
    dx1*=-1;
    dy1*=-1;
    dx2*=-1;
    dy2*=-1;
    sz2-=.25;
    x2 = random(400);
    y2 = random(400);
    hits++;
    lastCollisionTime = millis();
    //s2.play();
    //s2.rewind();
    z = 30; 
   
  }
  
  if (z > 0) {
    
    fill(0);
    ellipse(x1, y1, sz1*.3, sz1*.3);
    fill(234,227,204);
    noStroke();
    rect(x1, y1-sz1*.1, sz1*.5, sz1*.2);
    
    col1 = color(random(255), random(255), random(255));
    fill(0, 255, 0, 90);
    strokeWeight(4);
    rectMode(CENTER);
    rect (width/2, height, width, height/8);
    strokeWeight(1);
    
    z --;
    
  }
  
  else if (d < (colDist))
  {
    x1 -=dx1*5;
    y1 -=dy1*5;
    dx1*=-1;
    dy1*=-1;
    dx2*=-1;
    dy2*=-1;
    sz2-=3;
    x2 = random(400);
    y2 = random(400);
    hits++;
    lastCollisionTime = millis();
    //s2.play();
    //s2.rewind();
    
    col1 = color(random(255), random(255), random(255));
  }

}

void fig1()
{
  pushMatrix();
  translate (x1, y1);
  rotate (radians(drot));
 
  fill (193, 183, 148);
  rect (0, 0-sz1*.10, sz1*1.4, sz1, 0, 10, 0, 0 );
  fill (234,227,204);
  rect (0, 0, sz1*1.4, sz1, 0, 10, 0, 0 );
  noStroke();
  fill (234,227,204);
  rect (0-(sz1)*.3, 0-sz1*.40, sz1*.75, sz1/2, 5, 5, 0, 0);
  fill (0);
  ellipse(0-sz1*.3, 0-sz1*.2, sz1*.1, sz1*.1);
  ellipse(0+sz1*.3, 0-sz1*.2, sz1*.1, sz1*.1);
  noFill();
  stroke(0);
  ellipse(0, 0, sz1*.3, sz1*.3);
  fill(234,227,204);
  noStroke();
  rect(0, 0-sz1*.1, sz1*.5, sz1*.2);
  popMatrix();
   
}


void fig1Eyes()
{
  

}

void movFig1()
{
  x1 +=dx1;
  y1 +=dy1;
  if (y1>height+sz1/2)
  {
    y1 =-sz1/2;
    
  
  }
  
  if (y1<0-sz1/2)
  {
    y1 = width+sz1/2;
  
  }
  
  if (x1>width+sz1/2)
  {
    x1 = -sz1/2;
  
  }
  
  if (x1<0-sz1/2)
  {
    x1 = width+sz1/2;
  
  }
  
  

}

void fig2()
{
  fill(255);
  rect ( x2, y2, sz2*.80, sz2);
  stroke(0);
  noStroke();
  fill(0);
  rect (x2, y2-sz2*.15, sz2*.6, sz2*.05);
  rect (x2, y2-sz2*.3, sz2*.6, sz2*.05);
  rect (x2, y2+sz2*.05, sz2*.6, sz2*.05);
  rect (x2, y2+sz2*.25, sz2*.6, sz2*.05);
  fill (255);
  textFont (f1, 9);
  textAlign(CENTER);
  text ("hw8.doc", x2, y2+sz2*.9);
  textAlign(LEFT);

}

void movFig2()
{
  x2 +=dx2;
  y2 +=dy2;
  if (x2>width || x2<0)
  {
    dx2 = -dx2;
    x2 += dx2;
    //s1.play();
    //s1.rewind();
  }
  
  if (y2>height || y2<0)
  {
    dy2 = -dy2;
    y2 += dy2;
    //s1.play();
    //s1.rewind();
  
  }
}


void prepScreen () 
{
  noFill();
  rect (width/2, height/2, width, height);
  image (bg, width/2, height/2, width, height);

}


void keyPressed()
{
  if (keyCode == RIGHT) 
  {
    dx2++;
  }
  
  else if (keyCode == LEFT)
  {
    dx2--;
  }
  
  else if (keyCode == UP) 
  {
    dy2--;
  }
  else if (keyCode == DOWN) 
  {
    dy2++;
  }
  
  if (key == 'a'){
  drot +=3;
  }
  else if ( key == 's'){
  drot -=3;
  }
  
}



