
float a = 0;
float b=0;
 
void setup(){
 
size(800, 800,P3D);

}
 
void draw(){
   
  translate(width/2, height/2);
  background(255); //Background is drawn in each loop to prevent previous positions being shown
  rotateZ(a);
  stroke(a,3,0);
  strokeWeight(3);
  triangle(-10,-150,-150,75,150,75);
  
  pushMatrix();
  translate(width/4, height/4);
  rotateZ(a);
  stroke(a,3,0);
  strokeWeight(3);
  triangle(-10,-150,-150,75,150,75);
  
  popMatrix();
  translate(width/8+a, height/8+a);
  rotateZ(a);
  stroke(a,3,0);
  strokeWeight(3);
  triangle(-10,-150,-150,75,150,75);
  
  
 
a=a+0.1;

 
 
}



