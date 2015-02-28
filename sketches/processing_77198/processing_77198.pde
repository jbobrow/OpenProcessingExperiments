
void setup() {
size(800,800,P3D);
stroke(255,255,0);
strokeWeight(1);
colorMode(RGB,1);
fill(0.4);
}

void draw() {
background(0);
translate(width/2,height/2);
rotateY(map(mouseX, 0,width, -PI,PI));
rotateX(map(mouseY, 0,height, -PI,PI));
lightSpecular(1,1,1);
directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
float s = mouseX/ float(width);
specular(s,s,s);
sphere(200);
}
