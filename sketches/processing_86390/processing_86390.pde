
void setup(){
size (600, 600);
smooth();
int k= int(random(6))+1;
println("random intiger 1-6=" +k);
int l= int(random(10))+1;
println("random intiger 1-10 ="+l);
}

int bcx= 500;
int bcy= 500;
int wrx= 10;
int wry= 10;

void draw(){
 background(#FFFFFF);
//white square
fill(#FFFFFF);
stroke(#000000);
rect( wrx,wry, 100, 100);
wrx+=7;
wrx=constrain(wrx, 10,400);
//black circle
fill(#000000);
ellipse(bcx,bcy,50,50);
bcx-=4;
bcx=constrain(bcx,300,500);
}
