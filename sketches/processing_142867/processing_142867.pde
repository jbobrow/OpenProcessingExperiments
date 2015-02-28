
// Walker Class example modification
// Adriana Roman

class Walker{
    
int x;
int y;
int c;
int sw;

Walker(){
    x=width/2;
    y=height/2;
}

void display(){
    stroke(0,140,c,140);
    strokeWeight(sw);
    point(x,y);
}

void step(){
int stepx=int(random(3))-1;
int stepy=int(random(3))-1;
sw=int(random(5,10));
x+=stepx*sw;
y+=stepy*sw;
if(x >=width){
 x=(stepx*sw)-(stepx*sw-width);   
}else if(x <0){
    x=(stepx*sw)+(0-stepx*sw);
}else if(y<0){
 y=(stepy*sw)+(0-stepy*sw);   
}else if(y>height){
 y=(stepy*sw)-(stepy*sw-height);   
}
if ((x==0 || x<=width/2)&&(y==0 || y<=height/2)){
    c=int(random(0,64));
}else if ((x==0 || x<=width/2)&&(y>height/2 || y<=height)){
    c=int(random(65,128));
}else if ((x>width/2 || x<=width)&&(y>height/2 || y<=height)){
    c=int(random(129,193));
}else if ((x>width/2 || x<=width)&&(y==0 || y<=height/2)){
    c=int(random(194,256));
}
}
}

Walker w;

void setup(){
    size(640,360);
    w=new Walker();
    background(255);
}

void draw(){
    w.step();
    w.display();
}

