
float delta = 25;
float r;

void setup()
{
  size(800, 800, P3D);
}

int ballVec = 0; // x-coordinate of the Ball
float size = 60; // size of the Ball

void draw()
{
  background(0);
  translate(width/2, height/2, 0);
  rotateX(radians(mouseX+mouseY)/10);
  
  if(ballVec < width/2)
  {
    fill(255);
    noStroke();
  
    if(ballVec < width/2-90) normPass();
    
    else randPass();
  }
 
  else
  {
    fill(random(ballVec), random(ballVec+10), random(ballVec-10)); 
    // the color of the ball changes as it moves through the cylinder
    noStroke();
  
    if(ballVec < width/2+120) randPass();
  
    else normPass(); 
  }
 
  for(r = 10; r < 400; r += 30) // cylinder formation
  {
    for (float x = -120; x <= 120; x += 15) 
    {
      for(float deg = 0; deg < 360; deg += delta)
      {
        float theta = radians(deg);
        float y = r * cos(theta);
        float z = r * sin(theta);
        
        point (x , y, z);
        stroke(random(r+mouseX), random(r+mouseY), random(r+mouseX+mouseY));
        strokeWeight(6);
      }
    }
  }
  
   ballVec++;
   
   if(mousePressed == true) size = random(10, 120);
   // ball size is transformed randomly when mousepressed
}

void normPass() // moves in a straight line
{
  for(int j = 0; j <= 360; j += delta)
  {
    rotateX(j); 
    ellipse(ballVec-400, 0, size, size);
  } 
}

void randPass() // shakes in a verticle way 
{
  for(int j = 0; j <= 360; j += delta)
  {
    rotateX(j); 
    ellipse(ballVec-400, random(-200, 200), size, size);
  }
}
