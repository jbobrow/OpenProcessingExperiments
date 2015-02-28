
int s;
int m;
int h;

float thickness = 1;

void setup() {
  size(800,800);
  background(255,100,100);
}

void draw() {
  s = second();
  m = minute();
  h = hour();
  
  background(255,100,100);

 thickness = thickness + 1;
  if (thickness > 30)
  {
    thickness = 1;
  }
  stroke(0,255,255);
  strokeWeight(thickness);
   for (int j=0; j<m; j++) {
    
    ellipse(400,400,j*7,j*7);
  ellipse(400,400,j*5,j*5);
  }
  fill(0,230,245);


 for(int i=0; i < s; i++)
 {
   stroke(0,255,255);
    strokeWeight(1);
   rect(0,i*60, 50, 50);
   rect(100,i*60,50,50);
   rect(650,i*60,50,50);
  rect(750,i*60, 50,50);
  
 
 }
}
