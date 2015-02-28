
//hw13 CMU 48-757 Zack Jacobson-Weaver copywrite 2011
//visualizing electricity consumption according the United Nations Satistical Yearbook 2009
//Hopefully you find it more than a little ironic that it takes electricity to visualize this data ;)

//Source:
//earth image:
//http://wallpapers.yah.in/nature/space/earth-at-night/2012/
//brain image:
//http://web.mit.edu/newsoffice/2011/illuminating-brain-0128.html


int [] juice = {462164,460904,470426,470568,495265,
                510100,524636};

                
PImage e;


float  lBorder, rBorder, tBorder, bBorder, circleSize;

float a,b,wd,ht,r,s;

int mostJuice, leastJuice;

int barX, barY, barWd, barHt;

final int FIRST_YEAR = 2000;
final int LAST_YEAR = 2006;

void setup()
{
  size(800,400);
  noCursor();
  smooth();
  
  
  
  mostJuice = min(juice);
  leastJuice = max(juice);
  
  e = loadImage("image.jpg");
  
  lBorder = 10; 
  rBorder = width - 10;
  tBorder = 10;
  bBorder = height - 10;
  
  circleSize = width/10;
    
}

void draw()
{
  background(0);
  
  images();
  plotPoints();
  mapMouse();
  myCursor();
  werds();
  

}

void plotPoints()
{

 for(int i = 0; i < juice.length; i++)
{ 
  float x = map( i, 0, juice.length, lBorder + circleSize, rBorder);
  float y = map( juice[i], mostJuice, leastJuice, bBorder - circleSize, tBorder + circleSize);
  float circleSize = map(juice[i], leastJuice, mostJuice, width/5, width/50);
  float a = map(juice[i], leastJuice, mostJuice, 99, 20);
  float t = map(juice[i], leastJuice, mostJuice, 28, 12);
  
  stroke(255,255,0);
  point(x,y);
  
  ellipseMode(CENTER);
  noStroke();
  fill(255,255,0,a);
  ellipse(x,y,circleSize*.75,circleSize*.75);
  ellipse(x,y,circleSize/2,circleSize/2);
  ellipse(x,y,circleSize,circleSize);
  
     fill(255,255,0);
     int year = (i + FIRST_YEAR);
     textAlign(CENTER);
     textSize(t);
     text(year, x, y+40 );
  }
} 
  
void images()
{
  image(e,30,20);
}

void mapMouse()
{
  a = 0;
  b = 0;
  
  if (mousePressed && mouseX >= lBorder + 75 && mouseX <= rBorder - 75)
 {
   for(int i = 0; i < juice.length; i++)
   {
   a = int(map( mouseX, lBorder , rBorder, juice[i]/2500, 0));
   b = int(map( mouseX, lBorder , rBorder, 0, juice[i]/2000));
   }
 } 
 
 fill(0,0,0,a);
 rect(30,20,200,200);
 fill(0,0,0,b);
 rect(220,20,200,200);
 }
 
 void myCursor()
 {

   ht = mouseX/15;
   wd = mouseX/15;
   a = mouseX/3;
   
   fill(248,252,194,a);
   ellipse(mouseX,mouseY,wd,ht);
   ellipse(mouseX,mouseY + ht/3,wd*.66,ht);
   fill(245,210,10,a);
   ellipse(mouseX,mouseY,wd*.7,ht*.7);
   ellipse(mouseX,mouseY + ht/2*.6,wd*.66*.7,ht);
   fill(139,137,126);
   rect(mouseX- wd/5,mouseY + ht*.7, wd/2.5,ht/4);
   
 }
 
 void werds()
 {
  
   fill(99,89,252);
   textSize(15);
   
   text("Relative Global Electricity Consumption from 2000 to 2006 according to the U.N.", width/2,height-25);
   text("Click and Drag the Cursor through the years to See the Effects.", width/2,height-5);
   
   fill(255,255,0);
   ellipse(width - 250,height - 100,1,1);
   fill(99,89,252);
   textAlign(LEFT);
   textSize(12);
   text(" = 1000 Metric Tons of Oil Equivalent", width - 240,height - 96);
 }
 
 
  







