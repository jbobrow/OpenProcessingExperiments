
int x;
int y;
int lr;
int tr;

void setup(){
  size(500,500);
 
  x=250;
  y=250; 
  lr=300;
  tr=20;
 }

void draw(){
  background (255);
  
  ellipse(x, y, lr, lr); 
  ellipse(x, y-lr/2-tr/2, tr, tr);
  ellipse(x, y+lr/2+tr/2, tr, tr);

  lr=lr-1;
}

