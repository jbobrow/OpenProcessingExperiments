
float x;
float y;float x1;float y1;
float r=0;int t=50;float u;
void setup(){
size(400,400,P3D);
colorMode(HSB);

x=0;
y=0;
y1=0;
x1=0;
background(0);
}

void draw(){
noStroke();
fill(0,0,0,2);
rect(0,0,width,height);
y=sin(radians(x1))*r;
x=cos(radians(y1))*r;
translate(200,200,0);
fill(u,255,255);

ellipse(x,y,t,t);

y1+=5;
x1+=5;
u+=5;
u=u%255;
r++;
if (r>300){
r=-r;
}
}


void mousePressed(){
noLoop();



}
void mouseReleased(){
  
  loop();
}

