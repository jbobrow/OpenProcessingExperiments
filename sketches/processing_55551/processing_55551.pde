
/* Amirreza Chabouk
  YSDN Winter 2012
*/
float a=0;
float x1=0;
float y1=0;
float x3=0;
float y3=0;
float y2=100;
float wd=.8;
float speed=2;
void setup() {
  size (600,200);
  smooth();
  background(125);
  noStroke();
}

void draw (){
  fill(0,10);
  rect(0,0,width,height);
  fill(0,(120),(220));
  a +=speed;
  if (x1<width){ 
    x1=x1+2;
  }
  else {
    x1=0;}
    y1=y2+15*tan (a*wd);//angle and positioning of the curve
    ellipse(x1,y1,20,20);

      }
 

