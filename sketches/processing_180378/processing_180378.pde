
float a = 0;
float b=0;
float c=0;
 
void setup(){
 
size(800, 800,P3D);

}
 
void draw(){
   
  translate(width/2, height/2); //Position from centre
  scale(c); //Change scale of triangle
  background(255); //Background is drawn in each loop to prevent previous positions being shown
  rotateZ(a);
  stroke(a,3,0);
  strokeWeight(3);
  triangle(-10,-150,-150,75,150,75);
  
  pushMatrix();
  translate(width/4+b, height/4+a); //Change distance from origional triangle
  scale(c); //Change scale of triangle
  rotateZ(a);
  stroke(a,3,0);
  strokeWeight(3);
  triangle(-10,-150,-150,75,150,75);
  
  popMatrix();
  translate(width/8+a, height/8+b); //Change distance from origional triangle
  scale(c); //Change scale of triangle
  rotateZ(a);
  stroke(a,3,0);
  strokeWeight(3);
  triangle(-10,-150,-150,75,150,75);
  
  
 
a=a+0.1;
b=b+0.2;
c=c+0.001;

 
 
}



