
void setup(){
size(400,400,P3D);
}

void draw(){
background(200);
stroke(25,50,200);
strokeWeight(2);
translate(200,200,0);
rotateX(mouseY * 0.05);
rotateY(mouseX * 0.05);
fill(mouseX *2, 0, 160);
sphereDetail(mouseX,4);
sphere(100);
}
