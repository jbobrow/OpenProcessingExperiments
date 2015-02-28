

void setup(){
  size(350,700);
  smooth();


  
  
}
 

 
  void draw(){
  background(0);


     stroke(#3A4DA5);
  for(float i = 2; i < 200; i ++){
    pushMatrix();
    strokeWeight(0.1); 
    noFill();
    translate(300, 170);
    scale(4.5, 4.5);
     rotate(radians(i*5));
  skewX(PI/4.0);
rect(0, 0, 30, 30);


    popMatrix();
  }
    
    stroke(#33AD64);
  for(float i = 2; i < 200; i ++){
    pushMatrix();
    strokeWeight(0.1); 
    noFill();
    translate(300, 170);
    scale(4, 4);
     rotate(radians(i*4));
  skewX(PI/4.0);
rect(0, 0, 30, 30);


    popMatrix();
  }
    
  


  stroke(#83E389);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    translate(100, 450);
    scale(1,1);
     rotate(radians(i*5));
curve(5, 26, 5, 26, 73, 24, 73, 61);

    popMatrix();
  }
  
  stroke(#0F85FF);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    translate(100, 450);
    scale(2,2);
     rotate(radians(i*5));
curve(5, 26, 5, 26, 73, 24, 73, 61);

    popMatrix();
  }
  
      stroke(#2471D3);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
    strokeWeight(0.7); 
    noFill();
    translate(100, 450);
    scale(1,1);
     rotate(radians(i*5));
  bezier(185, 120, 100, 100, 190, 190, 150, 180);
    popMatrix();
  }
  
  stroke(#16C4C2);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
    strokeWeight(0.7); 
    noFill();
    translate(100, 450);
    scale(0.6,0.6);
     rotate(radians(i*5));
  bezier(185, 120, 100, 100, 190, 190, 150, 180);
    popMatrix();
  }
  
  }

