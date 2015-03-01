
float xPos = 0.0f;
int speed = 1;
boolean isPlaying = true;
boolean isFinished = false;
boolean isClickedBar = false;

void setup()
{
  size(800, 600);
  noStroke();
}

void draw()
{
  drawPlayer();
  drawVideo();
  
  if( isPlaying )
  { 
     if(xPos < width)
     { 
       xPos+=speed;
     }
     else
     {
       isPlaying = false;
       isFinished = true;
     }
  }
}

void mousePressed()
{
  if( IsInsidePlayZone() )
  {
    isPlaying = !isPlaying;
    
    if( isFinished )
    {
      xPos = 0f;
      speed = 1;
      isFinished = false;
    }
  }
  
  if( IsInsideBarZone() )
  {
    isClickedBar = true;
  }
}

void mouseDragged()
{
  if( isClickedBar )
  {
    xPos = mouseX;    
    xPos = max(0, xPos);
    xPos = min(xPos, width);    
    isPlaying = false;
  }
}

void mouseReleased()
{
  if( isClickedBar )
  {
    isPlaying = false;
  }
  isClickedBar = false; 
}

void keyPressed()
{
  if(key == 's' || key == 'S'){ saveFrame("frame-######.png"); }
  if(key == ' '){ isPlaying = !isPlaying; }
  if(key == '1'){ speed = 1; }
  if(key == '2'){ speed = 2; }
  if(key == '3'){ speed = 3; }
  if(key == '4'){ speed = 4; }
  if(key == '5'){ speed = 5; }
}

boolean IsInsidePlayZone()
{
  return (mouseX > 20 && mouseX < 45 && mouseY > height - 30);
}

boolean IsInsideBarZone()
{
  return (mouseY > height - 50 && mouseY < height - 20);
}

void drawPlayer()
{
  background(0);
  
  fill(#1b1b1b);
  rect(0, height-30, width, 30);
  
  fill(#444444);
  rect(0, height-40, width, 10);
  
  fill(#CC181E);
  rect(0, height-40, xPos, 10);
  
  fill(#eaeaea);
  ellipse(xPos, height-35, 20, 20);
  
  fill(#adadad);
  ellipse(xPos, height-35, 6, 6);
  
  fill(#757575);
  if( isPlaying )
  {   
     rect(25, height-24, 6, 17);
     rect(35, height-24, 6, 17);    
  }
  else
  {     
     triangle(25, height-7, 25, height-23, 40, height-15);
  }
}

void drawVideo()
{
  colorMode(HSB, 360, width, height);
  float segmentCount = map(xPos, 0, width, 0, 30);
  float angleStep = 360/segmentCount;
  float radius = 100;
  float centerX = width/2;
  float centerY = height/2-20;
  
  beginShape(TRIANGLE_FAN);
  vertex(centerX, centerY);
  for(float angle=0; angle<=360+1; angle+=angleStep)
  {  
    float vx = centerX + cos(radians(angle))*radius;
    float vy = centerY + sin(radians(angle))*radius;
    vertex(vx, vy);
    fill(angle, width, height);
  }
  endShape();  
}


