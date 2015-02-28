
PImage img;

void setup(){
size(600,600,P3D);
 
}
 
int m = 0;
 
void draw(){
  img= loadImage ("Space_Deep.jpg");
 background(img);
 
 camera(width, height, -700, width/2, height/2, -50, 0, 1, 0); 
 
lights();
 translate(width/2,height/2,-100);
 noStroke();
 translate(0,0,0);
 fill(255,255,0);
 sphere(90);
 
  
  
  //earth
pushMatrix();
 noStroke();
 rotateY(frameCount*PI/3*0.07);
 translate(250,0,0);
 fill(0,0,255);
 sphere(20);
 rotateZ(m*-PI/6*0.05);
 
 m++;
 
 
  
    //moon
  noStroke();
  fill(150);
  translate(50,10,0);
  sphere(10);
  rotateY(frameCount*PI/2*.1);
  popMatrix();
  
}


