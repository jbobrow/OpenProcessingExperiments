
// Homework 7
// copyright Alex Fischer ajfische 2012
//CLICK and DRAG the mouse to move the Mace
//Hit Smiliey 3 times to kill him
//press the SPACEBAR rapidly to keep him from falling to hell
//use the UP and DOWN arrow keys to change the difficulty
//press TAB to reset the game
int z, count, difficulty;
float ax, ay, ad, axSpeed, aySpeed, axdir, aydir,
      dx, dy, dd, dxSpeed, dySpeed, dxdir, dydir,
      cx, cxSpeed,
      mx, my, md, mxSpeed, mySpeed, mr, sl, dc;
boolean alive, freshHit;




void setup( )
{
  size( 600, 600 );
  smooth( );
  background( 112, 111, 255 );
  
  ax = random(0, width);
  ay = random(0, height);
  ad = 75;
  axSpeed = 3;
  aySpeed = 4;
  alive = true;
  freshHit = true;
  
  dd = 75;
  axdir = 1;
  aydir = 1;
  dySpeed = 1;
  
  mx = random(0, width);
  my = random(0, height);
  md = 35;
  mxSpeed = 0;
  mySpeed = 0;
  sl = 15;
  dc = 1;
  count = 0;
  difficulty = 0;
}

void draw( )
{
  if (count == 0 )
  {
    prepWindow();
    drawSmiley(ax, ay, ad);
    moveSmiley();
    drawMace();
    moveMace();
    detectCollision();
  }
  else if (count == 1)
  {
    prepWindow();
    drawWoundedSmiliey(ax, ay, ad);
    moveSmiley();
    drawMace();
    moveMace();
    detectCollision();
  }
  else if (count == 2)
  {
    prepWindow();
    drawWoundedSmiliey2(ax, ay, ad);
    moveSmiley();
    drawMace();
    moveMace();
    detectCollision();    
  }
  else if (count == 3)
  {
    fill( 202, 201, 255, 50 );
    rect( 0, 0, width, height );
    drawDeadSmiley(dx, dy, dd);
    moveDeadSmiley();
    
    if(ay > height/2)
    {
      hell();
    }
    else
    {
      heaven();
    }
    
    if(ay + ad/2 < 0)
    {
      win();
      noLoop();
    }
    else if(ay - ad/2 > height)
    {
      lose();
      noLoop();
    }
  }
  showStats();
}

void prepWindow()
{
  fill( 112, 111, 255 );
  rect( 0, 0, width, height );
}

void showStats()
{
  fill(0);
  textSize(24);
  textMode(LEFT);
  text("Difficulty:" + difficulty, 10, 50);
  text("Hits:" + count, 10, 75);
}

void drawSmiley( float x, float y, float d)
{
  //face
  strokeWeight(2);
  stroke( 0 );
  fill( 255, 255, 0 );
  ellipse( x, y, d, d );
  //eyes
  fill( 0 );
  ellipse( x - d*.2, y - d*.125, d*.0625, d*.125);
  ellipse( x + d*.2, y - d*.125, d*.0625, d*.125);
  //mouth
  stroke( 0 );
  beginShape();
    vertex(x - d*.25, y + d*.125);
    bezierVertex(x - d*.125, y + d*.25, x, y + d*.5, x + d*.25, y + d*.125);
  endShape();
}

void drawWoundedSmiliey(float x, float y, float d)
{
    //face
  strokeWeight(2);
  stroke( 0 );
  fill( 255, 255, 0 );
  ellipse( x, y, d, d );
  stroke(255, 0, 0);
  line( x - d/5, y - d/3, x + d/12, y - d/4);
  //eyes
  stroke(0);
  fill( 0 );
  line( x - d*.15, y - d*.2, x - d*.25, y - d*.1 );
  line( x - d*.25, y - d*.2, x - d*.15, y - d*.1 );
  ellipse( x + d*.2, y - d*.125, d*.0625, d*.125);
  //mouth
  stroke( 0 );
  beginShape();
    vertex(x - d*.25, y + d*.125);
    bezierVertex(x - d*.125, y + d*.25, x, y + d*.5, x + d*.25, y + d*.125);
  endShape();
}

