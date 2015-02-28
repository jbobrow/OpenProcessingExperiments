
//Kang-Yu,Liu,suling11@ms55.hinet.net
//100 flowers
//20131030
int counter = 0;//flower counter

void setup() {
  size(500, 500);
  background(255);
  frameRate(1);
}

void draw() {
  //refresh the screen if more than 100 flowers drawn
  if (counter >100) {
    clearBackground();
    counter = 0;
  }
    drawFlower();
    counter++;
  }

  void drawFlower () {
    float radius = 20;
    int centX = int(random(width));
    int centY = int(random(height));
    //stroke(random(100, 220), 50, 70); 
    radius += 2;
    float x, y; 
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(10);
    
    int startangle = int (360);
    int endangle = 720 + int(random(720));
    int anglestep = 5 + int(random(8)-5);
   
    for (float ang=startangle; ang<=endangle; ang+=anglestep) {
      radiusNoise +=1.5;    
      radius +=0.5;

      float thisRadius = radius + (noise(radiusNoise)*110)-50;
      float rad = radians(ang);                                   
      x = centX + (thisRadius * cos(rad)); 
      y = centY + (thisRadius * sin(rad)); 
     

      if (lastx >-999) {
        stroke(random(0,255), random(30,80));
        strokeWeight(random(1, 8));
        line(x, y, lastx, lasty+1);
      }
      lastx = x;
      lasty = y;
    }
  }

  void clearBackground() {
    background(random(210, 240), 117, random(162,210));
  }



