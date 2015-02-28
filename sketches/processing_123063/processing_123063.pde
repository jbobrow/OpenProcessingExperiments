
// HW_10 - CMU
// Computing for the arts and Processing
// copyright Yasha Mir
// source of west indies flag  http://www.windiescricket.com/
// as on 12.03.2013 none of the other flag images were copyright
// source wikimedia.org/wiki/Category:Flags_by_country


PFont f2,f3;
  int tabX = 50;
  int x=200;
  int y=50;
  int dx = 20;
  int dy = 20;
int []tabY = {100,150,200,250,300,350,400,450,500,550};
String []cupYears = {"1975", "1979", "1983", "1987",
      "1992", "1996", "1999", "2003", "2007", "2011"};
String []winners = {"WEST INDIES", "WEST INDIES", "INDIA", 
         "AUSTRALIA", "PAKISTAN", "SRILANKA", "AUSTRALIA", 
         "AUSTRALIA", "AUSTRALIA", "INDIA"};
String []finalists = {"West Indies & Australia", "West Indies & England", 
         "India & West Indies", "Australia & England", "Pakistan & England", 
         "Srilanka & Australia", "Australia & Pakistan", 
         "Australia & India", "Australia & Srilanka", "India & Srilanka"};
int []teamNo = {8,8,8,8,9,12,12,14,16,14};
color []col ={  color( 185,185,203 ),
                color( 255),
                color( 55,55,57 ),
                color( 200, 0, 200  ),
                color( 255)    
                };
PImage []picture = new PImage[11];
PImage pic;
void setup()
{
  size (800,600);
  f2 = loadFont( "f2.vlw" );   
  f3 = loadFont( "f3.vlw" );
}

void draw()
{
  prepWindow();
  drawTabs();
  showTime();
  tabYears();
  dataCheck();
  cricBall();
}

void prepWindow()
{
    background (col[0]);
    textFont(f2,30);
    fill( 0 );
    textAlign(CENTER);
    text( "CRICKET WORLD CUP WINNERS", width/2, height*.05);     
}

void showTime( )
{
   textFont(f2,20);
   fill( col[4]);
   text( "Time: " + millis( )/1000, width*.9, height*.9 );
}

void drawTabs()
{
  noStroke();
  rectMode(CENTER);
  fill(col[1]);
  for (int i=0;i<tabY.length;i++)
    {          
      rect (tabX,tabY[i],75,20,5,5,10,10);
    }
}

void tabYears()
{
   textFont(f3,20);
   fill(col[2]);
   textAlign(RIGHT,CENTER);
   for (int j=0;j<tabY.length;j++)
      { 
      text ("Year"+" "+cupYears[j],80,tabY[j]);
      }
}

void dataCheck()
{
  textAlign(CENTER);
  
  imageMode(CENTER );

  for ( int i = 0; i < cupYears.length; i++)
  {
    if ( dist( mouseX, mouseY, tabX, tabY[i]) < 15)
    {
      textFont(f3,30);
      int a=i+1;
      picture[i+1]  = loadImage(a+".jpg");
      fill (col[3]);
      text ("Number of Participating Teams = "+teamNo[i],width/2,height*.1);  
      fill (col[4]);
      text (cupYears[i]+" CRICKET WORLD CUP WINNER - "+winners[i],width/2,height*.8); 
      textFont(f2,20);
      text ("The final match was between "+finalists[i],width/2,height*.9);
      image( picture[a], width/2, height/2, 300, 200 );
    }
  }
}

void cricBall()
{
  pic = loadImage ("ball.png");
  image (pic,x,y,50,50);
     y+=dy;
     x+=dx;
    if (x>width || x<0)
  {
  dx=-dx;
  }
 else if (y>height||y<0)
  {
  dy=-dy;
  }
}    


