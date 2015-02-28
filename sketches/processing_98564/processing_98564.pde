

float diam;

float [] xSpace = {100, 200, 300, 400, 500, 150, 250, 350, 450, 550};
float [] ySpace = {100, 100, 100, 100, 100, 120, 120, 120, 120, 120};
String [] decade = {"1920s", "1930s", "1940s", "1950s", "1960s", "1970s", "1980s", "1990s", "2000s", "2010s"};
String [] songTitle = {
                  "My Blue Heaven (1927)",
                 "Silent Night (1935)",
                 "White Christmas (1942)",
                 "Rock Around the Clock (1954)",
                 "I'm a Believer (1966)",
                 "Yes Sir, I Can Boogie (1977)",
                 "We Are the World (1985)",
                 "Something About the Way You Look Tonight (1997)",
                 "Can't Get You Out of My Head (2001)",
                 "Rolling in the Deep (2010)"};
String [] artist = {
                 "Gene Austin",
                 "Bing Crosby", 
                 "Bing Crosby",
                 "Bill Haley & His Comets",
                 "The Monkees",
                 "Baccara",
                 "USA for Africa",
                 "Elton John",
                 "Kylie Minogue",
                 "Adele"};
String [] sales = {
                 "5 Million Copies",
                 "30 Million Copies",
                 "50 Million Copies",
                 "25 Million Copies",
                 "10 Million Copies",
                 "16 Million Copies",
                 "20 Million Copies",
                 "33 Million Copies",
                 "10 Million Copies",
                 "13.5 Million Copies" };
PImage music;
float x, y; 

void setup ( )
{
  size (650, 400);
  smooth ( );
  rectMode (CENTER);
  textAlign (CENTER);
  
  music = loadImage("sheetmusic.jpeg");
  
  diam = 20;
}

void draw ( )
{
  background (155);
  template ( );
  decades ( );
  showInfo ( );
}

void template ( )
{
 image (music, 0, 0);
 fill(0);
 textSize (20);
 text("The Best Selling Singles of the Past Century", width/2, 40); 
 pushStyle ( );
     noStroke ( );
     fill (255, 90);
     rect (width/2, 260, 470, 150);
 popStyle ( );
}

void decades ( )
{
  for (int i= 0; i <xSpace.length; i++)
  {
    musicNote (xSpace[i], ySpace[i], diam );
    textSize (12);
    text (decade[i], xSpace[i], ySpace[i]+((3*diam)/2));
  }
}

void musicNote (float x, float y, float diam )
{
  pushStyle ( );
    fill (0);
    noStroke ( );
    ellipse (x, y, diam, diam);
  popStyle ( );
  strokeWeight (4);
  line ((x+diam/2)-2, y, (x+diam/2)-2, y-2*diam);
}

void showInfo ( )
{

  for (int i = 0; i<xSpace.length; i++)
  {
    if (mouseX <= xSpace[i]+(diam/2) && mouseX >= xSpace[i]-(diam/2) && 
      mouseY <= ySpace[i]+(diam/2) && mouseY >= ySpace[i]-(diam/2))
      {
      textSize (18);
      text(songTitle[i], width/2, 240); 
      textSize (16);
      text(artist[i], width/2, 270);
      textSize (12);
      text(sales[i], width/2, 300);   
      }
  }
}


