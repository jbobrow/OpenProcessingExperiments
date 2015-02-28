
int videoScale = 35;
int cols, rows;
int f0 = 0;
int f1 = 1;
int f2 = 1;

void setup() {
  size(700,700);
  
  cols = width/videoScale;
  rows = height/videoScale;
}

void draw() {
  
  
  for (int i = 0; i < cols; i++) {
    
    for (int j = 0; j < rows; j++) {
      

      int x = i*videoScale;
      int y = j*videoScale;
      fill((j+1)*theFib(),(i+x)/3,(j+y)/3,35);
      stroke(0,10);
      strokeWeight(10);
      rect(x,y,videoScale,videoScale); 
    }
  }
}

int theFib()
{
   int result = f2;
   f0 = f1;
   f1 = f2;
   f2 = f0 + f1;
   return result;
}


