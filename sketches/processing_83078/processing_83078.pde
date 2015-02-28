
void setup(){
  size(600,600,P3D);
  background(0);
lights();
 
}
 
void draw(){
  background(255,100,0);
  lights();
  //noFill();
 noStroke();
     
 
  translate(300,300);//translate(100,300); //move the space 300x, 300y
  
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
// if(mouseX=0){rotateY(mouseX*0.01);}
   
  for (int i=0; i<100; i++){
  //  fill(mouseX * 2, 0, 160);
    sphere(90);
  translate(50,0,0);
 rotate(0.2);
 scale(.88);
   
  }
   
 
   
  //translate(200,0); //move the space 300x, 300y
 // box(100);
  //translate(200,0); //move the space 300x, 300y
 // box(100);
 
}
