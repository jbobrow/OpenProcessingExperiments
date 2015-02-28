
float x=0;
float y=0;
int m=3;
float a=0;
int q =3;
 
void setup() {
  size(600,600);
 frameRate(600);
  noStroke();
}
 
void draw() {
  y=random(600);
  a+=0.25;
  fill(0, 10);
 rect(0, 0, width, height);
 
  fill(random(256),240,random(256));
  ellipse(x, y, 20, 20);
 
  if(x>width){
    m=m*(-1);
  }
   
  if(x<0){
    m=m*(-1);
  }
   
  x+=m;

}


