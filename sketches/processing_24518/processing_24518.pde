
void setup() {
  size(500,1000);
  smooth();
}
void draw () {
  stroke(0,0,0);
  background(255); 
  float x = 0;

  while(x<200)
  {
    line (5*x,0,5*x,height);
    x = x + 0.5;
  }
  line (0,0,500,1000);
  line (500,0,0,1000);
  fill (219,69,81,80);
  triangle(0,0,500,0,250,500);
  fill (55, 180, 68,80);
  triangle (0,0,0,1000,250,500);
  triangle (500,0,250,500,500,1000);
  fill (55,89,180,80);
  triangle (250,500,0,1000,500,1000);
  
 
 
 
 
 }


