
float w = 0.0;
float z = 0.0;
int r = second();

void setup() {
  size(400, 400);
  stroke(255);
  smooth();
  
}
void draw() {
  background(0,0,0,0);
  for (int z = 60; z < 400; z += (width/3)) { 
  ellipse(z, w, r+(r/2) , r+(r/2)); 
  w += 0.07;
  if (w > 400+r){
  w = -1;
  }
  }
  stroke(255,255,255,150);
  

  fill(255);
  float s = map(second(), 0, 60,0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  
  strokeWeight(8);
  stroke(255);
  point(cos(s) * 72 +  (height/2), sin(s) * 72 + (width/2));
  strokeWeight(20);
  stroke(245,160,002);
  point( cos(m) * 60 +  (height/2), sin(m) * 60 + (width/2));
  stroke(244,167,87);
  strokeWeight(25);
  point( cos(h) * 50 + (height/2), sin(h) * 50 +(width/2));
  
   strokeWeight(3);
   stroke(227,226,175,150);
    for (int a = 0; a < 360; a+=6) {
    float x = (width/2) + ( cos(radians(a)) * 72 );
    float p = (height/2) + ( sin(radians(a)) * 72 );
    point(x, p);
    smooth();
  } 
    
   strokeWeight(8);
   stroke(108,123,120);
    for (int b = 0; b < 360; b+=30) {
    float k = (width/2) + ( cos(radians(b)) * 82 );
    float l = (height/2) + ( sin(radians(b)) * 82 );
    point(k,l);
  } 
  
   strokeWeight(mouseX/100*((width/150)%3)*mouseY/100*((height/150)%3));
   stroke(255,50);
    for (int n = 0; n<600; n+=60) {
       for (int b = 0; b < 360; b+=24){
        float j = (width/2) + ( cos(radians(b)) * n%149);
         float g = (height/2) + ( sin(radians(b)) * n%299);
          point(j,g);
 }  
 }
   ellipse(mouseX,mouseY,10,10);
   stroke (255,255,250,155);
 }

