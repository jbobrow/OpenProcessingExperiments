
float n = 400;
float r = 0;

void setup() {
  size(900,800);
  background(214,148,50);
  stroke(0);
  smooth();
}



void draw() {
  
translate(width/2,height/2);

  if(n >= 0) {
    n=n - 8;
    r=r + 8;
    
  } else {
    n= 400;
    r= 0;
  }
    
  
line(0,n,r,0);
line(1, -n,r,-1);
line(-1,n,-r,1);
line(1,-n,-r,1);
   
}

  
  

