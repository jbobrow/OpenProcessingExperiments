
/* ------------------------------------------------------------------------------ ass1.pde
Intent
~~~~~~
This program is supposed to show symmetry and periodicity for assignment1.

Designed
CAI LINFENG July

Modified
~~~~~~~~

*/
// ---------------------------------------------------------------------------- initialisation
// Global (i.e. PApplet-wide) constants and variables
final int width=screen.width;//width of the screen
final int height=screen.height;//height of the screen
float angle1,angle2,angle3,angle4;// the angle of circling
float sidelength=screen.height;//the side length of the rects
float angle=0;//angle of rotate
float delta=0.05;//Y coordinate change
float delta1=0.005;//rectangle circling change
float delta2=0.5;//color change
float colori=0;//color patameter
float colorm=0;//color patameter
float colorn=0;//color patameter
float coloro=0;//color patameter
float colorp;//color patameter
int lowlimit=10;//the lowlimit of sidelength
int colour1=30;//colour range
int colour2=90;//colour range
int colour3=150;//colour range
float j=1;//patameter
float sidechange =0.00001;//sidelength change

// -------------------------------------------------
void setup() {
 angle1=angle2=angle3=angle4=0.0;
  size(screen.width, screen.height,P3D) ;
  background(0) ;
  frameRate(10);
}

// ------------------------------------------------------------------------------ main methods
void draw() {
   background(0,100) ;
   translate(width/2, height/2);
   angle+=delta;
   rotateY(angle);//rotate y at a periodic time
   drawRect1(sidelength);//draw a set of rectangles on one plane
   sidelength=sidelength/j;
   if(sidelength>=screen.height){
         j=j;
         }
         if(sidelength<=lowlimit){
        j=1/j;
        }// the change of side length
   rotate(PI/4);
   drawRect2(sidelength);//draw a set of rectangles on the same plane by changing their angles PI/4
   rotate(-PI/4);
   rotateY(-angle);
   rotateY(PI/2);
   rotateY(-angle);
   drawRect3(sidelength);//draw a set of rectangles on another plane.
   rotate(PI/4);
   drawRect4(sidelength);//draw a set of rectangles on the same plane by changing their angles PI/4
   rotate(-PI/4);
}
     void drawRect1(float sidelength)  { 
      for( float y=sidelength;y>lowlimit;y=2*y/3){
      colorMode(HSB);
      color colour=color(colorp,255,255);
      fill(colour,50);
      noStroke();
      angle1=angle1+delta1;//keep the rectangles circling
      rotate(angle1);
       rectMode(CENTER);
       rect(0,0,y,y);
      rotate(-angle1);
      colorp=colour1+colour1*cos(colori/2);//set colour value
      colori+=delta2;
      j=j+sidechange;
      if(y>=screen.height){
         sidechange=sidechange;
         }
         if(y<=lowlimit){
        sidechange=-sidechange;
        }
      }// the parameter of side length change
   }
      void drawRect2(float sidelength)  { 
       for( float y=sidelength;y>lowlimit;y=2*y/3){
         colorMode(HSB);
        color colour=color(colorp,255,255);
      fill(colour,50);
      noStroke();
         angle2=angle2-delta1;//keep the rectangles circling
       rotate(angle2);
       rectMode(CENTER);
       rect(0,0,y,y);
      rotate(-angle2);
      colorp=colour2+colour1*sin(colorm);//set colour value
      colorm+=delta2;
     }
   }
        void drawRect3(float sidelength)  { 
      for( float y=sidelength;y>lowlimit;y=2*y/3){
      colorMode(HSB);
        color colour=color(colorp,255,255);
      fill(colour,50);
      noStroke();
      angle3=angle3+delta1;//keep the rectangles circling
       rotate(angle3);
       rectMode(CENTER);
       rect(0,0,y,y);
      rotate(-angle3);
      colorp=colour3+colour1*sin(colorn+1);//set colour value
      colorn+=delta2;
     }
   }
         void drawRect4(float sidelength)  { 
       for( float y=sidelength;y>lowlimit;y=2*y/3){
        colorMode(HSB);
        color colour=color(colorp,255,255);
        fill(colour,50);
        noStroke();
         angle4=angle4-delta1;//keep the rectangles circling
       rotate(angle4);
       rectMode(CENTER);
       rect(0,0,y,y);
      rotate(-angle4);
      colorp=colour2+colour3*cos(coloro);//set colour value
      coloro+=delta2;
     }
   }
   
// ----------------------------------------------------------------------------------- classes
/*
classes referenced
''''''''''''''''''
<class name> - <filename>
*/
// -------------------------------------------------------------------------------------------

