
float x,y,vx,vy;

void setup(){
size(800,600);
background(100,200,80);
 
} 

void draw(){

strokeWeight(30);

stroke(51,23,3,30);

fill(y+x,10,12); 
vx=(mouseX- x)/20;
vy =(mouseY -y)/10;
x=x+ vx;
y = y +vy;
//rect(x,y,5*vx,5*vy;
line(x,y,5*vx,5*vy);
fill(y+x,10,12,30); 
ellipse(x,y,18,40);
fill(y+x,10,12,40);
rect(y,x,100,x);
fill(x,y,50,30);
triangle(x,y,120,200,41,250);
}

