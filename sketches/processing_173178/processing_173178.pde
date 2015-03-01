
float cheek = 0;
float eyes = 0;
void setup()
{
  smooth();
  size(600,400);
  colorMode(HSB,360,100,100);

  ellipseMode(CENTER);
  
}

void draw()
{
  float amplitude = map(sin(cheek),-1,1,0,100);
  float amplitude2 = map(sin(eyes),-1,1,0,-20);
  
  if (mouseX>=250)
  {

  background(327,90,82);
  translate(150,200);
  noStroke();
 
  pushMatrix();
  fill(0);
  ellipse(-20,-100,50,50);
  ellipse(20,-100,50,50);
  ellipse(0,0,200,200);
  fill(327,0,100);
  ellipse(amplitude2,-30,10,10);
  ellipse(amplitude2+40,-30,10,10);
  ellipse(0,10,20,20);
  fill(0);
  ellipse(0,5,20,20);
  
  popMatrix();
  
  translate(300,0);
  fill(0);
  pushMatrix();
  ellipse(0,0,200,200);
  fill(327,0,100);
  ellipse(-amplitude2-40,-30,10,10);
  ellipse(-amplitude2,-30,10,10);
  ellipse(0,10,20,20);
  fill(0);
  ellipse(0,5,20,20);
  popMatrix();
  
  eyes+=0.01;
  }
  else
  {
    background(193,29,91);
     translate(150,200);
  noStroke();
 
  pushMatrix();
  fill(0);
  ellipse(-20,-100,50,50);
  ellipse(20,-100,50,50);
  ellipse(0,0,200,200);
  fill(193,0,99);
  ellipse(amplitude2,-30,10,10);
  ellipse(amplitude2+40,-30,10,10);
  ellipse(0,10,20,20);
  fill(0);
  ellipse(0,5,20,20);
  fill(313,66,amplitude);
  ellipse(-50,0,30,10);
  ellipse(50,0,30,10);
  popMatrix();
  
  translate(300,0);
  fill(0);
  pushMatrix();
  ellipse(0,0,200,200);
  fill(193,0,99);
  ellipse(-amplitude2-40,-30,10,10);
  ellipse(-amplitude2,-30,10,10);
  ellipse(0,10,20,20);
  fill(0);
  ellipse(0,5,20,20);
  fill(313,66,amplitude);
  ellipse(-50,0,30,10);
  ellipse(50,0,30,10);
  popMatrix();
  
  cheek+=0.01;
  eyes+=0.01;
  }
  
if(mouseX>=250 && mousePressed == true)
  { 
    fill(0);
      ellipse(-150,50,80,80);
      fill(327,0,100);
      ellipse(-160,40,10,10);
      ellipse(-140,40,10,10);
      ellipse(-150,60,10,10);
      fill(0);
      ellipse(-150,55,10,10);
      
  }
  
  
  

}
