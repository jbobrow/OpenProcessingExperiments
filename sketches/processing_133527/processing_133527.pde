
void setup(){
size (500, 500);
smooth();
}

int a=10;
int b=5;
int c=0;


void draw(){
frameRate(30);
background(0);
float me= random (100);
float you= random (200);
float them= random (350);

for(int a=10; a<=500; a=a*2){
for (int b=5; b<=500; b=b+5){

stroke(you, me, them, 75);
noFill();
line (a, a+b, b, 500);
line(a+b, a, 500, b);
}
}


}
