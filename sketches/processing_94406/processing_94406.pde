
import processing.opengl.*;

//PImage bg;
float theta;
float xa=0.0;
void setup() {
  size(600, 600, OPENGL);
 // bg=loadImage("bg.jpg");
   
  // if (mousePressed==true){
  //  background(bg);  
  //  tint(255,126);}
  
}

void draw() {
  lights();
 
  theta=map(sin(frameCount*random(5)), 0, 100, 0, 2*PI);
  translate(width/2, height-50, 10);
  branch(100);

  pushMatrix();
  translate(0, -100, 10);
  if (mousePressed==false){
 // fill(random(240,250),random(20,25), random(10,0));
 fill(30,50);}
  
  if (mousePressed==true){
 fill(255,100);}
  //(255,255,255,200);
  box(1000);
  popMatrix();
  
 
  
   
}



void branch(float len) {

 //  rotateX(radians(((mouseX/(float)width)*180)-90));
  // rotateY(radians(((mouseY/(float)height)*180)-90));
 
rotateY(radians(frameCount));


if (mousePressed==true){
  stroke(180, 77, 50, 100);
  strokeWeight(len/8);
  line(0, 0, 0, -len);}
  
 if (mousePressed==false){
  stroke(255,236,21, 100);
  strokeWeight(len/9);
  line(0, 0, 0, -len);}
  translate(0, -len, 10);



  

  if (len<=20) {
   // stroke(255, 10);
   stroke(30, 180, 50, 80);
    fill(30, 180, 50, 80);
    ellipse(0, 0, 10, 10);
 }


  if (len >8) { // no inf. loop

    pushMatrix();
    rotate(-theta*random(20, 100));
    branch(len*.5);
    popMatrix();

    pushMatrix();
    rotate(-theta*.7);
    branch(len*.75);
    popMatrix();


    pushMatrix();
    rotate(theta*noise(250, 200));
    branch(len*.75);
    popMatrix();
  }
}



