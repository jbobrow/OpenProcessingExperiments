
//Rohan Rathod, rkrathod
//Hw_4, tuesday sep 11, 2012
//All materials and images on this code Copyright (c) Rohan Rathod, 2012. 



float theta = 5;
int x = 0;


//===============================================
void setup() {
  size(700, 200);
  background(0);
  smooth();
  strokeWeight(0);
  stroke(0,0,255);
}

//=====================================================================================
void draw() {
  
  
  
  if(keyPressed == true){
  stroke(random(x, 255), random(x, 255), random(x, 255));
  }
   
  
  

  
//#1
  pushMatrix();
  
  translate(100, 100);
  //rotate(radians());
  //float distance = abs(100*sin(sq(theta)));aa
  //float distance =  abs(100*(sin(theta))) + ;
  float distance = 100*sin(2*theta);

  line(0, 0, (distance * cos(theta)), (distance * sin(theta)));

  theta = theta + 1;

  popMatrix();
  
  //#2
   pushMatrix();
  
  translate(215, 100);
  //rotate(radians());
  //float distance = abs(100*sin(sq(theta)));aa
  //float distance =  abs(100*(sin(theta))) + ;
  float distance1 = 50*sin(2*theta)+80*cos(theta);

  line(0, 0, (distance1 * cos(theta)), (distance1 * sin(theta)));

  theta = theta + 1;

  popMatrix();
  
  //#3
   pushMatrix();
  
  translate(435, 100);
  
  float distance2 = 50*sin(2*theta)+40*cos(5*theta);

  line(0, 0, (distance2 * cos(theta)), (distance2 * sin(theta)));

  theta = theta + 1;

  popMatrix();
  
  ///#4
  
  pushMatrix();
  
  translate(600, 100);
  
  float distance3 = 50*sin(2*theta)+40*sin(theta);

  line(0, 0, (distance3 * cos(theta)), (distance3 * sin(theta)));

  theta = theta + 1;

  popMatrix();
  
}
