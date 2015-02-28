

int a=100;
int b=100;
int side1=400;
int side2=800;


void setup(){
  size(400,800);

  strokeWeight(3);
  background(255);
  smooth();
  noFill();
}

void draw(){
  
  
fill(186,79,245,80);
  strokeWeight(3);
  ellipse(0,0,6*a,6*b);
  ellipse(0,0,5*a,5*b);
  strokeWeight(2);
  ellipse(0,0,4*a,4*b);
  ellipse(0,0,3*a,3*b);
  strokeWeight(1);
  ellipse(0,0,2*a,2*b);
  ellipse(0,0,1*a,1*b);
  
 fill(46,64,242,80);

  strokeWeight(3);
  ellipse(side1,side2,6*a,6*b);
  ellipse(side1,side2,5*a,5*b);
  strokeWeight(2);
  ellipse(side1,side2,4*a,4*b);
  ellipse(side1,side2,3*a,3*b);
  strokeWeight(1);
  ellipse(side1,side2,2*a,2*b);
  ellipse(side1,side2,1*a,1*b);
  
 fill(65,237,71,80);
  
  
  strokeWeight(3);
  ellipse(side1,0,4*a,4*b);
  ellipse(side1,0,3*a,3*b);
  strokeWeight(2);
  ellipse(side1,0,2*a,2*a);
  ellipse(side1,0,1*a,1*a);
  
  fill(236,250,91,80);

  
  strokeWeight(3);
  ellipse(0,side2,4*a,4*b);
  ellipse(0,side2,3*a,3*b);
  strokeWeight(2);
  ellipse(0,side2,2*a,2*b);
  ellipse(0,side2,1*a,1*b);
  

  


}

