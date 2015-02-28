
import processing.opengl.*;
PShape alie;
 float radius= 30;
 float rotx =-PI/4;
 float roty=-PI/4;
float xPos=2;
float yPos=3 ;
float speed=0.4;
float xoff = 0.0;
float increment = 0.02;
float zoff=0.0;
float zincrement=0.02;
PVector position, velocity;

void setup()
{
  

  size(600, 480, OPENGL);
 // alie =loadShape("alie.svg");
 //image(img,100,200);
 //noLoop();
 
 //position= new PVector (100,100,100);
 //velocity= new PVector ( 200,100,300);
 
 
 
 position= new PVector (100,100,100);
velocity= new PVector ( 200,100,300);

 frameRate(30);
}
  


 
 
 
 

 
void draw()
{
  
  saveFrame();
  background(random(255));
  
  
  
  
 
  
 beginShape(QUADS);
//shape(alie,width/2,height/2,100,100);
fill(255);
stroke(random(255));
strokeWeight(0.5);
  for(int x =200; x < 400; x += 10)
    for(int z = 0; z < 900; z += 10)
     {
       vertex(x,    200, z);
       vertex(x,    200, z+20);
       vertex(x+20, 200, z+20);
       vertex(x+20, 200, z);
     }
 endShape(QUADS);   
 
 
 beginShape(QUADS);

fill(255);
stroke(random(255));
strokeWeight(0.5);
  for(int x =200; x < 400; x += 10)
    for(int z = 0; z < 900; z += 10)
     {
       vertex(x,    300, z);
       vertex(x,    300, z+20);
       vertex(x+20, 300, z+20);
       vertex(x+20, 300, z);
     }
 endShape(QUADS); 
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
 

  
  
  fill(random(255),0,0);
 lights();
  noStroke();
  translate(width/8+80,height/7+150,mouseY*-PI);
  rotateX(rotx);
  rotateY(roty);
//rotx*= speed+2;

 // float n = noise(xoff)*width/PI;
  
  // With each cycle, increment xoff
//  xoff += xincrement;
//position.add(velocity*radius);
  sphere (radius);
  
 
  // image(img,100,200);
 
  fill(random(255),0,0);
 lights();
  noStroke();
  
  float cameraY = height/2.0;
  float fov= mouseX/ float(width)*PI/2;
  float cameraZ= cameraY / tan ( fov/2.0);
  float aspect=float (width)/float(height);
  
  if(mousePressed){
    aspect=aspect/2.0;
  }
  
  perspective( fov, aspect,cameraZ/10.0, cameraZ*10.0);
  translate(width/2,height/2+2+10);
 // rotateX(rotx);
 // rotateY(roty);
//rotx*= speed+2;

  float n = noise(xoff)*width;
  
  // With each cycle, increment xoff
 // xoff += xincrement;

 
  
}
  

 // position.add(velocity);



