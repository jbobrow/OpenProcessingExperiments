
void setup() {size(500,500);}
 
int x=0;
int z=0;
int speed=1;

void linEs(int i, int z){
  float red=random(200,255);
  float f=random(500);
  float k=random(500);
  float w=random(400);
  float o=random(50);
  float linea=random(500);
   float lineb=random(500);
  
background(255);
smooth();
frameRate(18);
for(int i=0; i<500; i=i+10){
     stroke(0,o);
     strokeWeight(.1);
   line(0,0,linea,lineb);
   line(0,0,f,k);
   line(0,0,k,w);
   line(0,0,k,f);
   line(0,0,w,linea);
   line(0,0,linea,f);
      line(500,500,linea,lineb);
   line(500,500,f,k);
   line(500,500,k,w);
   line(500,500,k,f);
   line(500,500,w,linea);
   line(500,500,linea,f);
fill(red,200,200);
noStroke();
ellipse(250,250,z,z);
  z=z+speed;
  if (z>500){
    z=z*-1;
  }
  else {
  z=z;
 }
 }
 }
 
 void draw(){
linEs(100,200)
}
