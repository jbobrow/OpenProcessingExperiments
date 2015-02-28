
int angle = 0; 
int objectMode=1;
int currcol=214;
color backCol = color(200,200,255);


void setup() 
{ 
  size(300, 500, P2D); 
  colorMode(HSB, 360, 255, 255, 255);
  background(backCol); 
  smooth(); 
  noStroke(); 
  fill(0, 102); 
} 

void draw()
{ 

  // Draw only when mouse is pressed 
  if (mousePressed) { 
    angle += 10; 
    float val = cos(radians(angle)) * 20.5; 
    for (int a = 0; a < 360; a += 20) { 
     float xoff = random(0, 5)*cos(radians(a)) * val; 
     float yoff = random(0, 5)*sin(radians(a)) * val; 
     fill(currcol,random(255),random(255), random(100, 255)); 
	  drawShape(new PVector(mouseX+xoff,mouseY+yoff),objectMode,val);
    } 
    currcol+=random(-20,20);
  } 
  float ab=avgbright();
  if(ab<165) filter(DILATE);
  else if (ab>175) filter(ERODE);
}

void mouseReleased()
{
     if (mouseButton==RIGHT) background(backCol);
}

void keyReleased()
{
  switch(key)
  {
    case 'm':
     objectMode++;
     if (objectMode>3) objectMode-=3;
    break;
  }
}

void drawShape(PVector Pos, int mode, float param1)
  {
    switch (mode)
    {
    case 1:
	rect(Pos.x,Pos.y,param1,param1); 
	break;
    case 2:
	ellipse(Pos.x,Pos.y,param1,param1); 
	break;
    case 3:
	float start=random(0,TWO_PI);
	arc(Pos.x,Pos.y,param1,param1,start,random(start,TWO_PI)); 
	break;
    }
  }
  
float avgbright()
{
  float totalbright=0;
  loadPixels();
  for(int i=0; i<pixels.length; i++)
  {
    totalbright+=brightness(pixels[i]);
  }
  return totalbright/pixels.length;
} 



