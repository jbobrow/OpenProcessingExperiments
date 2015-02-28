
void setup() { 
  size(600, 600, P3D);  
} 
 
void draw() { 
  background(0);
  stroke(random(millis()/500)); 
  translate(200, 500, 0); 
  
  rotateX(millis()/100); 
  rotateY(millis()/100); 
  noFill(); 
  box(50);

sphere(255);
stroke(mouseX,mouseY,0,40); 
rotateX(mouseY * 0.005); 
  rotateY(mouseX * 0.005); 
  noFill(); 
  box(500);
  
  translate(500,490,30);
  stroke(second(),millis(),0,40); 
rotateX(second() * 0.010); 
  rotateY(second()* 0.010); 
  noFill(); 
  box(40);
  
  translate(200,490,100);
  stroke(pmouseX,mouseY,0,40); 
rotateX(second() * 0.010); 
  rotateY(second()* 0.010); 
  noFill(); 
  box(20); 
  
  
 sphere(255);
stroke(mouseX,mouseY,0,40); 
rotateX(mouseY * 0.005); 
  rotateY(mouseX * 0.005); 
  noFill(); 
  box(50);
 
  
 
 
}

