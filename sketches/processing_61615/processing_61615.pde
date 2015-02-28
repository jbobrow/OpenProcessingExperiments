
float [ ] years50 = {7, 10, 8, 11.5, 9, 2.5, 2, 11}; // years going from 2001 to 2011
float [ ] rank50 = { 1, 2, 3, 4, 5, 8, 9, 10}; // rank of 50 free time overall
String [ ] names50 = {"Seiger", "Burton", "Connell", "Stillo", "Andrews", "Rapp", "Tibor", "Gonzalez"};
float [ ] years1650 = {9, 11, 5, 11.3, 3, 8, 11.6, 10};
float [ ] rank1650 = {1, 2, 3, 4, 5, 8, 9, 10};
String [ ] names1650 = {"Evans", "Adams", "Kochalko", "Menio", "Wong", "Wong", "Yuan", "Sung"};
float [ ] myears50 = {2, 2.5, 8, 5, 3, 11, 10, 9, 10.5};
float [ ] mrank50 = {1, 2, 3, 4, 5, 7, 8, 9, 10};
String [ ] mnames50 = {"Jucha", "Shewchuk", "Snyder", "Krzeminski", "Powell", "Stanton", "Dahlen", "Pearl", "Moorby"};
float [ ] myears1650 = {9, 9.3, 2, 9.6, 10, 3, 3.5, 8};
float [ ] mrank1650 = {1, 2, 3, 4, 5, 7, 8, 9};
String [ ] mnames1650 = {"McConnell", "Altman-Kurosaki", "Pearson", "Winkler", "Olechnowicz", "Paavola", "Gaines", "Douglass"};

float x, dx;
color cm, cw, colm, colw;

void setup( )
{
  size( 600, 600 );
  x = 0;
  dx = .05;
  cm = color (62, 206, 202, 50);
  colm = color (62, 206, 202, 90);
  cw = color (255, 57, 93, 50);
  colw = color (255, 57, 93, 90);
  noStroke();
  smooth ();
}

void draw( )
{
  background( 0 );
  
  shiftCircles ( );

  drawCircles (years50, rank50, height*.20, cw, colw ); 
  drawCircles (years1650, rank1650, height*.50, cw, colw );
  drawCircles (myears50, mrank50, height*.35, cm, colm ); 
  drawCircles (myears1650, mrank1650, height*.65, cm, colm );
  names (years50, names50, height*.20 );
  names (years1650, names1650, height*.5 );
  names (myears50, mnames50, height*.35 );
  names (myears1650, mnames1650, height*.65 );
  
  titles ();
}

void titles ()
{
  fill (200);
  textSize (10);
  text ("women's", 20, height*.19);
  text ("50 free", 20, height*.21);
  text ("men's", 20, height*.34);
  text ("50 free", 20, height*.36);
  text ("women's", 20, height*.49);
  text ("1650 free", 20, height*.51);
  text ("men's", 20, height*.64);
  text ("1650 free", 20, height*.66);
  textSize (20);
  fill (200, 70);
  text ("2001", 50, height*.8);
  text ("2011", width*.85, height*.8);
  fill (200);
  text ("CMU Swimming's top times in the past 10 years", width/5, height*.9);
  textSize (10);
  fill (200, 80);
  text ("smaller circles represent faster times - mouse over to see who swam them", width/2.77, height*.93);
}

void names ( float [] y, String [] n, float h )
{
     
  for (int i = 0; i < y.length; i++)
  {
    if (dist (y[i]*50, h, mouseX, mouseY) < 10)
    {
      fill (200, 70);
    }
    else
    {
      fill (0,0);
    }
    textSize (20);
    text (n[i], 30, 30);
  }
}
void drawCircles(float [] y, float [] r, float h, color c, color col)
{
  for( int i = 0; i < y.length; i++)
 {
    if ( x < y[i])
    {
      strokeWeight (1);
      fill (c);
       ellipse( x*50, h, r[i]*10, r[i]*10 );  // draw circle at position x
    }
    else
    {
      if (dist (y[i]*50, h, mouseX, mouseY) < 10)
      {
        fill (col);
      }
      else
      {
        fill (c);
      }
      ellipse( y[i]*50, h, r[i]*10, r[i]*10 );  // draw circle in final position
    }
 }
}

void shiftCircles( )
{
  x = x + dx;
  if (x > width)
  {
     x = 1;
  }
}
