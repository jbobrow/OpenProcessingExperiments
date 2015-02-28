
import processing.opengl.*;
PShape alie;
 float radius= 50;
 float rotx =-PI/4;
 float roty=-PI/4;
float xPos=2;
float yPos=3 ;
float speed=0.4;
float xoff = 0.9;
float xincrement = 0.09;
PVector position, velocity;
void setup()
{
  

  size(600, 480, P3D);
 // alie =loadShape("alie.svg");
 //image(img,100,200);
 //noLoop();
 
 position= new PVector (100,100,100);
velocity= new PVector ( 200,100,300);
// frameRate(30);
}
 
void draw()
{
  background(random(255));

  beginShape(QUADS);
//shape(alie,width/2,height/2,100,100);
fill(255);
stroke(random(255));
strokeWeight(0.5);
  for(int x =200; x < 400; x += 10)
    for(int z = 0; z < 200; z += 10)
     {
       vertex(x,    300, z);
       vertex(x,    300, z+20);
       vertex(x+20, 200, z+20);
       vertex(x+20, 300, z);
     }
 endShape(QUADS);   
 
 
 beginShape(QUADS);

fill(255);
stroke(random(255));
strokeWeight(0.5);
  for(int x =100; x < 600; x += 10)
    for(int z = 0; z < 600; z += 10)
     {
       vertex(x,    300, z);
       vertex(x*100,    500, z+120);
       vertex(x+20,300, z+200);
       vertex(x+20, 300, z*900);
     }
 endShape(QUADS);   
 
 
  // image(img,100,200);
 
  fill(random(255),0,0);
 lights();
  noStroke();
  translate(width/8+40,height/7,mouseY*-PI);
  rotateX(rotx);
  rotateY(roty);
//rotx*= speed+2;

 // float n = noise(xoff)*width/PI;
  
  // With each cycle, increment xoff
//  xoff += xincrement;
//position.add(velocity*radius);
  sphere (radius);
  
 // position.add(velocity);
}
