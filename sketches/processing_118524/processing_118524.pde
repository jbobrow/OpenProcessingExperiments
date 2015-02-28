
//Draw a Circle
//Test 013 [Date:20131030] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛


void setup() {
  size(500, 500);
  background(255);
  smooth();
  //noLoop();
  
  frameRate(1);
}

void draw() {

  stroke(random(20), random(50), random(70), 20);
  strokeWeight(8);
  float x, y;
  float radius = 0.5;
  float radiusNoise = random(20);
  
  int centX = 250;
  int centY = 250;
  //int centX = width/2;
  //int centY = height/2;
  
  for (float ang=0; ang<=360*10; ang+=2) {
    
    radiusNoise += 0.1;
    radius += 0.5;
    
    float thisRadius = radius/2 + (noise(radiusNoise)*200) - 100;
    
    float rad = radians(ang);
    //x = centX + (radius* cos(rad));
    //y = centY + (radius* sin(rad));
    
    x = centX + (thisRadius* cos(rad));
    y = centY + (thisRadius* sin(rad));
    point(x, y);
  }

}
