
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher sc = new SoundCipher(this);
float[] pitches = {60, 62, 63, 66, 67, 68, 71, 72};

SoundCipher sk = new SoundCipher(this);
void keyPressed()
{
  sk.playNote(key - 40, 100, 0.5);
}

ArrayList moths;
float centerX = 250;
float centerY = 250;
float onoff = 1;
int rand = int(random(6,10));
int cTime;
int fTime;
int drum = int(random(35,59));
float pan = 64;

void setup() 
{
  size(500,500);
  smooth();
  background(0);
  moths = new ArrayList();
}

void draw() 
{
  sc.instrument(drum);
  noStroke();
  if(onoff == 1)
  {
    fill(134,232,255,80);
  }
  else
  {
    fill(0,80);
  }
  rect(0,0,width,height);
  
  lamp();
  
  for(int i = moths.size()-1; i >= 0; i--) 
  { 
    Moth moth = (Moth) moths.get(i);
    moth.update();
    moth.checkEdges();
    moth.display();
    
    if (moth.finished()) 
    {
      moths.remove(i);
    }
  }
  
  if(second() == fTime || moths.size() == 0)
  {
    onoff = 1;
    drum = int(random(35,59));
    if(moths.size() < 7)
    {
      rand = int(random(6,10));
    }
    else
    {
      rand = int(random(moths.size(),10));
    }
  }
}

void mousePressed() 
{ 
  if(mouseButton == LEFT && onoff == 1)
  {
    if(moths.size() < 10)
    {
      sk.playNote(pitches[int(random(pitches.length))], 100, 0.5);
      moths.add(new Moth(mouseX, mouseY));
      drum = int(random(35,59));
    }
    if(moths.size() == rand)
    {  
      onoff = 0;
      cTime = second();
      fTime = cTime + int(random(5,10));
    }
  }
}

void lamp()
{
  stroke(0);
  if(onoff == 1)
  {
    fill(255);
  }
  else if(onoff == 0)
  {  
    fill(249,250,81);
  }
  ellipse(centerX,centerY,50,50);
}

void mouseDragged() 
{
  if(mouseButton == LEFT && onoff == 0 && mouseX <= centerX + 60 && mouseX >= centerX - 60 && mouseY <= centerY + 60 && mouseY >= centerY - 60)
  {
    centerX = mouseX;
    centerY = mouseY;
  }
}

class Moth 
{

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float pointX;
  float pointY;
  float sp = random(1,5);
  
  Moth(float xPos, float yPos) 
  {
    location = new PVector(xPos,yPos);
    velocity = new PVector(0,0);
    topspeed = 4; 
  }
  
  void update() 
  {   
    if(onoff == 1)
    {
      pointX = mouseX;
      pointY = mouseY;
      topspeed = sp;
    }
    else
    {
      pointX = centerX;
      pointY = centerY;
      topspeed = 6;
    }
    PVector light = new PVector(pointX,pointY);
    PVector dir = PVector.sub(light,location);
    dir.normalize();
    dir.mult(0.1);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() 
  {
    stroke(0);
    if(onoff == 1)
    {
      fill(255);
    }
    else if(onoff == 0)
    {  
      fill(249,250,81);
    }
    ellipse(location.x,location.y,10,10);
  }

  void checkEdges() 
  {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
  
  boolean finished() 
  {
    if (location.x >= centerX-30 && location.x <= centerX+30 && location.y >= centerY-30 && location.y <= centerY+30 && onoff == 0) 
    {
      spark();
      return true;
    } 
    else 
    {
      return false;
    }
  }
  
  void spark()
  {
    noStroke();
    fill(255,0,0);
    ellipse(location.x,location.y,50,50);
    pan = centerX / 500 * 128;
    sc.playNote(1/4, 9, 49, 49, random(40) + 70, 0.5, 3.0, pan);
  }
}

void stop() {
  sc.stop();
}

