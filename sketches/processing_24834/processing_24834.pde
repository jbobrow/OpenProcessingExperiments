

void setup()
{
  size(300,600);
  background(0);
  noLoop();
  smooth();
}

void draw()
{
  for(int q = 0; q < 18; q = q + 1)
  {
    float w = random(0,20);
    float x = random(0,280);
    float y = random(0,420);
    float z = random(10,30);
    float h = random(10,30);
    float i = random(10,30);
    float v = random(0.5,3);
    noFill();
    float o = random(30,100);
    float c = random(50,200);
    stroke(c,o);
    strokeWeight(v);
    beginShape();
      vertex(x, y);
      vertex(x+z, y-z);
      vertex(x+z+h, y-h);
      vertex(x+z+h+i, y);
      vertex(x+z+h, y+h);
      vertex(x+z, y+z);
    endShape(CLOSE);
  }
   for(int c = 0; c < 15; c = c + 1)
  {
    float t = random(0,100);
    float i = random(0.5,3);
    noFill();
    stroke(120,t);
    strokeWeight(i);
    float k = random(0,100);
    float j = random(0,300);
    float g = random(15,60);
    ellipse(k,j,g,g);
  }
  
  for(int q = 0; q < 3; q = q + 1)
  {
    float w = random(0,20);
    float x = random(0,300);
    float y = random(0,200);
    float z = random(10,30);
    float h = random(10,30);
    float i = random(10,30);
    float v = random(0.5,3);
    noFill();
    float o = random(30,100);
    float c = random(50,200);
    stroke(c,o);
    strokeWeight(v);
    beginShape();
      vertex(x, y);
      vertex(x+z, y-z);
      vertex(x+z+h, y-h);
      vertex(x+z+h+i, y);
      vertex(x+z+h, y+h);
      vertex(x+z, y+z);
    endShape(CLOSE);
  }
  
  for(float b = 20; b < 600; b = b + 20)
  {
    float s = random(0,100);
    float e = random(200,300);
    float o = random(0,80);
    
    stroke(255,o);
    strokeWeight(2);
    line(s,b,e,b);
  }
   for(float b = 300; b < 520; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(255,76,214,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
  for(float b = 280; b < 520; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(63,176,210,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
   for(float b = 260; b < 520; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(252,237,48,t);
    strokeWeight(2);
    line(s,b,e,b);
  
  }
 for(float b = 280; b < 520; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(223,1,42,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
}  


