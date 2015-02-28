

void setup()
{
  size(300,600);
  background(0);
  noLoop();
  smooth();
}

void draw()
{
for(int q = 0; q < 26; q = q + 1)
  {
    float w = random(0,20);
    float x = random(0,300);
    float y = random(0,420);
    float z = random(10,30);
    float h = random(10,30);
    float i = random(10,30);
    float v = random(2,3);
    noFill();
    float o = random(30,100);
    float c = random(50,200);
    stroke(c,o);
    strokeWeight(v);
    beginShape();
      vertex(x, y);
     // vertex(x+z, y-z);
      vertex(x+z+h, y-h);
      //vertex(x+z+h+i, y);
      vertex(x+z+h, y+h);
      //vertex(x+z, y+z);
    endShape(CLOSE);
  
  }
  
for(int q = 0; q < 4; q = q + 1)
  {
    float w = random(0,20);
    float x = random(0,300);
    float y = random(420,600);
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
     // vertex(x+z, y-z);
      vertex(x+z+h, y-h);
      //vertex(x+z+h+i, y);
      vertex(x+z+h, y+h);
      //vertex(x+z, y+z);
    endShape(CLOSE);
  
  }
 
   /*for(int c = 0; c < 8; c = c + 1)
  {
    float t = random(30,100);
    float v = random(2,4);
    noFill();
    stroke(120,t);
    strokeWeight(v);
    float x = random(0,100);
    float y = random(0,480);
    float z = random(15,60);
    rect(x,y,z,z);
  } 
  */
  for(int q = 0; q < 10; q = q + 1)
  {
    float w = random(0,20);
    float x = random(0,100);
    float y = random(0,480);
    float z = random(10,30);
    float h = random(10,30);
    float i = random(10,30);
    float v = random(2,3);
    noFill();
    float o = random(30,100);
    float c = random(50,200);
    stroke(c,o);
    strokeWeight(v);
    beginShape();
     // vertex(x, y);
      vertex(x+z, y-z);
      vertex(x+z+h, y-h);
    //  vertex(x+z+h+i, y);
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
   for(float b = 60; b < 300; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(158,27,224,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
  for(float b = 60; b < 340; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(63,176,210,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
   for(float b = 20; b < 320; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(252,237,48,t);
    strokeWeight(2);
    line(s,b,e,b);
    endRecord ();
  }
    for(float b = 82; b < 312; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(223,1,42,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
    for(float b = 105; b < 300; b = b + 25)
  {
    float s = random(0,100);
    float e = random(200,300);
    float t = random(50,100);
    
    stroke(24,208,136,t);
    strokeWeight(2);
    line(s,b,e,b);
  }
}


