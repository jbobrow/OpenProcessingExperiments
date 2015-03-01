



void setup() {  
size (300,300);  
}
int i=0;
void draw() {  
background(250);
fill(45,50,100);
cuadrados(i,150,10,10);
i=i+1;
if(i>=300){
i=0;
}
fill(150,10,20);
cuadrados(30,30,50,240);
cuadrados(220,30,50,240);

}
void cuadrados(int x, int y,int a, int h){
rect(x,y,a,h);
}
