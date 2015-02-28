
/*
Program Name: Weird Buttons

Copyright (C) 2010, Oscar Bao

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

boolean firstRoll = true;
boolean secondRoll = false;
boolean thirdRoll = false;
boolean screenOver1 = false;
boolean realBackground = true;
boolean fakeBackground = false;
boolean activ_button_3 = false;
boolean realBackground2 = false;

float handY = 0;

int secondNum = 0;
int secondCount = 0;

void setup()
{
  smooth();
  size(640, 480);
}

void draw()
{
  if(realBackground == true || realBackground2 == true)
  {
    background(0, 255, 0);
  }
  if ( secondNum != second() )
  {

    secondNum = second();
    secondCount++;
  }


  button3 (180, 25, 50, 50);
  button2 (110, 25, 50, 50);  
  button1 (40, 25, 50, 50);
  button1 (250, 25, 50, 50);


  // button4 (250, 25, 50, 50);
}

void button1 ( int a, int b, int c, int d )
{

  fill( 0, 0, 255 );
  rect( a, b, c, d );

  if( mouseX > a && mouseX < a + 50 &&
    mouseY > b && mouseY < b + 50 && 
    secondCount < 1 )
  {
    fill( 0, 0, 255);
    ellipse( width/2, height/2, 100, 100);
    fill( 255, 0, 0);
    rect( a, b, c, d);

    firstRoll = false;
    secondRoll = true;
    thirdRoll = false;
  }

  if( mouseX > a && mouseX < a + 50 &&
    mouseY > b && mouseY < b + 50 && 
    secondCount >= 1 && secondCount < 2 )
  {

    fill( 0, 0, 255);
    ellipse( width/2, height/2, 200, 200);
    fill( 255, 0, 0);
    rect( a, b, c, d);

    firstRoll = false;
    secondRoll = false;
    thirdRoll = true;
  }

  if ( mouseX > a && mouseX < a + 50 &&
    mouseY > b && mouseY < b + 50 && 
    secondCount >= 2 && secondCount < 3 )
  {

    fill( 0, 0, 255);
    ellipse( width/2, height/2, 300, 300);
    fill( 255, 0, 0);
    rect( a, b, c, d);

    firstRoll = true;
    secondRoll = false;
    thirdRoll = false;
  }


  if ( mouseX > a && mouseX < a + 50 &&
    mouseY > b && mouseY < b + 50 && 
    secondCount >= 3 && secondCount < 4)
  {

    fill( 0, 0, 255);
    ellipse( width/2, height/2, 200, 200);
    fill( 255, 0, 0);
    rect( a, b, c, d);

    firstRoll = true;
    secondRoll = false;
    thirdRoll = false;
  }


  if ( mouseX > a && mouseX < a + 50 &&
    mouseY > b && mouseY < b + 50 && 
    secondCount >= 4 && secondCount < 5 )
  {

    fill( 0, 0, 255);
    ellipse( width/2, height/2, 100, 100);
    fill( 255, 0, 0);
    rect( a, b, c, d);

    firstRoll = true;
    secondRoll = false;
    thirdRoll = false;
  }


  if ( mouseX > a && mouseX < a + 50 &&
    mouseY > b && mouseY < b + 50 && 
    secondCount >= 5 && secondCount < 6 )
  {

    fill( 0, 0, 255);
    ellipse( width/2, height/2, 50, 50);
    fill( 255, 0, 0);
    rect( a, b, c, d);

    firstRoll = true;
    secondRoll = false;
    thirdRoll = false;
  }


  if ( secondCount >= 6 )
  {

    secondCount = 0;
  }
}


void button2 ( int a, int b, int c, int d )
{
  fill( 0, 0, 255 );
  rect( a, b, c, d );



  if ( mouseX > a && mouseX < a + 50 &&
    mouseY > b && mouseY < b + 50 )
  {
    fill(255, 0, 0);
    rect(a, b, c, d);
    screenOver1 = true;
  }

  if(screenOver1)
  {
    fill(0);  
    if(mousePressed)
    {
      background(pmouseX, pmouseY, pmouseX);
    }
    fill(width/2, height/2, width/2);  
    ellipse(width/2, height/2, 350, 350);  
    fill(mouseX);  
    polygon(width/2, height/2, mouseX/100 + 3, mouseX/8 + 100);  
    fill(mouseX, mouseX, mouseY);  
    polygon(width/2, height/2, mouseX/70 + 3, mouseX/8 + 80);   
    fill(0);  
    polygon(width/2,height/2, mouseY/100 + 3, mouseY/8 + 80);

    rect( width - 100, height - 100, 50, 50);

    if( mouseX > width - 100 && mouseX < width - 50 &&
      mouseY > height - 100 && mouseY < height - 50)
    {
      fill(255, 0, 0);
      rect(width - 100, height - 100, 50, 50);
    }

    if( mouseX > width - 100 && mouseX < width - 50 &&
      mouseY > height - 100 && mouseY < height - 50 && 
      mousePressed )
    {
      screenOver1 = false;
      realBackground = true;
      fakeBackground = false;
    }
  }
}


void polygon(int _x, int _y, int sides, float radius) {  

  if (sides <= 0)  
    sides = 1;  

  beginShape();  
  for ( int i = 0; i < 360; i += (360 / sides) ) {  
    float x = _x + sin(radians(i)) * radius;  
    float y = _y + cos(radians(i)) * radius;  
    vertex(x, y);  
    //    ellipse(x, y, 2, 2);  
    if(mousePressed)  
    {  
      fakeBackground = true;
    }
    if(fakeBackground)

    {
      background(pmouseX, pmouseY, pmouseX);
      fill(0, 0, 255);
      rect(180, 25, 50, 50);
      fill(255, 0, 0);
      rect(110, 25, 50, 50);
      fill(0);
    }
  }  
  endShape(CLOSE);
}


void button3 ( int a, int b, int c, int d )
{
  fill( 0, 0, 255);
  rect(a, b, c, d);

  if( mouseX > a && mouseX < a + c &&
    mouseY > b && mouseY < b + d)
  {
    activ_button_3 = true;
  }

  if(activ_button_3)
  {
    {
      background(0, 255, 0);
      face( width/2, height/2 );
      strokeWeight(1);
      fill(0);
      rect(width - 100, height - 100, 50, 50);
      fill( 255, 0, 0);
      rect(a, b, c, d);
    }
  }
  strokeWeight(1);


  if(mouseX > width - 100 && mouseX < width - 50 &&
    mouseY > height - 100 && mouseY < height - 50)
  {
    fill(255, 0, 0);
    rect(width - 100, height - 100, 50, 50);

    if(mousePressed)
    {
      realBackground2 = true;
    } 

    if(realBackground2 == true)
    {
      activ_button_3 = false;
      realBackground2 = false;
    }
  }
}

void face( float l, float r)
{


  strokeWeight(20);
  stroke(0, 0, 255);
  fill(255); 
  ellipse( l, r, 300, 300);

  strokeWeight(0);
  stroke(0);
  ellipse( l - 55, r - 50, 40, 40);
  ellipse( l + 55, r - 50, 40, 40);
  fill(0);
  lefteye( l - 55, r - 50 );
  righteye( l + 55, r - 50);



  fill(255);
  strokeWeight(5);
  smile(width/2 - 30, height/2 + 50, width/2 + 30, height/2 + 50);
  strokeWeight(10);
  shorthand( width/2, height/2);
  longhand(width/2, height/2);
}

void lefteye( float x, float y)
{
  if(mousePressed)
  {
    line( x-18, y, x+18, y);
  }
  else
  {
    ellipse( x, y, 20, 20);
  }
}

void righteye( float x, float y)
{
  ellipse( x, y, 20, 20);
}

void shorthand( float x, float y)
{

  pushMatrix();
  translate(width/2, height/2);
  rotate(mouseX/40);
  if ( mouseX > 0)
  {
    line (0, 0, 5,  - 55);
  }
  else
  {
    line (0, 0, - 50,+ 10);
  }
  popMatrix();
}


void longhand( float x, float y)
{
  pushMatrix();
  translate(width/2, height/2);
  rotate(mouseX/10);
  if( mouseX > width/2)
  {
    line(0, 0,  + 120,  - 10);
  }
  else
  {
    line(0, 0, - 10, - 100);
  }
  popMatrix();
}


void smile(float a, float b, float c, float d)
{


  if(mouseX> width/2)
  {
    bezier(width/2 - 65, height/2 + 75, a, b, c, d, width/2 + 65, height/2 + 75);
    line(width/2 - 40, height/2 - 60, width/2 - 80, height/2 - 85); 
    line(width/2 + 40, height/2 - 60, width/2 + 80, height/2 - 85);
  }
  else
  {
    bezier(width/2 - 65, height/2 + 20, a, b, c, d, width/2 + 65, height/2 + 20);
    line(width/2 - 40, height/2 - 75, width/2 - 80, height/2 - 65);
    line(width/2 + 40, height/2 - 75, width/2 + 80, height/2 - 65);
  }
}


