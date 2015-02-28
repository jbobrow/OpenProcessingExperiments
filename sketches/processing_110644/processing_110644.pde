
int x;
int y;
int R;
int G;
int B;

void setup(){
size(600,600);
x=300;
y=1;
}

void draw(){
  
background(R,G,B                          );
rectMode(CENTER);
fill(0);
rect(x, y, 50, 50);
x= mouseX;
y= mouseY;
R= mouseX;
G= mouseX;
B= mouseY;
println(x);
 if(R >= 255){
   R--;
 }
 
y++;
}


