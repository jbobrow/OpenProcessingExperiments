

float i=0;

void setup() {
  size(800,800);
  background(0);


  smooth();
  translate(width/2,height/2);
  strokeWeight(2);
  beginShape();
  fill(0);
  for(int i=0;i<100;i++)
  {
    curveVertex(    exp(0.1*i)*sin(i),   exp(0.1*i)*cos(i)        );
  }
  endShape();
  
  

  beginShape();
//  for(int i=0;i<100;i++)
//  {
//    curveVertex(    exp(-0.2*i)*sin(i),   exp(-0.2*i)*cos(i)        );
//  }
//  
//  for(int i=0;i<100;i++)
//  {
//    curveVertex(    exp(-0.1*i)*sin(i),   exp(-0.1*i)*cos(i)        );
//  }
//  endShape();
}








void draw() {
  translate(width/2,height/2);
  fill(random (0),random (255),0,20);
  noStroke();
  ellipse(exp(0.1*i)*sin(i),   exp(0.1*i)*cos(i),20,20);
  i+=0.1;
  
  
  
  
  //translate(width/2,height/2);
  fill(random (0),random (255),0,20);
  noStroke();
  ellipse(100+exp(0.2*i)*sin(i),  100+ exp(0.2*i)*cos(i),20,20);
 // i+=0.1;
}


