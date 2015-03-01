
float x , y;
int r = 0;
int n = 100;
int k = 1;
 
 
void setup() {
  size(400,400);
  background(50);// background colour
   
}
 
void draw() {
 stroke(0);
  x = n + cos(r);//second circle
  y = n + sin(r);
 
 strokeWeight(random(5));// its give the line random colour
 stroke(random(255),190,205,50);// its give the line random colour
 
 translate(width/2, height/2);// direction in middle
 
  rotate(n+400); // helping circleing
 
 ellipse(90, 140, x, 10);// second crcleing line
  ellipse(50, 20, 5, 100);// 1st circleing line
 
  line( 0, 10, x, y);// line in the middle
 
  r = r +3; // give the direction of circleing
  n = n - k;// help line for circleing
 
  if ( n == 0 || n == 200) {
    k =  k + -1;
  
  }
}

