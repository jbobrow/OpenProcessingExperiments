
float x=300;
float y=300;
float a=0;
float b=0;
void setup(){
size(600,600);
background(137,188,219);
}
  
void draw(){ 
 
if(mouseX<x){
a=map(mouseX,0,x,x,0);
}
if(mouseX>x){
a=map(mouseX,x,600,0,x);
}
if(mouseY<y){
  b=map(mouseY,0,y,y,0);
}
if(mouseY>y){
  b=map(mouseY,y,600, 0,y);
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

