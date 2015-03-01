
 color col1, col2, col3;

void setup() {
 size(200,200);
 noStroke(); 
 
 int baseAngle=200;
 colorMode(HSB, 360, 100,100);
  col1 = color(baseAngle, 30, 80);
  col2 = color((baseAngle+120)%360, 30, 50);
  col3 = color((baseAngle+240)%360, 30, 80); // tryadic color composition
}

void draw() {
 background(00); 
 
  // hour:
  fill(col1 );
  float hAngle = map(hour()%12+(float)minute()/60, 0, 12, 0, 2*PI);
  arc(100,100,180,180, -PI/2, hAngle-PI/2 );
  fill(0); ellipse(100,100,140,140);
  
  // minute:
  fill(col2);
  float mAngle = map(minute(), 0, 60, 0, 2*PI);
  arc(100,100,140,140, -PI/2, mAngle-PI/2 );
  fill(0); ellipse(100,100,100,100);
 
  // second:
  fill(col3);
  float sAngle = map(second(), 0, 60, 0, 2*PI);
  arc(100,100,100,100, -PI/2, sAngle-PI/2 );
  fill(0); ellipse(100,100,60,60);
  
}
