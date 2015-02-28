

void setup()
{
  size(400, 400);
  println("setup");
  color bgColor = getRedColor((int)round(random(9,50)));
  
  background(bgColor);
  smooth();
  makeHair();
}


void makeHair()
{
  color bgColor = getRedColor((int)round(random(1,50)));
  background(bgColor);
  
  float lastx = 0;
  float lasty = height/2;
  float lastNoise = random(10)-5;
  float xNoise = random(10)-5;
  float origAngle = random(360);
  float step = .5;
  
  noFill();
  for(float i=0f; i<width; i+=step)
  {
    lasty = 0;
    
    float angle = origAngle + ((noise(lastNoise))*100);//angle+noise(xNoise);
    lastx = -999;
    
    for(int j=0; j<height; j++)
    {
      float n = noise(lastNoise);
      int r = round(map(n, 0, 1, 1, 200));
      color c = color(r, round(r*.5), map(r, 0, 255, 0, 3));
      stroke(c, (map(n, 0, 1, 1, 100)));
      float newx = i + (cos(radians(angle)) * 10 * (n*3));
    
      if(lastx > -999)
      {
        float newy = lasty+1;
        line(lastx, lasty, newx, newy);
        lasty = newy;
        lastNoise += .0;
        angle += 1.2*n;
      } 
      lastx = newx;
    }
    
    origAngle+= (random(.01, 3) * noise(lastNoise));
    lastNoise = random(10)-5;
    xNoise++;
    
  }
}


color getRedColor(int factor)
{
  return color(factor, round(factor*.5), map(factor, 0, 255, 0, 3));
}

void draw()
{
   
}

void keyPressed()
{
  if(key=='s'){
    saveFrame((System.currentTimeMillis()/1000)+".jpg");
  } 
}

void mousePressed()
{
  
  makeHair(); 
}



