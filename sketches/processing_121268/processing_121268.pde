
float counter = 0;

void setup()
{
  size(400,400);
}

void draw()
{
  background(0);
  
  pushMatrix();
  fill(#9a1b24);
  triangle(90,200,190,200,10,100);
  triangle(210,200,310,200,390,100);
  popMatrix();
  
  translate(width/2,height/2);
  
  pushMatrix();
  fill(#b38e09);
  translate(-70,sin(counter)*10);
  rect(0,40,140,60);
  popMatrix();
  
  pushMatrix();
  fill(0);
  line(-10,0,-10,200);
  line(-20,0,-20,200);
  line(-30,0,-30,200);
  line(-40,0,-40,200);
  line(-50,0,-50,200);
  line(-60,0,-60,200);
  line(-70,0,-70,200);
  line(-80,0,-80,200);
  line(0,0,0,200);
  line(10,0,10,200);
  line(20,0,20,200);
  line(30,0,30,200);
  line(40,0,40,200);
  line(50,0,50,200);
  line(60,0,60,200);
  line(70,0,70,200);
  line(80,0,80,200);
  line(90,0,80,200);
  popMatrix();
 
  pushMatrix();
  translate(-70,sin(counter)*10);
  rect(0,70,200,1);
  popMatrix();
  
  counter +=0.02;
}


