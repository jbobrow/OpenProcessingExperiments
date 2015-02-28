
//import processing.opengl.*;
//int w=screen.width/2;
//int w=512;
PGraphics f;
void setup(){
//size(w,w/3,P3D);
size(512,170,P3D);
//size(800,600,OPENGL);
f=createGraphics(width/2,height,P3D);
f.beginDraw();
f.background(255,0,0); 
f.endDraw();
smooth();
background(0);
}

void draw(){
 background(0);
f.beginDraw();
//f.rect(0,0,f.width,f.height);
f.strokeWeight(4);
f.stroke(255,255,0);
if (mousePressed) f.line(pmouseX, pmouseY, mouseX, mouseY);

//f.ellipse(mouseX, mouseY, 30,30);
f.endDraw();

pushMatrix();


translate(width/2.7*2, height*.5);
rotateX(frameCount*.01);
rotateY(frameCount*.01);
rotateZ(frameCount*.01);
scale(.5);
translate(-width/2/2,-height/2);
beginShape();
texture(f);
vertex(0,0,0,0);
vertex(width/2,0,f.width,0);
vertex(width/2,height,f.width, f.height);
vertex(0,height, 0,f.height);
endShape(CLOSE);
popMatrix();
image(f,0,0);
}

void keyPressed(){
f.background(255,0,0);
}

