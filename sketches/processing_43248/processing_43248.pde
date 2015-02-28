
void setup(){
size(800,600,P3D);
background(0);
}

void draw(){

background(0);


pushMatrix();

translate(width/2, height/2);
lights();
noStroke();
fill(255,255,0);
rotateX(radians(frameCount));
rotateY(radians(frameCount));
sphere(100);

pushMatrix();

translate(130, 130, -70);
lights();
noStroke();
fill(237,30,121);
rotateX(radians(frameCount));
rotateY(radians(frameCount));
sphere(50);

translate(50, 0, -50);
lights();
noStroke();
fill(0,146,69);
rotateX(radians(frameCount*10));
rotateY(radians(frameCount*10));
sphere(20);

popMatrix();

popMatrix();

}

