
int counter;

void setup() {  //setup function called initially, only once
  size(300, 300);
  background(128,255,255);  //set background white
  }
int i=0;
void draw() {  //draw function loops 
  fill(255,128,255);
  cuadrados(70,30,50,250);
  cuadrados(200,30,50,250);
  cuadrados(i , 150,10,10);
  i=i+1;
 
  }
  void cuadrados(int x, int y, int a, int h){
  rect (x,y,a,h);
  }
