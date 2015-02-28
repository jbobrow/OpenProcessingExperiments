
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
  
background(345,55,y);
rectMode(CENTER);
fill(0);
rect(x, y, 50, 50);
x= mouseX;
y= mouseY;
println(x);
 if(y == height){
   y=0;
 }
 
y++;
}


