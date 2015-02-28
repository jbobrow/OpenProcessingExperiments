
int x=0;
void setup(){
  size(400,900,P3D);
  background(0,0,255);
  fill(255);
  smooth();
}

void draw(){
  x=x+3;
  background(0,200,255);
  translate(80,x,-0.5);
  sphere(50);
  translate(210,x-x,-0.5);
  sphere(90);
    if(x>height+200){
    hello();
  }
}

void hello(){
  x=0;
}
  
  

