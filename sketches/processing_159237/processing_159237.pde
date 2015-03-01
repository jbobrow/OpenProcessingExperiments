
void setup() { 
  size(300,300);  
}
int i=0;
void draw() { 
background(250);
cuadrados(i,150,10,10); 
fill(125,150,140); 
cuadrados(30,30,50,240);
cuadrados(220,30,50,240);
i=i+1;
if(i>=300){
i=0;
}
}
void cuadrados(int x,int y,int a,int h){
  rect(x,y,a,h);
  }
