

 
void setup(){
  size(350,700);
  smooth();

}
  void draw(){
  background(0);
  stroke(255);
       
     stroke(#A39DFF);
  for(float i = 50; i < 80; i ++){
    pushMatrix();
    strokeWeight(0.1); 
    noFill();
    translate(300, 400);
    scale(6,6);
     rotate(radians(i*2));
    ellipse(0,0,12,60);
    ellipse(0,0,23, 70);
    popMatrix();
     
  }
  
  
 
  
    stroke(#9DEBFF);
  for(float i = 50; i < 80; i ++){
    pushMatrix();
    strokeWeight(0.1); 
    noFill();
    translate(300, 400);
    scale(6,6);
     rotate(radians(i*4));
    ellipse(0,0,12,60);
    ellipse(0,0,23, 70);
    popMatrix();
     
  }
  

        stroke(#FF9DE2);
  for(float i = 50; i < 80; i ++){
    pushMatrix();
    strokeWeight(0.1); 
    noFill();
    translate(400, 300);
    scale(5,5);
     rotate(radians(i*2));
   quad(80, 30, 80, 10, 69, 63, 160, 200);
    popMatrix();
     
  }
  
   stroke(#D677C9);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    translate(80, 50);
    scale(0.5,0.5);
     rotate(radians(i*3));
  triangle(40, 55, 40, 170, 87, 30);
    popMatrix();
  }
  
  
  
  stroke(#5B3F8E);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    translate(80, 50);
    scale(1, 1);
     rotate(radians(i*2));
  triangle(55, 40, 170, 40, 30, 87);
    popMatrix();
  }
  
  


  
  }

