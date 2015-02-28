
int a;
void setup(){
a = 10;
size(150,150);
}
void draw(){
background(100);
a = (a+1) % 150;
rect(a,50,10,10);
}
