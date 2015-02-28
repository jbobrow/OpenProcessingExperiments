
// Homework 5
// copyright Alex Fischer ajfische 2012
//move the mouse to control Smiley
//click the mouse to kill Smiley
//move the mouse up or down to control whether he goes to Heaven or Hell
//click the mouse again to revive Smiley
int z;
void setup( )
{
  size( 400, 400 );
  smooth( );
  background( 112, 111, 255 );

}

void draw( )
{
  drawSmiley( mouseX, mouseY, 100 );
  if(z % 2 == 0) 
  {
    fill( 112, 111, 255 );
    rect( 0, 0, 400, 400 );
    drawSmiley( mouseX, mouseY, 100 );
  } 
  else 
  {
    drawDeadSmiley( mouseX, mouseY, 100 ); 
    fill( 202, 201, 255, 100 );
    rect( 0, 0, 400, 400 );
      if( mouseY > 200 )
      {
        hell();
      }
      else
      {
        heaven();
      }
  }
  
}

void mouseClicked()
{
  z ++ ; // z = z + 1;
  //println(z + ": " + z % 2);
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

void drawDeadSmiley( float x, float y, float d)
{
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

void hell( )
{
  drawFire();
}

void heaven( )
{
  drawCloud(0,0);
  scale(.75);
  drawCloud(150,100);
  scale(1.75);
  drawCloud(125,10);

}

void drawCloud(float x, float y)
{
  float o;
  o = 200 - mouseY;
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

void drawFire()
{
  float o;
  o = mouseY-255;
  noStroke();
  fill(147,0,0, o);
  triangle(random(400), random(300,400), random(400), 400, random(400), 400);
  triangle(random(400), random(300,400), random(-100,400), 400, random(400,500), 400);
  
  fill(255,132,0, o);
  triangle(random(400), random(325,400), random(400), 400, random(400), 400);
  
  fill(255, o);
  triangle(random(400), random(350,400), random(400), 400, random(400), 400);
}


