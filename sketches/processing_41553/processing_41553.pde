
void setup() {
  size(650, 750);
}

void draw() {
  float col= random (0, 255);
  background(0); 
  noStroke();
  smooth();
  

  float ang1 =  0.5 * (noise(millis()/200.0) - 0.5);
  float ang2 =  0.7 * (noise(millis()/101.0) - 0.5);
  float ang3 =  1.2 * (noise(millis()/ 313.0) - 0.5);
  float ang4 =  1.5 * (noise(millis()/20000.0) - 0.5);
  float ang5 =  1.7 * (noise(millis()/501.0) - 0.5);
  float ang6 =  0.2 * (noise(millis()/ 313.0) - 0.5);
  float noiseValue = noise( (millis()+34567)/1212.1  );
  float noiseScale = map(noiseValue, 0,1,  0.75, 2.0); 

//right arm
  pushMatrix();
  translate(375, 175);
  rotate( ang1 );
  fill (255, 255, 255, 175);
  rect(0, 0, 70, 70); 

  translate(50, 60); 
  rotate( ang2 );
  fill (255, 255, 255, 220);
  rect(0, 0, 50, 150); 

  translate(25, 125); 
  rotate( ang3 );
  fill (col);
  rect(0, 0, 50, 50);
  popMatrix();

//left arm
  pushMatrix();
  translate(150, 175);
  rotate( ang4 );
  fill (255, 255, 255, 200);
  rect(0, 0, 70, 70); 

  translate(-25, 50); 
  rotate( ang5 );
  fill (255, 255, 255, 90);
  rect(0, 0, 50, 150); 

  translate(-25, 125); 
  rotate( ang6 );
  fill (col);
  rect(0, 0, 50, 50);
  popMatrix();
  
  //body/neck
  fill (255, 255, 255, 200);
  rect (200, 200, 200, 200);
  fill (255, 255, 255, 100);
  rect (275, 170, 40, 75);
  
  //head
  pushMatrix();
  translate (240, 70); 
  scale ( noiseScale);
  fill (255, 255, 255, 125);
  rect (0,0, 100,100); 
  popMatrix(); 
  
  //right leg
  pushMatrix();
  translate(300, 390);
  rotate( ang1 );
  fill (255, 255, 255, 235);
  rect(0, 0, 70, 70); 

  translate(50, 60); 
  rotate( ang2 );
  fill (255, 255, 255, 50);
  rect(0, 0, 50, 200); 

  translate(25, 175); 
  rotate( ang3 );
  fill (col);
  rect(0, 0, 75, 40);
  popMatrix();
  
  //left leg
  pushMatrix();
  translate(225, 390);
  rotate( ang4 );
  fill (255, 255, 255, 60);
  rect(0, 0, 70, 70); 

  translate(-25, 60); 
  rotate( ang5 );
  fill (255, 255, 255, 210);
  rect(0, 0, 50, 200); 

  translate(-50, 175); 
  rotate( ang6 );
  fill (col);
  rect(0, 0, 75, 40);
  popMatrix();
}



                
                                                                
