
int numberOfParticles = 100;
float gravity = 0.1; //Increase in speed measured in pixels per second per second
float particleDiameter = 60; //Diameter of particles in pixels

spark[] s = new spark[numberOfParticles];
PFont f = createFont("calibri", 16, true);

void setup()
{
  size(800,600);
  //Initialise sparks
  for(int i = 0; i < s.length; i++)
  {
    s[i] = new spark(width/2,-50,random(-5,5),random(-2.5,2.5),particleDiameter);
  }
  noCursor();
}

void draw()
{
  background(255);
  
  
  //stroke(0);
  //line(0,height/2,width,height/2);
  noStroke();
  fill(230);
  if(mouseY>height/2)
  {
    rect(0,(height/2)+1,width,height/2);
  }
  else
  {
    rect(0,0,width,height/2);
  }
  
  fill(150);
  textFont(f,24);
  text("Left click - coloured particles.",10,height-70);
  text("Right click - black and white particles.",10,height-40);
  text("Move the mouse to the bottom half of the window to reverse gravity.",10,height-10);
  
  for(int i = 0; i < s.length; i++)
  {
    //s[i].move();
    s[i].moveWithMouse();
    noStroke();
    s[i].drawSpark();
  }
  
    if(mousePressed && (mouseButton == RIGHT))
    {     
      for(int i = 0; i < 10; i++)
      {
        fill(50,50,50,100-(i*10));
        ellipse(mouseX,mouseY,(particleDiameter+5)+i,(particleDiameter+5)+i);
      } 
      noStroke();
      fill(200);
      ellipse(mouseX,mouseY,particleDiameter+5,particleDiameter+5);

    }
    else if(mousePressed && (mouseButton == LEFT))
    {
      noStroke();
      for(int i = 0; i < 10; i++)
      {
        fill(50,50,50,100-(i*10));
        ellipse(mouseX,mouseY,(particleDiameter+5)+i,(particleDiameter+5)+i);
      }
      fill(0);
      ellipse(mouseX,mouseY,particleDiameter+5,particleDiameter+5);
    }
    else
    {
      noStroke();
      for(int i = 0; i < 10; i++)
      {
        fill(50,50,50,100-(i*10));
        ellipse(mouseX,mouseY,(particleDiameter+5)+i,(particleDiameter+5)+i);
      }
      fill(150);
      ellipse(mouseX,mouseY,particleDiameter+5,particleDiameter+5);

      //stroke(0);
      //line(mouseX-((particleDiameter/2)+2),mouseY,mouseX+((particleDiameter/2)-2),mouseY);
    }
  
}

class spark
{
  float x, y;
  float xSpeed, ySpeed;
  float restartX, restartY, restartXSpeed, restartYSpeed;
  color randomColour = color(random(255),random(255),random(255));
  float diameter;
  boolean colours;
  float particleGravity;
  //float g = 0.1;
  
  spark(float startX, float startY, float xSpeeds, float ySpeeds, float sparkDiameter)
  {
    x = startX;
    y = startY;
    restartY = startY;
    restartX = startX;
    xSpeed = xSpeeds;
    ySpeed = ySpeeds;
    restartXSpeed = xSpeeds;
    restartYSpeed = ySpeeds;
    diameter = sparkDiameter;
  }
  
  void moveFountain()
  {
    y += ySpeed;
    x += xSpeed;
    ySpeed += gravity;
    
    if (y > height || x > width || x < 0)
    {
      y = restartY;
      x = restartX;
      xSpeed = restartXSpeed;
      ySpeed = restartYSpeed;
    }
  }
  
  void drawSpark()
  {
    if (colours == false)
    {
      if (particleGravity >= 0)
      {
      noStroke();
      fill(0,0,0,255-map(y,0,height,0,255));
      ellipse(x,y,diameter,diameter);
      }
      else
      {
        noStroke();
        fill(0,0,0,map(y,0,height,0,255));
        ellipse(x,y,diameter,diameter);
      }
    }
    else
    {
      if (particleGravity >= 0)
      {
      noStroke();
      fill(red(randomColour),green(randomColour),blue(randomColour),255-map(y,0,height,0,255));
      ellipse(x,y,diameter,diameter);
      }
      else
      {
        noStroke();
        fill(red(randomColour),green(randomColour),blue(randomColour),map(y,0,height,0,255));
        ellipse(x,y,diameter,diameter);
      }
    }
  }
  
  void moveWithMouse()
  {
    y += ySpeed;
    x += xSpeed;
    ySpeed += particleGravity;
    
    if(mouseY > height/2)
    {
      particleGravity = -gravity;
    }
    else
    {
      particleGravity = gravity;
    }
    
    if(mousePressed && (mouseButton == RIGHT))
    {
      if (y > height+diameter || x > width+diameter || x < 0-diameter || y < 0 - diameter)
      {
        colours = false;
        y = mouseY;
        x = mouseX;
        xSpeed = restartXSpeed;
        ySpeed = restartYSpeed;
      }
      
    }
    if(mousePressed && (mouseButton == LEFT))
    {
      if (y > height+diameter || x > width+diameter || x < 0-diameter || y < 0 - diameter)
      {
        colours = true;
        y = mouseY;
        x = mouseX;
        xSpeed = restartXSpeed;
        ySpeed = restartYSpeed;
      }
    }
  }
}


