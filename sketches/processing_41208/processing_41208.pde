
int x,y,x1,y1;

void setup(){
size(200,200);
noFill();
}void draw(){

if(mousePressed) 
fill(102, 138, 120);

else 
fill(255, 102, 0);


background(230);
x=200-mouseX-25;
y=200-mouseY-25;
x1=mouseX-25;
y1=mouseY-25;
rect(x,25,50,50);
rect(x1,125,50,50);
rect(25,y,50,50);
rect(125,y1,50,50);
}      
