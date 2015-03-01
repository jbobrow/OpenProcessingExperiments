
void setup(){
size(300,300);
}
int i = 0;
int c;
void draw(){
background(255);
cuadrados (i,150,10,10,0);
cuadrados (50,50,50,200,150);
cuadrados (200,50,50,200,134);
i=i+1;
if(i>=300){
i=0;
}
}
void cuadrados(int x,int y,int a,int h, int c){
fill(c);
rect (x,y,a,h);
}

