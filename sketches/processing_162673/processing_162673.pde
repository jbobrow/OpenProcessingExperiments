

 
float diameter;
float angle = 0;
 
void setup() {
  size(1000, 500);
  diameter = height - 10;
  stroke(1);
}
 float radius=200;
 float curDeg=0;
void draw() {
   
  float d1 = 5+ (sin(angle) * diameter/2) + diameter/4;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/6;
  float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/8;
  
   

  fill(200, 50, 90,120);
  ellipse(width/2, height/2, d2, d2);

  translate(width/2, height/2);
  
  curDeg += 6;
  float rad = radians(curDeg);
  float x = radius * cos(rad);
  float y = radius * sin(rad);
  line(0,0,x,y);
   
   
  angle += 0.02;
}

