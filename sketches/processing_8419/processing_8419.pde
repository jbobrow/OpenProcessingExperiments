
void setup() {
  size(180, 180);
  stroke(255);
}

void draw() {
   background(0);
  float s = map(second(), 0, 60, 0, 180);
  float m = map(minute(), 0, 60, 0, 180);
  float h = map(hour(), 0, 24, 0, 180);
  
//秒
fill(255,0,0);
ellipse(s,50,100,100); //圓心.長寬
smooth();
noStroke();

fill(255,165,0);
ellipse(s,50,80,80);

fill(255,255,0);
ellipse(s,50,60,60);

fill(0,255,0);
ellipse(s,50,40,40);

fill(0,0,255);
ellipse(s,50,20,20);

//分
 fill(0,0,255);
rect(m,100,50,50);
smooth();
noStroke();

 fill(0,255,0);
rect(m,100,40,40); 

 fill(255,255,0);
rect(m,100,30,30);

fill(255,165,0);
rect(m,100,20,20);

fill(255,0,0);
rect(m,100,10,10);
 
  fill(255,0,0);
  ellipse(h, 165, 100, 20);
   fill(255,165,0);
  ellipse(h, 165, 80, 20);
   fill(255,255,0);
  ellipse(h, 165, 60, 20);
   fill(0,255,0);
  ellipse(h, 165, 40, 20);
   fill(0,0,255);
  ellipse(h, 165, 20, 20);
}


