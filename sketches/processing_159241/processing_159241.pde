
int i = 0;

void setup() {  
  size(600, 400);
 background(255);
}

void draw() {
background(255);
fill(300,100,200);
cuadrados(i,175,50,50);
i=i+1; 
if(i>600){
i=0;
}
cuadrados(100,50,100,300);
cuadrados(400,50,100,300);

}
void cuadrados(int x,int y,int a,int h){
rect(x,y,a,h);
fill(100,200,50);
}
