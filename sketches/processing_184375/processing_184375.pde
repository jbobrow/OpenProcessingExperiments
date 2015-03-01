
/*----------------------------------------
Crazy Lines
by Catherine Lee
Created 4 February 2015
------------------------------------------*/


void setup() {
  size(500,500);
  background(0,200,150);                            //greenish color BG
  frameRate(10);
  
  
}
//bouncing in areas, circles and lines
void draw (){
 
  fill(0,200,150,10);                            //overlay layer with opacity, same greenish color
  rect(0,0,width,height);                        //box same size as canvas
  
  int x = 60;
  float a = random(x,height/2-x/2);
  float a1 = random (x,height/2-x/2);
  float a2 = random(x,height/2-x/2);
  float a3 = random (x,height/2-x/2);
  
  float b = random(height/2-x,x);
  float b1 = random(x,x);
  float c = random(height/2+x/2,height-x);
  float c1 = random(height/2+x/2,height-x);
  float c2 = random(height/2+x/2,height-x);
  float c3 = random(height/2+x/2,height-x);
  
  //random colors
  float aa = random(255);
  float bb = random(255);
  float cc = random(255);
  
  strokeWeight(4);                                 //thickness of the line
  stroke(aa,bb,cc);                                //stroke color
  
  //top line groupings
  line(x,a,width/2-x/2,a1);
 
  line(width/2+x/2,a2,width-x,a3);

  
  
 //bottom right
 line(width/2+x/2,c,width-x,c1);
 
 //bottom left
 line(x,c2, width/2-x/2,c3);

}
