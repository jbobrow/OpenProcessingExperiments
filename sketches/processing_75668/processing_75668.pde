
import processing.opengl.*;

float inc =1;


void setup(){
  noStroke();
size(1200,600,OPENGL);//OPENGL for 3D stuff
}

void draw(){
  background(0);
 
  
 inc++;
  pushMatrix();
  fill(58,100,155);
  lights();
  translate(width/2,height/2);
 rotateX(inc);
  rotateY(inc);
  box(150);
   popMatrix();


inc++;
  pushMatrix();
  fill(88,100,155);
  lights();
  translate(width/2,height/2);
 rotateX(inc);
  rotateY(inc);
  box(150);
   popMatrix();
   stroke(255);
 
 inc+=0.1;
  pushMatrix();
  fill(15,15,15);
  lights();
  translate(mouseX,mouseY);
 rotateX(mouseX*20);
  rotateY(mouseY*20);
  box(50);
  popMatrix();
   stroke(255);
   
   
  rect(50,50,10,10);
  rect(100,100,20,20);
  rect(150,150,10,10);
   rect(200,200,10,10);
  rect(250,250,10,10);
  rect(300,300,10,10);
    rect(350,350,20,20);
 rect(400,400,10,10);
 rect(450,450,10,10);
 rect(500,500,20,20);
 rect(550,550,10,10);
 rect(200,550,10,10);
 rect(250,500,10,10);
 rect(300,450,20,20);
 rect(350,400,10,10);



}


void keyPressed(){
  if (key == 's') {
   save("margarettung.pde");
  }
  
}
