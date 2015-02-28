
// sketch
int EW=100;
int EH=100;

float EY;
float EX;
float r;
float g;
float b;
float x;
float y;
float w;
float h;

void setup (){
size(600,600);

EW=(100);
EH=(100);

 


background(255);
}

void draw() {


r=random(255);
g=random(255);
b=random(255);
x=random(600);
y=random(600);


fill(r,g,b); 
ellipse(x,y,EW,EH);


EW=EW+1;
EH=EH+1;

EW=constrain(20,30,40);
EH=constrain(20,30,40);
} 
void mousePressed(){

w=random(600);
h=random(600);


fill(r,g,b,200);
rect(x,y,w,h);
