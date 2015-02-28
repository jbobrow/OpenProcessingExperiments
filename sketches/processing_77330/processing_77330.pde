
void setup(){
size(600, 600, P3D);
}

void draw(){
background(0);
fill(255,100,0,15);
noStroke();
translate(width/2, height/2);

rotateY(frameCount * 0.01);
for (int i = 0; i < 30; i+=1){
rotateX(frameCount * 0.0008);
rotateZ(frameCount * 0.0006);
box(mouseX + i);
  

}
}


