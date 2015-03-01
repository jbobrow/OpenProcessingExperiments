


float w, x, y, z;
float angle = 0;
float angle2 = 350;
float r= 300;
float d = 1 ;


void setup() {
  size(600, 600);
  background(255);
  smooth();
  
}



void draw() {

  w= r*cos (angle2);
  x= r*sin (angle2);
  y= r*cos (angle);
  z= r*sin (angle);


  translate(width/2, height/2);

  strokeWeight(1.5);
  stroke(x+150, 105, 120, 80);
  noFill();


  triangle(0, 0, z, y, y, x);






  rotate(angle);  



  noStroke();
  fill(y, 255, z, 20);
  translate(width/8, height/8);
  rect(0, 0, w, x);



  

  angle += 10;
  angle2 -= 30;
  r = r - d;


  if ( r == 0 || r == 300) { 
    d =  d* -1;
  }



}




