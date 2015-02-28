
float x=300;
float y=300;
float a=map(mouseX,0,600,600,0);
float b=map(mouseY,0,600,600,0);
void setup(){
size(600,600);
background(137,188,219);
}

void draw(){
stroke(255);
strokeWeight(0.3);
fill(random(220,250),random(50,100),random(50,100));
ellipse(x,y,20,20);
if(mouseX<x){
x=x-(a/200);
}
if(mouseX>x){
x=x+(a/200);
}
if(mouseY<y){
y=y-(b/200);
}
if(mouseY>y){
y=y+(b/200);
}
if(x<10 || x>590 || y<10 || y>590){
x=300;
y=300;
}
if(mousePressed){
x=mouseX;
y=mouseY;
}
}
