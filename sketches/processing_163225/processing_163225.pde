

//Elipse 1
float angle1 = 0.0;
float offset1 = 250;
float scalar1 = 30;
float speed1 = 0.02;

//Elipse 2
float angle2 = 0.0;
float offset2 = 250;
float scalar2 = 40;
float speed2 = 0.03;


//Elipse 3
float angle3 = 0.0;
float offset3 = 250;
float scalar3 = 60;
float speed3 = 0.04;

//Elipse 4
float angle4 = 0.0;
float offset4 = 250;
float scalar4 = 80;
float speed4 = 0.042;

//Elipse 5
float angle5 = 0.0;
float offset5 = 250;
float scalar5 = 100;
float speed5 = 0.05;

//Initialize noise=xoff 
float xoff = 0.0;


void setup() {
  size(500, 500);
  background(255);
  smooth();
}



void draw() {
//  saveFrame("output/frames#################.tif");
  xoff = xoff + .01;
  float n = noise(xoff) * 255*1.2;
 
  //Elipse 1
  float x1 = offset1 + cos(angle1) * scalar1;
  float y1 = offset1 + sin(angle1) * scalar1;
  fill(n);
  noStroke();
  ellipse(x1, y1, 10, 10);
  angle1 += speed1;
  
  //Elipse 2
  float x2 = offset2 + cos(angle2) * scalar2;
  float y2 = offset2 + sin(angle2) * scalar2;
  fill(255-n);
  noStroke();
  ellipse(x2, y2, 20, 20);
  angle2 += speed2;
  
  //Elipse 3
  float x3 = offset3 + cos(angle3) * scalar3;
  float y3 = offset3 + sin(angle3) * scalar3;
  fill(n);
  noStroke();
  ellipse(x3, y3, 40, 40);
  angle3 += speed3;
  
  //Elipse 4
  float x4 = offset4 + cos(angle4) * scalar4;
  float y4 = offset4 + sin(angle4) * scalar4;
  fill(255-n);
  noStroke();
  ellipse(x4, y4, 10, 10);
  angle4 += speed4;
  
  //Elipse 5
  float x5 = offset5 + cos(angle5) * scalar5;
  float y5 = offset5 + sin(angle5) * scalar5;
  fill(n);
  noStroke();
  ellipse(x5, y5, 20, 20);
  angle5 += speed5;
  
  //Elipse center
  fill(255-n);
  ellipse(250, 250, 50, 50);
  
  
  //different move spped with noise
  speed1 = 0.02+noise(xoff)*0.01;
  speed2 = 0.03+noise(xoff)*0.01;
  speed3 = 0.04+noise(xoff)*0.01;
  speed4 = 0.042+noise(xoff)*0.01;
  speed5 = 0.05+noise(xoff)*0.01;
  
  println(speed5);
  

}
