
// Copyright 2014 Jacklynn Pham
// Week 3, ICE #4

float x,y,diam; //global variables - not inside braces
color col;

//*********** SETUP***********************
void setup() // setup header
{
  size (400, 400);
  smooth(); 
  background (0);
  
  col = color(0,200,0);
}

//*********** DRAW ***********************
void draw () // draw header, repeats 60x a second
{
  fill( 0, 200, 0 ); 
 circle( 200, 200, 100 ); 
 
 circle( 300, 200, 50, col ); 
 noLoop( ); 
}//** end draw

void circle (float x, float y, float diam, color c)
{
 fill(col);
 ellipse(x,y,diam,diam); 
}

void circle (float x, float y, float diam)
{
 fill(0,0,200);
 ellipse(x,y,diam,diam); 
}


