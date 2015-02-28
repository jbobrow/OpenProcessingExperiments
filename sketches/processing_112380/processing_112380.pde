
/* @pjs font= "MissFajardose-Regular.ttf" ; */

float x = 0;
float x1 = 0;
float y = 350;
float y1 = 350;
float y2 = 325;
PImage merm ;
PFont myfont;



void setup()
{
  size(584,630);
  merm = loadImage("Mbw.jpg") ;
  noStroke();
  smooth();
  myfont = createFont("MissFajardose-Regular.ttf", 42) ;
textFont(myfont, 42) ;
fill(0);
smooth();

}
 
void draw() 
{
textFont(myfont, 42) ;
image(merm, 0, 0) ;
fill(#F0F0F0) ;
text("A  mermaid  would  have", 57, 478) ;
text("thought   oneself  high  in  the  air,", 57, 508) ;
text("with  the  canopy  of  heaven  above  and  around,", 57, 540) ;

  y1 = y1 + 1;
  if (y1 > 575) {
    y1=575 ;
  }
  text("rather  than  at  the  bottom  of  the  deep  sea.",  57,y1);

// bubble area
y = y - 1;
y2 = y2 - 2;


fill (130,97) ;
ellipse(30,y+40,30,30 );

ellipse(50,y2+15,45,45 );

ellipse(100,y2+140,10,10 );

ellipse(125,y2+80,15,15 );

ellipse(300,y+300,10,10 );




ellipse(150,y2+60,10,10 );

ellipse(250,y+30,20,20 );

ellipse(600,y+200,20,20 );

ellipse(500,y+140,20,20 );

ellipse(520,y2+130,30,30 );

if (y2 < 0)
{y2 = height;}
  
if (y < 0)
  {y = height ;}
  
  
}




