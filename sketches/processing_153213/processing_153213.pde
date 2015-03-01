
class walker{
int x;
int y;

walker(){
x=width/2;
y=height/2;
}

void display(){
ellipse(x,y,mouseX-150,mouseY-150);
}

void step(){
int askel=int(random(4));
if (askel==0){
x=x+5;}
else if (askel==1){
x=x-5;}
else if (askel==2){
y=y+5;}
else {
y=y-5;}
}
}
walker w;

void setup(){
size(800,800);
w=new walker();
background(33,20,38);
//noStroke();
}

void draw(){
if (mousePressed){
float vari_muuttaja = map(mouseX, 0, width, 0, height);
fill(vari_muuttaja-30,vari_muuttaja-180,vari_muuttaja);
w.step();
w.display();
}
}
