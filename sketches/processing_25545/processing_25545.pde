
void setup(){
  size(350,700);
  smooth();

    
}
 
 
  void draw(){
  background(0);

 
   

  
    
     stroke(255, 204, 0);
  for(float i = 5; i < 85; i ++){
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    translate(300, 450);
    scale(3,3);
     rotate(radians(i*2));
  bezier(85, 20, 10, 10, 90, 90, 15, 80);
    popMatrix();

     

  }
  
   stroke(#F50C14);
  for(float i = 5; i < 85; i ++){
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    translate(310, 460);
    scale(3,3);
     rotate(radians(i*2));
  bezier(85, 20, 10, 10, 90, 90, 15, 80);
    popMatrix();

     

  }   
    
     stroke(#FA2C0D);
  for(float i = 5; i < 85; i ++){
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    translate(290, 440);
    scale(3,3);
     rotate(radians(i*2));
  bezier(85, 20, 10, 10, 90, 90, 15, 80);
    popMatrix();

     

  }
  
    
     stroke(#E30008);
  for(float i = 5; i < 85; i ++){
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    translate(100, 300);
    scale(3,3);
     rotate(radians(i*-1));
  bezier(85, 20, 10, 10, 90, 90, 15, 80);
    popMatrix();

     

  }
  
     stroke(255, 204, 0);
  for(float i = 5; i < 85; i ++){
    pushMatrix();
    strokeWeight(0.2); 
    noFill();
    translate(120, 330);
    scale(3,3);
     rotate(radians(i*-1));
  bezier(85, 20, 10, 10, 90, 90, 15, 80);
    popMatrix();

     

  }

  }

