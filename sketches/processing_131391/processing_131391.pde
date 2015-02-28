
/* @pjs preload="trollface.png, LOL.png, meGusta.jpg, download.jpg"; */
color  brushColor;
PImage colorWheel;
PImage trollFace;
PImage lol;
PImage meGusta;
float myRotate = 0.0;
float myScale = 1.0;
float drip = 0;
float dripX = 0;
float dripY = 0;
float timer = 0.0;
 
void setup()

{
  size(500, 500);
  frameRate(30);
  trollFace = loadImage("trollface.png");
  lol = loadImage("LOL.png");
  meGusta = loadImage("meGusta.jpg");
  colorWheel = loadImage("download.jpg");
  background(255);
  
}

void draw()

{
  println(timer);
  myRotate = myRotate + 0.1;
  
  if (colorWheel.width > 0)
  
  {
    noTint();
    image(colorWheel, 0, 0, 100, 100);
  }
  
  if (keyPressed == true)
  
  {
    if (key == '1')
    
    {
      brushColor = get(mouseX, mouseY);
    }
    
    if (key == 'd')
    {
      background(255);
    }
  }
  
  noStroke();
  fill(255, 0, 0);
  
  //squares
  if (mousePressed == true)
  
  {
    if (mouseButton == LEFT)
    
    {
      pushMatrix();
      
      translate(mouseX + random(50), mouseY + random(50));
      rotate(myRotate);
      scale(myScale);
      fill(random(255), random(255), random(255)); 
      rect(0, 0, 50, 50);
      
      if (keyPressed)
      
      {
        if (keyCode == UP)
        
        {
          myScale = myScale + .1;
        }
        
        else if (keyCode == DOWN)
        
        {
          myScale = myScale - .1;
        }
      }
      
      popMatrix();
      
    }
  }
  
  noStroke();
  fill(255, 0, 0);
  
  //circle
  if (mousePressed == true)
  
  {
    if (mouseButton == RIGHT)
    
    {
      pushMatrix();
      
      translate(mouseX, mouseY);
      scale(1);
      fill(brushColor); 
      ellipse(0, 0, 50, 50);
      stroke(0);
      
      dripX = mouseX;
      dripY = mouseY;
      
      popMatrix();
      
    }
  }
  
  stroke(0);
  fill(brushColor);
  float nextY = dripY + 10;
  ellipse(dripX, dripY, 50, 50);
  dripY = nextY;
  
  noStroke();
  fill(255, 0, 0);
  
  //images
  if (mousePressed == true)
  
  {
    if (mouseButton == CENTER)
    
    {
      pushMatrix();
      
      timer = timer + (1.0 / 30.0);
      translate(mouseX, mouseY);
      scale(1);
      
      if (timer >= 0 && timer <= 3)
      
      {
        tint(random(255), random(255), random(255));
        image(trollFace, 0, 0, 50, 50);
      }
      
      else if (timer >= 3 && timer <= 6)
      
      {
        image(lol, 0, 0, 100, 100);
      }
      
      else if (timer>= 6 && timer <= 9)
      
      {
        tint(random(255), random(255), random(255), random(255));
        image(meGusta, 0, 0, 50, 50);
      }
      
      else if (timer >= 9)
      
      {
        timer = 0;
      }
      
      popMatrix();
      
    }
  }
}

 



