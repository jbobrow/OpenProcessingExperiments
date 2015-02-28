
 int l = 0 ;
void setup(){
  size(250, 250);
  smooth();
  frameRate(15);
}

void draw(){
  background(255);
  noFill();
  stroke(0);
  int m = 125;
  int n = 125;
  float y = PI;
  ellipseMode(CENTER);
  translate(random(-10, 10), 0);
  ellipse(m, n, 125, 125);
  ellipse(m-15, n-10, 10, 10);
  ellipse(m+15, n-10, 10, 10);
  //line(m-12+20,n+26, m-5, n+20 );
  stroke(255);
  strokeWeight(2);
  
  m++;
  n--;

}

void mouseMoved(){

 translate(l, 0);
 l++;
 if (l >= 23){
 translate(-l, 0);
 l++;
 if(l <= -23){
 translate(l, 0);
 }
 }
 
 }
