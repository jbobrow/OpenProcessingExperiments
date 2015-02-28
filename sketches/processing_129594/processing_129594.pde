
float timer = 0.0;
float myScale = 0.1;
float myScaleSpeed = 0.05;
float rad = 0.0;

void setup()
{
  size(500,500);
  frameRate(30);
}
void draw()
{
  
  background(0);
  rad = rad +0.1;
  timer = timer + (1.0/30.0);
  myScale = myScale + myScaleSpeed;
 
  if(timer >= 2.0 && timer <4.0)
  {
    pushMatrix();
    translate(200,200);
    scale(myScale);
    rectMode(CENTER);
    fill(random(255), random(255), random(255));
    rect(0,0,100,100);
    
    popMatrix();
  }
  else if(timer >= 4.0 && timer < 8.0)
  {
    
    fill(random(255), random(255), random(255));
    translate(width/2, height/2);
    rotate(rad);
    rectMode(CENTER);
    rect(0,0,250,250);
    
  }
  
  
  //I HAVE NO IDEA HOW TO GET THE SINE CURVE TO WORK SO I GAVE UP
  
  
  
  else if(timer > 8.0 && timer < 10.0)
  {
    fill(random(255), random(255), random(255));
    triangle(50,100,150,50,100,50);
  }
  else
  {
    background(0);
  }
  
}


