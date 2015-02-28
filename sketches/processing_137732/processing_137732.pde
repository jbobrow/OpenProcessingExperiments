
float x;
float z;
float y;
 

void setup(){
size(1000,300);
//frameRate(5);
smooth();
//background(0);

}

void draw(){

fill(0, 8);
rect(0, 0, width, height);

fill(255);
noStroke();

ellipseMode(CENTER);
ellipse(x, 100*sin(y)+150, 50,50);

x=x+1;
y=y+0.01;
if(x==width){
x=0;

}

}
