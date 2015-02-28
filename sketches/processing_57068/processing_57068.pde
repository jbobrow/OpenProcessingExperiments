
int x;
int y;
int lr;
int tr;
int d;

void setup() {
  size(500, 500);

  x=250;
  y=250; 
  lr=200;
  tr=13;
}

void draw() {
  background (255);

  ellipse(x, y, lr, lr); 
  ellipse(x, y-lr/2-tr/2, tr, tr);
  ellipse(x, y+lr/2+tr/2, tr, tr);

 if(d<200){
    d=d+1;
    lr=lr-1;
    tr=tr+1;
  }else{d=d+1;
    lr=lr+1;
    tr=tr-1;
        
  }  if(d==400){
       d=0;
  }}
 
  