void drawWoundedSmiliey2(float x, float y, float d)
{
    //face
  strokeWeight(2);
  stroke( 0 );
  fill( 255, 255, 0 );
  ellipse( x, y, d, d );
  stroke(255, 0, 0);
  line( x - d/5, y - d/3, x + d/12, y - d/4);
  line( x + d/6, y + d/8, x + d/3, y + d/4);
  //eyes
  stroke(0);
  fill( 0 );
  line( x - d*.15, y - d*.2, x - d*.25, y - d*.1 );
  line( x - d*.25, y - d*.2, x - d*.15, y - d*.1 );
  ellipse( x + d*.2, y - d*.125, d*.0625, d*.125);
  //mouth
  stroke( 0 );
  beginShape();
    vertex(x - d*.25, y + d*.125);
    bezierVertex(x - d*.125, y + d*.25, x, y + d*.5, x + d*.25, y + d*.125);
  endShape();
}

void moveSmiley()
{
  ax = ax + (axSpeed * axdir);

  
  if( ax > width - ad/2 )
  {
    axdir = -1;
  }
  else if ( ax < 0 + ad/2 )
  {
    axdir = 1;
  }
  
  ay = ay + (aySpeed * aydir);
  if( ay > height - ad/2 )
  {
    aydir = -1;
  }
  else if ( ay < 0 + ad/2 )
  {
    aydir = 1;
  }
}

void drawMace()
{
  noStroke();
  fill(150);
  pushMatrix();
    translate(mx,my);
    rotate(float(frameCount)/25);
    ellipse(0,0, md, md);
    triangle(md/2 + sl, 0, 0,  sl, 0, 0 - sl);
    triangle(0 - md/2 - sl, 0, 0, 0 - sl, 0, 0 + sl);
    triangle(0, 0 + md/2 + sl, 0 + sl, 0, 0 - sl, 0);
    triangle(0, 0 - md/2 - sl, 0 - sl, 0, 0 + sl, 0);
  popMatrix();
}

void mouseDragged()
{
  if (mouseX >pmouseX)
  {
    mxSpeed+=.1;
  }
  else if (mouseX < pmouseX)
  {
    mxSpeed-=.1;
  }
  if (mouseY > pmouseY)
  {
    mySpeed+=.1;
  }
  else if (mouseY < pmouseY)
  {
    mySpeed-=.1;
  }
}

void moveMace()
{
  mx += mxSpeed;
  if (mx > width + md/2)
  {
    mx = -md/2;
  }
  else if (mx < 0 - md/2)
  {
    mx = width + md/2;
  }
  my += mySpeed;
  if (my > height + md/2)
  {
    my = -md/2;
  }
  if (my < 0 - md/2)
  {
    my = height + md/2;
  }
}

void detectCollision()
{
  dc = dist(ax + ad/2, ay + ad/2, mx + md/2 + sl, my + md/2 + sl);
  if (dc <= ad )
  {
    if (freshHit == true)
    {
     count++;
     freshHit = false; 
     fill(255);
     rect(0,0, width,height);
    }
  }
  else
  {
    freshHit = true;
  }
}

