
PVector centro;
PVector mouse;
PVector vel;
PVector pos;
PVector dir;
float dt=1/5.0;
boolean click;
boolean libre;

void setup(){
size(600,400);
  pos=new PVector(width/2,height);
  vel = new PVector(width/2,-height);
}
void draw(){
background(0);
direccion();
display();
if (click==true){ 
  update();
  }
  //se saca la direccion del ratón con respecto a la del centro y se resta y se normaliza
centro=new PVector(width/2,height);
 mouse=new PVector(mouseX, mouseY);
mouse.sub(centro);
mouse.normalize();
mouse.mult(100);

stroke(#FFD1D1);
translate(width/2,height);
line(0, 0, mouse.x,mouse.y);
}
//se recoge la dirección donde se ha hecho click
void direccion(){
if (libre==true){
vel=mouse;
libre=false;
}
}
void update(){  
pos.y +=vel.y*dt;
pos.x += vel.x*dt;
//si se sale de los límites de la ventana, vuelve a la pos inicial
if(pos.x>width || pos.x<0 || pos.y>height || pos.y<0){
click=false;
pos.x=width/2;
pos.y=height;}}

 
void display(){
  stroke(0);
  fill(random(255),random(255),random(255));
  ellipse(pos.x,pos.y,16,16);}
  
void mouseClicked(){
  click=true;
  libre=true;
 
} 




