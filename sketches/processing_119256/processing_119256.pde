
// spiral thunder
// Chang,KuoPing, department of ID
void setup(){
  size(500,300);
 //noLoop();
 //frameRate(10);
 smooth();
}

void draw(){
  background(0);
 
  for (int i = 0; i<100; i++) { 
    strokeWeight(0.5);
    int centX = 250;
    int centY = 150;
    float x, y;    
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(10);
    float radius = 10;
    stroke(220, 250, 170,50);
    /*
    int startangle = int(random(360));                                  
    int endangle =  1440 + int(random(1440));                           
    int anglestep =  5 + int(random(3));
    */
    for (float ang = 0; ang <= 1440; ang += 1) {
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