void keyPressed()
{
  if(keyCode == UP)
  {
    difficulty++;
    if (difficulty > 5)
    {
      difficulty = 5;
    }
    axSpeed++;
    aySpeed++;
    dySpeed++;
    if (axSpeed > 5 )
    {
      axSpeed = 5;
    }
    if (aySpeed > 6)
    {
      aySpeed = 6;
    }
    if (dySpeed > 3)
    {
      dySpeed = 3;
    }
  }
  else if(keyCode == DOWN)
  {
    difficulty--;
    if (difficulty < 1)
    {
      difficulty = 1;
    }
    axSpeed--;
    aySpeed--;
    dySpeed--;
    if (axSpeed < 1)
    {
      axSpeed = 1;
    }
    if (aySpeed < 1)
    {
      aySpeed = 1.5;
    }
    if (dySpeed < 1 )
    {
      dySpeed = 1;
    }
  }
  
  else if (key == TAB)
  {
  size( 600, 600 );
  smooth( );
  background( 112, 111, 255 );
  
  ax = random(0, width);
  ay = random(0, height);
  ad = 75;
  axSpeed = 3;
  aySpeed = 4;
  alive = true;
  freshHit = true;
  
  dd = 75;
  axdir = 1;
  aydir = 1;
  dySpeed = 1;
  
  mx = random(0, width);
  my = random(0, height);
  md = 35;
  mxSpeed = 0;
  mySpeed = 0;
  sl = 15;
  dc = 1;
  count = 0;
  difficulty = 0;
  loop();
  }
  
  else if (keyCode == SHIFT)
  {
    saveFrame("hw7.jpg");
  }
  
}

void mousePressed()
{
  float d = dist(mouseX, mouseY, ax, ay);
  if ( d < ad/2 )
  {
    alive = false;
  }
  else
  {
    alive = true;
  }
}

void drawDeadSmiley( float x, float y, float d)
{
  x = ax;
  y = ay;
  //face
  strokeWeight(2);
  stroke( 0 );
  fill( 189, 190, 240 );
  ellipse( x, y, d, d );
  //eyes
  strokeWeight(5);
  line( x - d*.15, y - d*.2, x - d*.25, y - d*.1 );
  line( x - d*.25, y - d*.2, x - d*.15, y - d*.1 );
  
  line( x + d*.15, y - d*.2, x + d*.25, y - d*.1 );
  line( x + d*.25, y - d*.2, x + d*.15, y - d*.1 );
  //mouth
  stroke( 0 );
  fill( 0 );
  beginShape();
    vertex(x - d*.25, y + d*.125);
    bezierVertex(x - d*.125, y + d*.25, x, y + d*.5, x + d*.25, y + d*.125);
  endShape();
}

void moveDeadSmiley()
{
  ay = ay + dySpeed;
  if (keyPressed)
  {
    if (key == ' ')
    {
    ay-=5;
    }
  }
}

void hell( )
{
  drawFire();
}

void heaven( )
{
  drawCloud(cx - 150, 45);
  drawCloud(cx - 150 - width, 45);
  
  drawCloud(cx,0);
  drawCloud(cx - width,0);
  
  drawCloud(cx+100,60);
  drawCloud(cx+100 - width,60);
 
 
  moveCloud();

}

void drawCloud(float x, float y)
{
  float o;
  o = 200 - ay;
  noStroke();
  translate(x,y);
  fill( 247, 254, 255, o );
  ellipse(30, 50, 20, 20);
  ellipse(45,40, 30, 30);
  ellipse(75,30, 50,50);
  ellipse(103,40, 15,15);
  ellipse(120, 40, 25, 25);
  ellipse(135, 45, 22, 22);
  ellipse(150, 50, 20, 20);
  rect(30,40, 120, 20);
  translate(-x,-y);
}

void moveCloud()
{
  cx++;
  if(cx > width + 475)
  {
    cx = width/2;
  }
}

void drawFire()
{
  float o;
  o = ay - height/4 - 255;
  noStroke();
  fill(147,0,0, o);
  triangle(random(width), random(height-100,height), random(width), height, random(width), height);
  triangle(random(width), random(height-100,height), random(-100,width), height, random(width,width+100), height);
  
  fill(255,132,0, o);
  triangle(random(width), random(height - 75,height), random(width), height, random(width), height);
  
  fill(255, o);
  triangle(random(width), random(height - 50,height), random(width), height, random(width), height);
}

void win()
{
  textAlign(CENTER);
  textSize(18);
  text("SMILEY IS PARTYING IN\nHEAVEN WITH JESUS!!!111!", width/2, height/2);
  textAlign(LEFT);
}

void lose()
{
  textAlign(CENTER);
  textSize(24);
  text("YOU SENT SMILEY TO HELL :'(", width/2, height/2);
  textAlign(LEFT);
}

