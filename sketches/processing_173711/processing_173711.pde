
nt cx, cy;
float hx, hy, mx, my, sx, sy;
float sR;
float mR;
float hR;
float clockDiameter;
 
void setup() {
  size(800,800);
  stroke(255);
  frameRate(1);
  int radius = min(width, height) / 2;
  sR = radius * 0.25;
  mR = radius * 0.50;
  hR = radius * 0.75;
  clockDiameter = radius * 1.9;
   
  cx = width / 2;
  cy = height / 2;
}
 
void draw() {
  background(random(255),random(255),random(255));
   

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
   
  noStroke();
 
  for (int a = 0; a < 360; a+=1) {// hours
    float angle = radians(a+(second()*6)-125);
    //angle = radians(a-130);
    float x = cx + cos(angle) * cx/2;
    float y = cy + sin(angle) * cy/2;
    //vertex(x, y);
    fill(random(255),random(255),random(255));
    ellipse(x, y, width/2, height/2);
  }
 
 
  for (int a = 0; a < 360; a+=1) { //minutes
    float angle =  + radians(a+minute()*6+second()*0.1 -118);//+80+m*60);
    //float angle =  + radians(a-118);//+80+m*60);
    float x = cx + cos(angle) * cx/2;
    float y = cy + sin(angle) * cy/2;
    //vertex(x, y);
    fill(random(255),random(255),random(255));
    ellipse(x, y, width/7, height/7);
  }
 
  for (int a = 0; a < 360; a+=1) { // secondes
    float angle =  radians(a+(hour()*30)+minute()*0.5-150);//+80+h*30);
    //float angle =  radians(a-150);//+80+h*30);
    float x = cx + cos(angle) * cx/4;
    float y = cy + sin(angle) * cy/4;
    //vertex(x, y);
    fill(random(255),random(255),random(255));
    ellipse(x, y, width/10, height/10);
  }
   
  
 
}
