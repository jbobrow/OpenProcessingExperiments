
float SA = 0;
float timer = 0;
float DS = 0.0;
float DR = 0;

void setup()
{
  size(500,500);
  background(0);
}

void draw(){
  
  fill(255,random(255),0);
  
  timer ++;
  
  if (timer >= 300)
  {
  rotate(PI);
  scale(DS);
  rect(0,0,50,50);
  DS += 0.05;
  if (DS >= 3){
    DS = -DS;
  }
  
  
  
  }
  
  

  ellipse(100,100,60,60);
  
  SA += 0.1;
 pushMatrix();

 smooth();
 rotate(SA);
 rect(250, 250, 25, 25);
 
 popMatrix();
 
pushMatrix();

 translate(50,50);
 rotate(SA);
 rect(-25,-25,25,25);
 
 

 
 popMatrix();
 
 
 
 
 
 
}


