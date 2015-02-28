
//Patrick Clancy
//Homework 12
//Copyright Patrick Clancy Carnegie Mellon University 2012

// Record high temperature for NY

// Record data from: http://www.nyc.com/visitor_guide/weather_facts.75835/editorial_review.aspx
// jan 68 feb 73 mar 83 april 89 may 98 june 99 july 105 aug 101 sept 98 oct 86 nov 80 dec 75


int [] tempRec= {68, 73, 83, 89, 98, 99, 105, 101, 98, 86, 80, 75};
int [] monthOrder= {15, 45, 75, 105, 135, 165, 195, 225, 255, 285, 315, 345};

float topEdge, bottomEdge, leftEdge, rightEdge;
float x, y;
float diam[];

int value = #7DCACB;

color circol;

void setup()
{
  
    topEdge =510;
  bottomEdge = 0;
  leftEdge = 0;
  rightEdge = 360;
  
  size((int)rightEdge,(int)topEdge);
  smooth();
 background(value);
  

  
  diam = new float[12];
  
  circol = color(#EA3507);
}
  
void draw()
{
  drawChart();
  drawCircle();
  createBackground();

//  keypressed();
//I want to make the years show up for the points when spacebar is pressed.

}


void createBackground()
{
  if (keyPressed)
  {
    if (key ==' ')
    {
      background(#7DCACB);

textSize(12);

fill(0);
text("1967", 20, 345); 
fill(0);
text("1985", 50, 325);
fill(0);
text("1990", 80, 280); 

text("1977", 110, 250);
text("1969", 100, 210);
text("1964", 170, 200);
text("1966", 160, 175); 
text("1975", 230, 190);
text("1983", 260, 205); 
text("1990", 290, 260); 
text("1974", 320, 290);
text("1998", 305, 315);
    }
}
}


void drawCircle()
{
  float range = topEdge - bottomEdge;
 for ( int i = 0 ; i < tempRec.length ; i++ )
 { 
   float y = map(tempRec[i], max(tempRec), min(tempRec), bottomEdge + (range / 3), topEdge - (range / 3));
   float x = map(monthOrder[i], max(monthOrder), min(monthOrder), leftEdge, rightEdge);
   
//   float x = map(i, 0, monthOrder.length, leftEdge, rightEdge);
//   float y = map(i, 0, tempRec.length, topEdge, bottomEdge);
   
   noStroke();
   
   fill(calculateColor((int)max(tempRec), (int)min(tempRec), (int)tempRec[i]));
   
   ellipse(monthOrder[i], y, 5, 5);
 }
}
   

void drawChart()
{
  stroke(#0D3112);
  strokeWeight(.5);
  
  line(leftEdge+15, topEdge-25, rightEdge-15, topEdge-25);
  //line(leftEdge+15, bottomEdge-25, leftEdge+15, topEdge+10);
  
  fill(0);
  
  text("January", leftEdge+10, topEdge-10);
  text("December", rightEdge-70, topEdge-10);
}
 
 color calculateColor (int maxTemp, int minTemp, int temp)
 { 
   
   int avg = ((maxTemp + minTemp) / 2 );
   int r = (int)map(temp, 1.3 * avg, maxTemp, 0, 255);
   int b = (int)map(temp, minTemp * 1.3, avg, 0, 255);
    if(temp > avg)
       return color(r, 0, 0);
   else
       return color(0,0,b);
   
 }
   
   

  

