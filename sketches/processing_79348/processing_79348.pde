
void setup()
{
  size(600, 600);
  smooth();
}

void draw() {
  
  background(200);
 
  int centX = width/2;
  int centY = height/2;
  float x, y;
  
  // draw 80 spirals
  for (int i = 0; i < 80; i++) {                                         
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(10);
    float radius = 10;
    
    //color
    float colorx = random(0,500);
    float colory = random(0,500);
    stroke( noise( colorx/100.0 , colory/100.0 ) * 255, 0 , 255 - noise( colorx / 200.0, colory/200.0) * 255, 100 );
 
    int startangle = int(random(360));                                  
    int endangle =  1440 + int(random(1440));                           
    int anglestep =  5 + int(random(3));
    for (float ang = startangle; ang <= endangle; ang += anglestep) {
      radiusNoise += 0.05;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      if (lastx > -999) {
        line(x,y,lastx,lasty);
      }
      lastx = x;
      lasty = y;
    }
  }
}


