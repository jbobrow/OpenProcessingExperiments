
float r = 25.0;    //radius of circles
float x;           //x-coordinate cartesian cs
float y;           //x-coordinate cartesian cs
float i = 0;
float ang = 0;
float x_center = 250;
float y_center = 250;

void setup(){
  size(500,500);  
  frameRate(30);
  smooth();
  background(0);
}

void draw(){
  x = (2*r*(cos(i)-0.5*cos(2*i)));
  y = (2*r*(sin(i)-0.5*sin(2*i)));
  fill(random(150*i/ang,160),random(255),random(150, 160),random(15,160));
  noStroke();
//  ellipse(x_center+x, y_center-y, random(2)*sin(i)*r/3, random(2)*cos(i)*r/3);
  float rand_ellipse = random(2,3);
  ellipse(x_center+x, y_center-y, rand_ellipse*sin(i)*r/3, rand_ellipse*cos(i)*r/3);
  i += (TWO_PI)/100;
  ang += (TWO_PI)/12 ;
  
  if(i%TWO_PI < TWO_PI/100){
    x_center = 250;
    y_center = 250;
    x_center += 3.5*r/3*random(-5,5);
    y_center += 3.5*r*random(-5,5);
    if(x_center > width){
      x_center = 0*random(-5,5);
      y_center += 3.5*r*random(-5,5);
    }
  }
}






