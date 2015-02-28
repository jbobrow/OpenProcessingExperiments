
float x=300;
float y=300;
float a=0;
float b=0; 
void setup(){
size(600,600);
background(137,188,219);
}
 
void draw(){  

if(mouseX<300){
a=map(mouseX,0,300,300,0);
}
if(mouseX>300){
a=map(mouseX,300,600,0,300);
}
if(mouseY<300){
  b=map(mouseY,0,300,300,0);
}
if(mouseY>300){
  b=map(mouseY,300,600, 0,300);
}
stroke(255);
strokeWeight(0.3);
fill(random(220,250),random(50,100),random(50,100));
ellipse(x,y,20,20);
if(mouseX<x){
x=x-(a/50);
}
if(mouseX>x){
x=x+(a/50);
}
if(mouseY<y){
y=y-(b/50);
}
if(mouseY>y){
y=y+(b/50);
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

