
float h;
float m;
float s;
float t1;
float t2;
float t3;

void setup(){
  size (500, 500);
  noStroke();
  smooth();
  
  h = hour();
  m = minute();
  s = second();
  
  
}

void draw (){
  background (50);
  
  fill (18, 245, 255);
  arc (width/2, height/2, width/2, height/2, TWO_PI-PI/2, (TWO_PI-PI/2)+(TWO_PI/12+h) );  
  
  fill (100, 0, 200);
  arc (width/2, height/2, 150, 150, TWO_PI-PI/2, (TWO_PI-PI/2)+(TWO_PI/60 +m));
  
  fill (128, 255, 18);
  arc (width/2, height/2, 100, 100, (TWO_PI-PI/2), ((TWO_PI/60)+s));
  
  
  t1=map(hour(), 0, h, 0, (TWO_PI-(12-h))); 
  t2=map(minute(), 0, m, 0, (TWO_PI-(60-m)));
  t3=map(second(), 0, s, 0, (TWO_PI-(TWO_PI/60-s)));
  
  
}


