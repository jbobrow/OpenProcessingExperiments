
int x;
int angle;

void setup(){

colorMode(HSB,360);
rectMode(CENTER);
size(400,400,P3D);
noStroke();
fill(360);
angle=18;
x=4;
}



void draw(){
  background(360);
  translate(200,200);
 
  
for(int i=0; i<360; i++){
  fill(i*6,360,360);
  rotateY(radians(mouseX));
  pushMatrix();
rotate(radians(i*angle));
translate(i*x,0);
   rotateX(radians(mouseX));
box(10);
stroke(10);
popMatrix();
}
}

