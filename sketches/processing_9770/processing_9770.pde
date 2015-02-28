
float Sx;
float Sy;
float Mx;
float My;
float Hx;
float Hy;
float hourcol;

void setup() {  
  size(600, 600);  

  smooth();  
}  
void draw() {  
  background(255); 
 fill(46, 208,255 , hourcol*10);
  noStroke();
  ellipse(width/2, height/2, 500, 500); 
noFill();
  noStroke();    
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;  
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;  
  stroke(248, 252, 8);  
  strokeWeight(2); 
 hourcol = hour(); 
  Sx= cos(s) * 216 + 300;
 Sy= sin(s) * 216 +300;
Mx=  cos(m) * 180 + 300;
My= sin(m) * 180 + 300;
Hx= cos(h) * 150 + 300;
Hy= sin(h) * 150 + 300;

  ellipse(Mx, My, 100, 100);
  ellipse(Sx, Sy , 30, 30);  
  strokeWeight(3); 
  noFill();
  stroke (248, 252, 8); 
  ellipse(Hx, Hy, 130, 130);  
  strokeWeight(2);  
  
  
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  arc(width/2, height/2, 60, 60, radians(-90), s);
  
  println(s);
  
 
}  

