
/* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: Gwangil Lee
 ID: 201420094
 */
 
import ddf.minim.*;

Minim minim;
AudioInput input;

void setup() { 
size(640, 600, P3D);
minim = new Minim (this);
input = minim.getLineIn (Minim.MONO, 512); }


void draw(){ 
   camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
float d = input.mix.level() * 200;
background(0); lights(); 
noStroke(); 

pushMatrix(); 
translate(100,height*2, 0); 
rotateZ(d+20);
fill(25,150,250);
popMatrix(); 

stroke(255); 
pushMatrix();   
translate(100,height*0.35, width/200); 
 if (mousePressed) {
    lights();}
fill(200);
sphere(50);
translate(400,height*0.35, 200); 
fill(25,150,250);
sphere(300);
fill(250,140,20);
sphere(30); 
popMatrix();

directionalLight(0, 255, 255, 10, -1, 20);
rotateX(d);  
translate(20, 50, 100); 
sphere(80); 
translate(width/2, width+2, -height); 
sphere(80);
sphere(100);
sphere(80);
}
