
int X;
int Y;
int Z;
void setup() {
size (525,525);
smooth();
X=0;
Y=0;
Z=0;
noStroke();
frameRate(100);
fill (random(255),random(255),random(255));
}
void draw(){
background (0, 0,0);
rect(X+10,Z+10, 50,50);
if (Y==0) {
X=X+4;
fill (random(255),random(255),random(255));

}
if(X>447) {
fill (random(255),random(255),random(255));
Y=1;
}
if (Y==1){
Z=Z+2;
fill (random(255),random(255),random(255));
}   
if (Z>=448){
Y=2;
}
if (Y==2){
X=X-4;
fill (random(255),random(255),random(255));
}
if (X==0){
Y=3;
}
if (Y==3){
Z=Z-6;
fill (random(255),random(255),random(255));
}
if (Z==0){
Y=0;
} 
}
