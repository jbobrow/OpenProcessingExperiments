
void setup() {
  size(500, 500,P3D);

  
}

void draw() {
background(0);
  translate(0,0,-500);
  translate(width/2,height/2);
  rotateX(radians(50));
  rotateZ(frameCount/100.0);
  translate(-width/2,-height/2);
  

  
      pushMatrix();
      fill(255, 0, 0);
      box(40,40,second()*10);
      popMatrix();
      
    
      
      pushMatrix();
      fill(255, 0, 0);
      translate(10,-70,100);
      textSize(32);
      text(second(),50,75);
      popMatrix();
      
      
      

      pushMatrix();
      fill(0, 255, 0);
      translate(60,60,0);
      box(40,40,minute()*10);
      popMatrix();
      
    
      
      pushMatrix();
      fill(0, 255, 0);
      translate(50,0,100);
      textSize(32);
      text(minute(),50,75);
      popMatrix();  
     
      pushMatrix();
      fill(0, 0, 255);
      translate(120,120,0);
      box(40,40,hour()*10);
      popMatrix();
      
    
      
      pushMatrix();
      fill(0, 0, 255);
      translate(100,50,100);
      textSize(32);
      text(hour(),50,75);
      popMatrix();  
      
}
