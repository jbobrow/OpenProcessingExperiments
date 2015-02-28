

float speed_x = 0.01;
float speed_y = 0.01;
float speed_z = 0.01;

 

void setup () {
  size(800,600,P3D);      
  background(255,255,255);
  translate (400,300,0);
  pushMatrix();
  smooth();
  
  
 
}





void draw(){

  
popMatrix();





if (keyPressed == true || mousePressed == true){

  speed_x = -random(5)/100;
  speed_y = -random(5)/100;
  speed_z = -random(5)/100;
  
}

rotateX((speed_x));
rotateY((speed_y));
rotateZ((speed_z));


background(0);
stroke(100);
strokeWeight(1); 
noFill();
for(int i=3;i<=300;i += 20){

  box(i);

}
pushMatrix();
}





