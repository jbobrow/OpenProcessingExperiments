
PImage grass;

void setup()
{
  size(640,480);
  noStroke();
  smooth();
  grass = loadImage("grassproject.gif");
}

void draw()
{
  
 
 
  background(10,mouseX/4,mouseX);
  fill(200,60,70);
pushMatrix();


  if(mouseX> 100)
  {
 
 float j = map(mouseX, 0,0,0, 50);
   image(grass, 0,430,640,-mouseX/4); 
   
  }
  popMatrix();
  
  
  fill(180,113,35);
  rect(0,430, 640,80);
  
  fill(20);
  ellipse(30,460,2,2);
  ellipse(40,470,2,2);
  ellipse(65,465,2,2);
  ellipse(79,461,2,2);
  ellipse(130,473,2,2);
  ellipse(160,468,2,2);
  ellipse(290,461,2,2);
  ellipse(330,478,2,2);
  ellipse(590,461,2,2);
  ellipse(439,473,2,2);
  ellipse(347,468,2,2);
  ellipse(500,461,2,2);
  ellipse(320,478,2,2);
  
  
  pushMatrix();
  translate(0,-mouseX/2);
  fill(mouseX,mouseX/2,20);
  ellipse(50,400, 40,40);
  popMatrix();

//
//  float c = map(mouseX, 0, width, 0, width/2);
//  pushMatrix();
//  fill(10,200,10);
//  translate(500, 400);
//  float b = atan2(c, (mouseX-500));
//  rotate(b);
//  ellipse(-5, 0, 40, 8);
//  popMatrix();
//  println(b);
//
//  float d = map(mouseX, width,width/2, 0, width/2);
//  pushMatrix();
//  fill(10,200,10);
//  translate(500, 400);
//  float e = atan2(d, -(mouseX-500));
//  rotate(e);
//  ellipse(-5, 0, 40, 8);
//  popMatrix();
//
//  float z = map(mouseX, 0,width, 0, 40);
//  ellipse(500,400,8,z);
//
//
//  fill(200,30,10);
//  ellipse(500,400,8,8);
fill(255);

if(mouseX < 40)
{
  
  ellipse(10,30, 3,3);
  ellipse(23,34, 3,3);
  ellipse(34,100, 3,3);
  ellipse(200,139, 3,3);
  ellipse(90,60, 3,3);
  ellipse(68,150, 3,3);
  ellipse(490,50, 3,3);
  ellipse(370,60, 3,3);
  ellipse(380,110, 3,3);
  ellipse(528,75, 3,3);
  ellipse(590,55, 3,3);
  ellipse(610,60, 3,3);
  
}
 
 if(mouseX < 65)
 {
   ellipse(200,200, 3,3);
  ellipse(570,160, 3,3);
  ellipse(50,90, 3,3);
  ellipse(140,80, 3,3);
  ellipse(210,130, 3,3);
  ellipse(480,230, 3,3);
 }
 
 if(mouseX< 95)
 {
   ellipse(580,100, 3,3);
  ellipse(410,70, 3,3);
  ellipse(365,200, 3,3);
  ellipse(230,30, 3,3);
  ellipse(109,99, 3,3);
  ellipse(10,30, 3,3);
 }
 
 

}


