
int x1;
int y1;
 
void setup(){
  size(500, 500);
  smooth();
  x1 = width/2;
  y1 = height/2; 
}
 
 
void draw(){
  
  background(30);
 
  // Radius
  float sRadius = 100;    // seconds
  float minRadius = 150;  // minutes
  float hRadius = 200;   // hours
     
  float sAngle = map(second(),0 , 60, -90, 275);    // seconds
  float minAngle = map(minute(),0 , 60, -90, 275);  // minutes
  float hAngle = map(hour(), 0, 28, -90, 275);      // hours

  drawArc(hAngle, 200, 200, hRadius);
  drawArc(minAngle, 10, 10, minRadius);
  drawArc(sAngle, 100, 100, sRadius);

}


void drawArc(float variable, color c1, color c2, float radius){
  
  float res = 6.5;
   
   
   // Lines

  for(float angle = -90; angle < variable; angle += res){
     
    float inter = map(angle, -90, 360, 10, 10);
     
    color c = lerpColor(c1, c2, inter);
    stroke(c);
 
    float x2 = x1 + cos(radians(angle)) * radius;
    float y2 = y1 + sin(radians(angle)) * radius;
    line(x1, y1, x2, y2);
  }
}
