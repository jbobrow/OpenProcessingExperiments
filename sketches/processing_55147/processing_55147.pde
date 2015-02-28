
/* Pierre Pothier-Bradley YSDN
   With help from Borzu, much appreciated.
*/ 

float x1 = -10;
float x2 = -10;
float y2 = 260;

void setup (){
  size (250,250);
  background (255);
//  noStroke();
smooth();
}

void draw(){
  stroke(#FBB117);
  fill (#FBB117);
  rect (0,0, width, height);
  stroke(0);
  strokeWeight(6);
  line (x1, x1, x1+10, x1+10); //starting position of dash x
  x1 = x1+1;    //active element
  
   line (x2,y2,x2+10,y2-10); //starting position of dash y
  x2 = x2+1;
  y2 = y2-1;  //active element
  
  if ( x1>250){
    x1 = -10;
  }
    
    if ( x2>250){
    x2 = -10;
  }  
  if (y2<0){
    y2 = 250;
  }
 
     
  }

