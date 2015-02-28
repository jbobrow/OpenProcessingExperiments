
float x,y,vx,vy;

void setup(){
size(800,600);
background(100,200,80);
 
} 

void draw(){

strokeWeight(40);

stroke(100,23,10,190);

fill(y+x,10,10); 
vx=(mouseX- x)/20;
vy =(mouseY -y)/10;
x=x+ vx;
y = y +vy;
//rect(x,y,5*vx,5*vy;
line(x,y,5*vx,5*vy);
ellipse(x,y,18,40);
rect(y,x,100,x);
}


