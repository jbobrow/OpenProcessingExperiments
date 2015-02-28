
void setup(){
  size(300,300);
  background(0);
  frameRate(5);
  colorMode(RGB,100);
}

int a = 0;
int b = 100;
int c = 0;

void draw(){
  
  ellipseMode(CENTER);
  
  stroke(b,a,a);
  noFill();
  ellipse(width/2,height/2,c,c);
  a+=10;
  b-=10;
  c+=10;

  if (a>100){
    a=0;
  }
    
  if (b<0){
    b=0;
  }
  
  if (c>400){
    background(0);
    c=0;
  }
}
  

