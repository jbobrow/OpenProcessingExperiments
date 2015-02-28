
void setup(){size(500,500,P3D);noFill();}
void draw(){
float n=noise(float(frameCount)/900);
stroke(0,n*255,n*255);
background(255);
translate(mouseX,mouseY);
for(int i=0;i<600;i+=4){
rotate(n*3);
box(i);
}}


