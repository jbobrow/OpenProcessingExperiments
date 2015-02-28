
// Homework 6
// copyright Alex Fischer ajfische 2012
//CLICK on Smiley to kill him
//press the SPACEBAR rapidly to keep him from falling to hell
//use the UP and DOWN arrow keys to change the difficulty
//press TAB to reset the game
int z;
float ax, ay, ad, axSpeed, aySpeed, axdir, aydir,
      dx, dy, dd, dxSpeed, dySpeed, dxdir, dydir,
      cx, cxSpeed;
boolean alive;
int diff = 2;




void setup( )
{
  size( 400, 400 );
  smooth( );
  background( 112, 111, 255 );
  
  ax = width/2;
  ay = height/2;
  ad = 75;
  axSpeed = 2;
  aySpeed = 3;
  alive = true;
  
  dd = 75;
  axdir = 1;
  aydir = 1;
  dySpeed = 1;
  

}

void draw( )
{
  if (alive)
  {
    prepWindow();
    drawSmiley(ax, ay, ad);
    moveSmiley();
  }
  else
  {
    fill( 202, 201, 255, 50 );
    rect( 0, 0, 400, 400 );
    drawDeadSmiley(dx, dy, dd);
    moveDeadSmiley();
    
    if(ay > 200)
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
    else if(ay - ad/2 > 400)
    {
      lose();
      noLoop();
    }
  }
}

void prepWindow()
{
  fill( 112, 111, 255 );
  rect( 0, 0, 400, 400 );
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

void keyPressed()
{
    if(keyCode == UP)
  {
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
    ax = width/2;
    ay = height/2;
    ad = 75;
    axSpeed = 2;
    aySpeed = 3;
    alive = true;
  
    dd = 75;
    axdir = 1;
    aydir = 1;
    loop();
  }
  
}

void mousePressed()
{
  float d = dist(mouseX, mouseY, ax, ay);
  if ( d < ad/2 )
  {
    alive = false;
    println("hit");
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
  drawCloud(cx - 150 - 400, 45);
  
  drawCloud(cx,0);
  drawCloud(cx - 400,0);
  
  drawCloud(cx+100,60);
  drawCloud(cx+100 - 400,60);
 
 
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
  o = ay - 255;
  noStroke();
  fill(147,0,0, o);
  triangle(random(400), random(300,400), random(400), 400, random(400), 400);
  triangle(random(400), random(300,400), random(-100,400), 400, random(400,500), 400);
  
  fill(255,132,0, o);
  triangle(random(400), random(325,400), random(400), 400, random(400), 400);
  
  fill(255, o);
  triangle(random(400), random(350,400), random(400), 400, random(400), 400);
}

void win()
{
  textAlign(CENTER);
  textSize(18);
  text("SMILEY IS PARTYING IN\nHEAVEN WITH JESUS!!!111!", width/2, height/2);
}

void lose()
{
  textAlign(CENTER);
  textSize(24);
  text("YOU SENT SMILEY TO HELL :'(", width/2, height/2);
}

