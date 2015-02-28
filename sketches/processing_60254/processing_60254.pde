
int [] Face = {12000000, 50000000, 100000000, 350000000, 600000000, 800000000};
int [] Twitter = {1000, 750000, 5000000, 75000000, 145000000, 300000000};
int [] LinkedIn = {8000000, 15000000, 33000000, 50000000, 75000000, 135000000};
int [] WordPress = {600000, 2000000, 4300000, 8000000, 11100000, 50000000};
int [] Tumblr = {0, 170000, 1000000, 2000000, 7000000, 38000000};
int [] Posterous = {0, 0, 0, 125000, 4000000, 12000000};

int [] yearsX = {80, 220, 450, 800, 615, 900};
int [] yearsY = {550, 150, 400, 550, 100, 250};
color c1, c2, c3, c4, c5, c6;

void setup ()
{
 size (1200, 650); 
 background (0);
 //smooth ();
 
 
 c1 = #C9ECFF;
 c2 = #1D81B4;
 c3 = #6FFAB5;
 c4 = #B329C9;
 c5 = #C91215;
 c6 = #C97712;
 
 
}

void draw()
{
 dates();
 drawGraph( Face, c2);
 //prepscreen();
 noLoop();
 //printTitle();
}

void dates()
{
 textSize(80);
 fill(240, 234, 56);
 text("2006", 80, 550);
 text("2007", 220, 150);
 text("2008", 450, 400);
 text("2009", 800, 550);
 text("2010", 615, 100);
 text("2011", 900, 250);
 
}


void drawGraph(int [] inArray, color col)
{
 
 //println (inArray.length);
 for (int i = 0; i < inArray.length; i++)
 {
  //int qr= i/ 100000;
  int [] DIV; 
  DIV = new int [inArray [i]/100000];
  {
    //DIV = [0];
    println (DIV.length);
    for (int r = 0; r < DIV.length; r++)
    {
      Drpoint (yearsX, yearsY, col); 
      //println (yearsX[r]);
    }
  }
 }
}

void Drpoint (int [] xCord, int [] yCord, color coll)
{
  println("*");
  strokeWeight (5);
  for (int p = 0; p < xCord.length; p++)
  {
  stroke (coll);
  point (xCord[p] + random ( -80,80), yCord [p] + random (-80, 80));
  }
  
}

void prepscreen()
{
  fill (0,  0, 0, 20);
  rect(0,0, width, height);
  frameRate(24);
  
  
}





