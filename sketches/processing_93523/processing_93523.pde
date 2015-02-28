
float bg, ibg, rate, wTime, lTime, t, tScale, timeUnit;
PVector offset, center, sVel, pVel, pPos, NsPos, sAcc;
PVector sPos[];

void setup()
{
  size(600,600);
  v = new color[0];
  sPos = new PVector[500];
  NsPos = new PVector();
  sVel = new PVector(0, 0);
  sAcc = new PVector(0, 0);
  center = new PVector(width/2, height/2);
  pPos = center;
  pVel = new PVector(0,0);
  offset = new PVector(0,0);
  
  for(int i = 0; i<sPos.length; i++)
  {
    sPos[i] = new PVector(center.x + random(-width, width), center.y + random(-height, height));
  }
  
  
  //time_Speed = 1.0;
  bg = 200;
  ibg = 200;
  bgIncr = 1;
  wTime = 1;
  tScale = .001;
  background(bg);
  
  smooth();
}



void draw()
{
  timeUnit = cos(frameCount * tScale)*wTime;

  //changes the background color
  bg = map(timeUnit, -1, 1, 20, 230);
  
//  //controls alpha on star overlay rect for fading in the light
//  ibg = map(timeUnit, -1, 1, 0, 200);
  
  //controls alpha on star overlay rect for fading in the light
  ibg = map(timeUnit, -1, 1, 200, 10);

  background(bg,0);
  
  sVel.add(sAcc);
  
  
  //cycle through position array
  for(int i = 1; i<sPos.length; i++)
  {
    strokeWeight(5);
    //update point alpha
    stroke(5, ibg);
//    NsPos = PVector.add(sPos[i], offset);
//    point(sPos[i].x+offset.x, sPos[i].y+offset.y);
    //draw point at each position on array
    point(sPos[i].x, sPos[i].y);
    noStroke();
    sPos[i] = PVector.add(sPos[i], sVel);
    
    //randomize position of star reset offsreen to prevent banding
    if(sPos[i].x > width+width/2)
    {
      sPos[i].x = random(-1,-width/2);
      sPos[i].y = center.y + random(-height, height);
    }
    
    if(sPos[i].x < -width/2)
    {
      sPos[i].x = random(width,width+width/2);
      sPos[i].y = center.y + random(-height, height);
    }
    
    if(sPos[i].y > height+height/2)
    {
      sPos[i].y = random(0,-height/2);
      sPos[i].x = center.x + random(-width, width);
    }
    
    if(sPos[i].y < -height/2)
    {
      sPos[i].y = random(height, height+height/2);
      sPos[i].x = center.x + random(-width, width);
    }
    
    
  }
  
//  fill(bg, ibg);
//  noStroke();
//  rect(0,0,width, height);
  
  //draw 'player' character in center
  fill(255);
  strokeWeight(3);
  stroke(0);
  ellipse(pPos.x, pPos.y, 30,30);
  
  
  //Instructions
//  fill(0,150);
//  text(" \"W,A,S,D\" to sail among the stars", 5, 20);

  print (sVel);
}

void keyPressed()
{
  if(key == 'd')
  {
//    offset.x-=1;
    sAcc.x = -.1;
  }
  
  else if(key == 'a')
  {
//    offset.x+=1;
    sAcc.x = .1;
  }
  
  if(key == 'w')
  {
//    offset.y+=1;
    sAcc.y = .1;
  } 
  
  else if(key == 's')
  {
//    offset.y-=1;
    sAcc.y = -.1;
  }
}


void keyReleased()
{
  sAcc = new PVector();
}



