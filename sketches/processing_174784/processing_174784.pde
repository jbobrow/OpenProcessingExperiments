
int counter;

void setup() {  
  size(400, 400);
  background(255); 
  }
int i=0;
void draw() {  
  fill(100,128,50);
  cuadrados(120,30,50,250);
  cuadrados(250,30,50,250);
  cuadrados(i , 150,10,10);
  i=i+1;
 
  }
  void cuadrados(int x, int y, int a, int h){
  rect (x,y,a,h);
  }

