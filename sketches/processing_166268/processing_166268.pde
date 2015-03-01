
import processing.net.*; 
Server server; 
PFont f; 
int data = 0; 
PImage logo;
PVector loc=new PVector(width/3,height/2);
PVector mov=new PVector(3,2);
PGraphics glow;
float distance;
PShape A;
PFont F;
int C = 0;
int value = 0;
void setup(){
  size (500,500);
 
 
}

void draw(){
  if(key=='q'|| key=='Q'){
    C7();
  }
  if(key=='w'|| key=='W'){
    C8();
  }
  if(key=='e'|| key=='E'){
   C9();
  }
}

void C7(){
  server = new Server(this, 5204); 
f = createFont("Arial",48,true); 
background(255); 
fill(0);
noStroke();
text("Move your mouse",250,125);

textFont(f); 
textAlign(CENTER); 
fill(mouseX,mouseY); 
text(data,250,250); 

server.write(data); 

data = (data + int(random( -1,2))) % 177; 
} 

void serverEvent(Server server, Client client) { 
println(" A new client has connected: "+ client.ip()); 
} 



void C8(){
  background(255);
  A = loadShape("Niu.svg");
F = createFont("Arial",48,true);
 shape(A,125,125,value,value);
 
  textFont(F);
 textAlign(CENTER);
  fill(C);
  text("COW",250,50);
  text("click your mouse",250,400);

 
}
void mouseClicked() {
  if (value == 0) {
    value = 250;
  } else {
    value = 0;
  
  }
  if (C ==255){
     C = 0;
  }else{
    C= 255;
  }
}


void C9(){
  logo=loadImage("play_1.jpg");
logo.filter(GRAY); 
logo.filter(THRESHOLD,0.4); 
size(800,800);
glow=createGraphics(width,height);
frameRate(24);
loc.add(mov);
if (loc.x < 0) { mov.x *= -1;}
if (loc.x > width) { mov.x *= -1;}
if (loc.y < 0) { mov.y *= -1;}
if (loc.y > height) { mov.y *=-1;}

glow.beginDraw();
for(int i = 0; i < width; ++i) {
for(int j = 0;j < height; ++j) {
if(logo.get(i,j)==color(0)){ 
glow.set(i,j,color(0)); 
}else{ //
distance=(dist(i,j,loc.x,loc.y));
distance=10000/distance;
color cl=color(distance,0,0);
glow.set(i,j,cl); 
} 
}
}
glow.endDraw();

image(glow,0,0);

}

  



