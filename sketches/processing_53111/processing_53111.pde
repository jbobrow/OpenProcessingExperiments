

//Your not seeing a 3d shape no matter how hard you want to believe it.

/*
This is a repeating pattern that shows some very promising discrete 
math.in cyclic phenomina. It is based on a sculpture i did in 2010 
however in that scuplture the effect was much more pronounced 
and visable. I simply don't have time to optimise this so WYSIWYG.
It is probably way to heavy to run on the web. However one of the 
new things the emerged was a countdown to chaos. Let me know if you see it.
-langt
*/


float x, y,angle;

int numSquares = 100;
void setup()
{
  size(1000,1000);
  x = 0;
  y = 0;
  angle = 0;
  frameRate(120);
}
void draw(){
  background(0);
  drawShape();

}

/*
wevermount helped me condense this into a for loop and many 
variables. Formerly I had a file 4 or so times bigger.
*/

void drawShape()
{
  for(int i = 0; i < numSquares; i++){
    float angleNumerator = 14.75 + (i*0.30);// ∆'s the range of pendual speeds. 
    float amp = 100 + (i);//multipule of i ∆'s applitude.
    float x = 200 + (i*6);
    float y = 200 + (i*10);
    y = sin(angle/angleNumerator) * amp + height/2;

    rect(x,y,2,20);
  }
  angle++;
}


