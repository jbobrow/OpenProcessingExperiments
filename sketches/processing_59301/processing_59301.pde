
//elizabeth ibarra
//used processing.com 
import processing.opengl.*;

float x, y, z,angle,a;

		
void setup() {
  size(700, 700, OPENGL,P3D);
  mouseClicked();   
  x = 0;
  y = 0;
  z = 0;
  angle = 0;
  background(0);
}



void draw() {
  
 x = cos(radians(angle)) * 50 + width/2;
  y = sin(radians(angle)) * 50 + height/4;
z = cos(radians(angle)) *100 + 400;
  



  
  pushMatrix();
  smooth();
  stroke(3,250,248);
  translate(300,z,x);
  rotateY(a*2);
  fill(z,y,134);
  box(100);
  popMatrix();
  
  pushMatrix();
  smooth();
  background(0);
  noStroke();
  background(0);
  fill(39,214,37);
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 0, 0, -1);
  translate(20, x, 0);
  specular(39,214,37);
  translate(400, y); 
  rotateY(a);
  box(200);
  popMatrix();

  pushMatrix();
  translate(500,x,200); 
  rotateY(a*3);

  box(50);
  popMatrix();
  
   pushMatrix();
  translate(500,x,300); 
  
  rotateY(a*4);
  box(130);
  popMatrix();
  
  pushMatrix();
  translate(500,x); 
  rotateY(a/2);
  box(30);
  popMatrix();
  
  pushMatrix();
  translate(20,y*2,-600); 
  rotateY(a*5);
  box(300);
  popMatrix();
  
   pushMatrix();
  translate(40,y/2,z); 
  rotateY(a*2);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(300,y*3,40);
  fill(x,y,z); 
  rotateY(a*5);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(600,z*3,300); 
  rotateY(a*3);
  box(170);
  popMatrix();
  
  pushMatrix();
  translate(0,y+30,x); 
  rotateY(a*7);
  box(40);
  popMatrix();
  
  pushMatrix();
  translate(90,y+100); 
  rotateY(a*4);
  box(70);
  popMatrix();
  
    pushMatrix();
  translate(300,y+50); 
  rotateY(a*2);
  box(90);
  popMatrix();
  
  pushMatrix();
  translate(600,y); 
  rotateY(a*7);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(190,z); 
  rotateY(a*4);
  box(10);
  popMatrix();
  
   pushMatrix();
  translate(300,y*4); 
  rotateY(a*6);
   fill(x,y,269);
  box(60);
  popMatrix();
  
  pushMatrix();
  translate(300,x); 
  rotateY(a*2);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(200,y*2); 
  rotateY(a*5);
  box(30);
  popMatrix();
  
   pushMatrix();
  translate(350,x); 
  rotateY(a*6);
  box(15);
  popMatrix();
  a += .001;
  angle++;
  
    
  pushMatrix();
  translate(300,y*3,40); 
  rotateY(a*5);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(600,z*3,300); 
  rotateY(a*3);
  box(170);
  popMatrix();
  
  pushMatrix();
  translate(0,y+30,x); 
  rotateY(a*7);
  box(40);
  popMatrix();
  
  pushMatrix();
  translate(90,y+100); 
  rotateY(a*4);
  box(70);
  popMatrix();
  
    pushMatrix();
  translate(300,y+50); 
  rotateY(a*2);
  box(90);
  popMatrix();
  
  pushMatrix();
  translate(600,y,-200); 
  rotateY(a*7);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(190,z,x); 
  rotateY(a*4);
  box(100);
  popMatrix();
  
   pushMatrix();
  translate(300,y*4,100); 
  rotateY(a*6);
  box(60);
  popMatrix();
  
  pushMatrix();
  translate(300,z*3,-200); 
  rotateY(a*2);
  box(70);
  popMatrix();
  


  pushMatrix();
  translate(100,y*2,-20); 
  rotateY(a*5);
  box(40);
  popMatrix();
  
   pushMatrix();
  translate(150,z,100); 
  rotateY(a*6);
  box(25);
  popMatrix();
  
  

}



