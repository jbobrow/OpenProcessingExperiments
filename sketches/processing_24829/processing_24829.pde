


void setup()
{
  size(300,600);
  background(0);
  noLoop();
  smooth();

}

void draw()
{
  
  
  for(int c = 0; c < 10; c = c + 1)
  {
    float t = random(0,100);
    float i = random(0.5,3);
    noFill();
    stroke(120,t);
    strokeWeight(i);
    float x = random(0,300);
    float j = random(0,180);
    float z = random(15,60);
    ellipse(x,j,z,z);
  } 
    for(int c = 0; c < 30; c = c + 1)
  {
    float t = random(0,100);
    float i = random(0.5,3);
    noFill();
    stroke(120,t);
    strokeWeight(i);
    float x = random(0,300);
    float y = random(0,400);
    float z = random(15,60);
    ellipse(x,y,z,z);
  } 
  
  
  for(float b = 20; b < 600; b = b + 20)
  {
    float s = random(0,100);
    float e = random(200,300);
    float w = random(0,80);
    
    stroke(255,w);
    strokeWeight(2);
    line(s,b,e,b);
  }
  
  for(float b = 360; b < 600; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(255,76,214,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
   for(float b = 350; b < 600; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(252,237,48,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
   for(float b = 400; b < 600; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(223,1,42,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
}

