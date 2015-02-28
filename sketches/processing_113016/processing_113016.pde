
//press key 'up' to enlarge the cookie 

float x, y, wd, ht;
float diameter;

void setup ()
{
   size ( 400, 400 );
   x = 200;
   y = 200;
   frameRate (2);
}

void draw ()
{
 prepScreen ();
 cookie (x, y, diameter);
}

void keyPressed ()
{
    if ( key == CODED )
      if ( keyCode == UP )
        {
          diameter = diameter + 5; 
        }
      else if ( keyCode == DOWN )
        {
          diameter = diameter - 5;
        }
      if ( keyCode == '1' ) //firstBite
        {
          fill ( 250 , 238 , 192 );
          ellipse ( x*.8 , y*.8, diameter/1.2, diameter/1.2 );
        }
      else if ( keyCode == '2' ) //secondBite
        {
          fill ( 250 , 238 , 192 );
          ellipse ( x*.8 , y*.8, diameter/1.2, diameter/1.2 );
          ellipse ( x*1.1 , y*.9 , diameter , diameter );
        }
      else if ( keyCode == '3') //thirdBite
        {
          fill ( 250 , 238 , 192 );
          ellipse ( x , y , diameter*1.2 , diameter*1.2);
        }
      else if ( keyCode == '4') //fourthBite
        {
          fill ( 250 , 238 , 192 );
          ellipse ( x , y , diameter*1.2 , diameter*1.2);
          fill ( 193 , 4, 26 );
          textSize (85);
          text ( "NO MORE" , 0 , y );
        }
      if ( keyCode == RIGHT )
        {
          fill ( 255 , 237 , 222 );
          ellipse ( x - diameter/2.4 , y - diameter/4 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/8 , y - diameter/4 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/20 , y - diameter/2.5 , diameter/8 , diameter/8 );
          ellipse ( x + diameter/4 , y - diameter/5 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/3 , y + diameter/3 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/20 , y + diameter/2.5 , diameter/8 , diameter/8 );
          ellipse ( x + diameter/3 , y + diameter/4 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/3 , y + diameter/10 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/20 , y + diameter/30 , diameter/8 , diameter/8 );
          ellipse ( x + diameter/10 , y - diameter/6 , diameter/8 , diameter/8 );
          ellipse ( x + diameter/4 , y + diameter/10 , diameter/8 , diameter/8 );
        }
      if ( keyCode == LEFT )
        {
          fill ( 77 , 32 , 5 );
          ellipse ( x - diameter/2.4 , y - diameter/4 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/8 , y - diameter/4 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/20 , y - diameter/2.5 , diameter/8 , diameter/8 );
          ellipse ( x + diameter/4 , y - diameter/5 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/3 , y + diameter/3 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/20 , y + diameter/2.5 , diameter/8 , diameter/8 );
          ellipse ( x + diameter/3 , y + diameter/4 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/3 , y + diameter/10 , diameter/8 , diameter/8 );
          ellipse ( x - diameter/20 , y + diameter/30 , diameter/8 , diameter/8 );
          ellipse ( x + diameter/10 , y - diameter/6 , diameter/8 , diameter/8 );
          ellipse ( x + diameter/4 , y + diameter/10 , diameter/8 , diameter/8 );
        }
}



void prepScreen ()
{
  fill ( 250 , 238 , 192 );
  rect ( 0, 0 , width , height );
}

void cookie (float x, float y, float diameter)
{ 
  //
  noStroke ();
  fill ( 116, 81, 46 );
  ellipse ( x, y, diameter+2 , diameter+2 );
  //
  fill ( 216, 172, 125 );
  ellipse ( x-4, y-4, diameter , diameter ); 
  //chocolate_topping
  noStroke ();
  fill ( 77 , 32 , 5 );
  ellipse ( x - diameter/2.4 , y - diameter/4 , diameter/8 , diameter/8 );
  ellipse ( x - diameter/8 , y - diameter/4 , diameter/8 , diameter/8 );
  ellipse ( x - diameter/20 , y - diameter/2.5 , diameter/8 , diameter/8 );
  ellipse ( x + diameter/4 , y - diameter/5 , diameter/8 , diameter/8 );
  ellipse ( x - diameter/3 , y + diameter/3 , diameter/8 , diameter/8 );
  ellipse ( x - diameter/20 , y + diameter/2.5 , diameter/8 , diameter/8 );
  ellipse ( x + diameter/3 , y + diameter/4 , diameter/8 , diameter/8 );
  ellipse ( x - diameter/3 , y + diameter/10 , diameter/8 , diameter/8 );
  ellipse ( x - diameter/20 , y + diameter/30 , diameter/8 , diameter/8 );
  ellipse ( x + diameter/10 , y - diameter/6 , diameter/8 , diameter/8 );
  ellipse ( x + diameter/4 , y + diameter/10 , diameter/8 , diameter/8 );
}






