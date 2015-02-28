
/*
Brett Bixler
I310
Lesson 6 Project

I had the idea to take the cube or box from the quads work and
put objects inside it that are moving around in a pattern
you could rotate with the mouse,
like your looking at objects inside a container or something.

Move the mouse and the objects shift X Y coords. Java just died on
this lab computer so idk if the cube shifts or not with the
mouse inputbut it SHOULD. 
*/

 SpiningCube[] spiningCubes; 
 void setup() {
 translate(width/2, height/2);
 size(700,700, P3D); 
 spiningCubes = new SpiningCube[10]; 
 for (int i = 0; i < spiningCubes.length; i ++ ) { 
 spiningCubes[i] = new SpiningCube(random(-50,50),random(-50,50), random(15,50)); 
 } 
 } 
 void draw() { 
 background(0);
 translate(width/2, height/2);
 stroke(255);
 noFill();
 //box(350,350,350);
 rotateX(PI*mouseY/height);
 rotateY(PI*mouseX/width);
 box(350,350,350);
 rotateX(PI*mouseX/width);
 rotateY(PI*mouseY/height);
 box(150,150,150);
 for (int d = 0; d < spiningCubes.length; d++ ) { 
 spiningCubes[d].thetaSpeed(); 
 spiningCubes[d].display();
 //println(n);
 } 
 } 
  
 class SpiningCube { 
 float x,y; 
 float theta; 
 float speed;
 //float Size;
 float time = 0.0;
 float increment = 0.001;
 SpiningCube(float tempX, float tempY, float tempSize) { 
 x = tempX; 
 y = tempY; 
 theta = 0;
 speed = random(-0.01,0.01);
 //Size = tempSize;
 
 
 } 
  
 void thetaSpeed() { 
 theta += speed; 
 time += increment;
 } 

 void display() { 
 stroke(255); 
 fill(255,0,0);  
 pushMatrix(); 
 float n = noise(time)*(width/8);
 translate(x,y); 
 rotateX(PI*mouseY/height);
 rotateY(PI*mouseX/width);
 rotate(theta);
 ellipse(100,100,n,n);
 println(n);
 time += increment;
 box(x/2,y/2,n);
 popMatrix(); 
 } 
 }




