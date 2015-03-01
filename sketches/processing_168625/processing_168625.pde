
piramida pirmaa;
piramida otraa;
piramida tresaa;
piramida ceturtaa;
piramida piektaa;
piramida sestaa;
piramida septiitaa;
piramida astotaa;
piramida deviitaa;
void setup(){
  size(600,625,P3D);
background(255);
pirmaa=new piramida(color(255,17,104,127),color(143,143,143,127),color(143,143,143,127),color(143,143,143,127),color(143,143,143,127),color(180),150,150);
otraa=new piramida(color(143,143,143,127),color(143,143,143,127),color(255,17,104,127),color(143,143,143,127),color(143,143,143,127),color(180),300,150);
tresaa=new piramida(color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,100),450,150);
ceturtaa=new piramida(color(143,143,143,127),color(143,143,143,127),color(255,17,104,127),color(143,143,143,127),color(143,143,143,127),color(180),150,300);
piektaa=new piramida(color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,100),300,300);
sestaa=new piramida(color(143,143,143,127),color(255,17,104,127),color(143,143,143,127),color(255,17,104,127),color(143,143,143,127),color(180),450,300);
septiitaa=new piramida(color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,127),color(255,17,104,100),150,450);
astotaa=new piramida(color(143,143,143,127),color(255,17,104,127),color(143,143,143,127),color(255,17,104,127),color(143,143,143,127),color(180),300,450);
deviitaa=new piramida(color(143,143,143,127),color(143,143,143,127),color(255,17,104,127),color(143,143,143,127),color(143,143,143,127),color(180),450,450);


}

void draw(){
 hint(DISABLE_DEPTH_TEST);
  smooth();
background(255,255,255);
//translate(100, 100, 0);
pirmaa.display();
otraa.display();
tresaa.display();
ceturtaa.display();
piektaa.display();
sestaa.display();
septiitaa.display();
astotaa.display();
deviitaa.display();
//saveFrame("frames/####.png");
}

class piramida{
color a,b,c,d,e,f;
float x,y;

piramida(color ax, color bx, color cx,color dx, color ex,color fx, float tempx, float tempy){
a=ax;
b=bx;
c=cx;
d=dx;
e=ex;
f=fx;
x=tempx;
y=tempy;
}
void display(){
  strokeWeight(2);
  
  pushMatrix();
 translate(x,y,0);
 rotateY(radians(frameCount  % 360));
 rotateX(PI/2);
// rotateY(mouseY*0.001);
// rotateZ(mouseX*0.001);
 stroke(f);
 fill(a);

 beginShape();
vertex(-50, -50, -50);
vertex( 50, -50, -50);
vertex(   0,   0, 50);
 endShape();
 fill(b);
 beginShape();
vertex( 50, -50, -50);
vertex( 50,  50, -50);
vertex(   0,   0, 50);
 endShape();
 fill(c);
 beginShape();
vertex( 50,  50, -50);
vertex(-50,  50, -50);
vertex(   0,   0, 50);
 endShape();
 fill(d);
 beginShape();
vertex(-50,  50, -50);
vertex(-50, -50, -50);
vertex(   0,   0, 50);
endShape();
fill(e);
beginShape();
vertex(-50,  -50, -50);
vertex(50, -50, -50);
vertex( 50,   50,-50);
vertex(   -50,   50, -50);
endShape();
popMatrix();
}}
