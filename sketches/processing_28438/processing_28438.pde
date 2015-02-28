
int a =0;

void setup () {
  
  size (400, 400);
  noStroke ();
  smooth ();
  }

void draw () {
  
  background (255);
  stroke (0, random (255));
  
  if (mousePressed){
  for (int x = 0; x < width; x = x+1){    
    line (x,0,x,height);    
  }}else{
    fill (0);
    rect (0,0,width, height);
  }
    
}

