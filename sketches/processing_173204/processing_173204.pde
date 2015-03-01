
void setup(){
size(600,600,P3D);
}
void draw(){
background(0);
lights();
pushMatrix();
translate(width/2, height*0.5, -200);
rotate(frameCount*0.01,0.1,1,0.1);
noFill();
stroke(100);
sphere(200);
popMatrix();

pushMatrix();
translate(width/2, height/2, 100);
rotate(frameCount*0.01,-1,-0.5,0.1);
stroke(255,40,100);
box(220);
popMatrix();

pushMatrix();
translate(width/2, height/2, 150);
stroke(255);
rotate(frameCount*0.01,0,0.1,0.1);
beginShape();
vertex(-50, -50, -50);
vertex( 50, -50, -50);
vertex(   0,    0,  50);

vertex( 50, -50, -50);
vertex( 50,  50, -50);
vertex(   0,    0,  50);

vertex( 50, 50, -50);
vertex(-50, 50, -50);
vertex(   0,   0,  50);

vertex(-50,  50, -50);
vertex(-50, -50, -50);
vertex(   0,    0,  50);
endShape();
popMatrix();

}


