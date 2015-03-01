
void setup(){
size(500,500);background(20);
}
//lines
void draw(){
  frameRate(10);
for(int i=0; i<500; i=i+40){
  for(int x=0; x<500;x=x+40){
    float r = random(400);
float l = random(255);
float m = random(200);
float n = random(240);
stroke(l,m,n);
noFill();
line(250,250,i,x); 
}
}

//ellipses
frameRate(20);
for(int i=0; i<350; i=i+3)
{ float r = random(300);
float l = random(100);
float m = random(200);
float n = random(255);
float z = random(40);
noStroke();
fill(l,m,n,z);
ellipse(250,250,i,r); 
}
frameRate(40);
for(int i=0; i<350; i=i+3)
{ float r = random(300);
float l = random(100);
float m = random(200);
float n = random(255);
float z = random(40);
stroke(l,m,n);
noFill();
ellipse(250,250,i,r);
}
}
