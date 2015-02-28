
PImage img;


void setup(){
  size (600,500, P3D);
 
}



void draw(){    
 
  
   img = loadImage("Processing_008.jpg");   
 image(img, 0, 0);
 filter(INVERT);
   filter(BLUR, 1);
 
  
 
 
       
  noFill();
  stroke(20, 252, 204, 150);
  translate(395,225,80);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  sphereDetail(mouseX / 10, 7); 
  // (number of segments used longitudinally per full circle revolutoin, number of segments used latitudinally from top to bottom)
  sphere(90);  //bigger sphere

 
  stroke(252,20,55, 80);
  rotateX(mouseX * 0.09);
  rotateY(mouseY * 0.09); 
  fill(mouseX * 2, 0, 160, 50);
  sphereDetail(mouseX / 6); //(number of segments (minimum 3) used per full circle revolution)
  sphere(65);  

  

  
  noFill();
  stroke(255,255,255, 60);    
  translate(30,30,150);
  rotateX(mouseX * 0.09);
  rotateY(mouseY * 0.09); 
  sphereDetail(mouseX / 6);
  sphereDetail(mouseY / 10);
  sphere(45);  
 
}



