
float p = 0, q = 0, x, y, r = 0;

void setup(){
 
  size(600,600);
  smooth();
  noFill();
  
}

void draw(){
  for (int i = 0; i < 255; i = i + 2)
  {
    stroke(255, i, i/50, 50);
    ellipse(width/2, height/2, i*cos(r), i+30);
  
  }
  strokeWeight(3);
  stroke(255, 100 + 200 * sin(r/10), 00 );//colors
  x = 300+ 173 *cos(r)-60*cos(r*173/63);
  y = 300+ 173*sin(r)-60*sin(r*173/63);
  if(p > 0)
    line(p, q, x, y);
  else background(99, 210, 255);
  p = x;
  q = y;
  r+= PI/10;
 
  
}



