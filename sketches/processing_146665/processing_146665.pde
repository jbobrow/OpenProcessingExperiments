
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala
    
float angle;
float dia=80;
    
void setup()
{
  size(666,666);
  background(#325A7D);
}
    
void draw()
{
  noStroke();
  fill(#F05252);
  rect(0,0,width,height);
     
  // rotation angle
  angle += 0.002;
   
  fill(#FAEEB1); // white for all ellipses
   
  // move coordinate system
  translate(width/2,height/2);
   
  // arm of points 1
  pushMatrix();
  for (int i=0; i<70; i++){
    rotate(angle/2);
    scale(1.95);
    //fill(255,i,0);           
    ellipse(300,0,dia,dia);    
  }
  popMatrix();
   
  // arm of points 2
  pushMatrix();
  for (int i=0; i<70; i++){
    rotate(-angle/2);
    scale(1.95);
    //fill(255,i,0);        
    ellipse(300,0,dia,dia);  
  }
  popMatrix();
   
  // arm of points 3
  pushMatrix();
  for (int i=0; i<70; i++){
    rotate(angle/2);
    scale(1.95);
    //fill(255,i,0);          
    ellipse(-300,0,dia,dia);    
  }
  popMatrix();
   
  // arm of points 4
  pushMatrix();
  for (int i=0; i<70; i++){
    rotate(-angle/2);
    scale(0.95);
    //fill(255,i,0);           
    ellipse(-300,0,dia,dia);    
  }
  popMatrix();
   
  // arm of points 5
  pushMatrix();
  for (int i=0; i<70; i++){
    rotate(-angle/2);
    scale(0.95);
    //fill(255,i,0);           
    ellipse(0,300,dia,dia);    
  }
  popMatrix();
   
  // arm of points 6
  pushMatrix();
  for (int i=0; i<70; i++){
    rotate(-angle/2);
    scale(0.95);
    //fill(255,i,0);           
    ellipse(0,-300,dia,dia); 
  }
  popMatrix();
   
  // arm of points 7
  pushMatrix();
  for (int i=0; i<70; i++){
    rotate(angle/2);
    scale(0.95);
    //fill(255,i,0);  
    ellipse(0,300,dia,dia);
  }
  popMatrix();
   
  // arm of points 8
  pushMatrix();
  for (int i=0; i<70; i++){
    rotate(angle/2);
    scale(0.95);
    //fill(255,i,0);           
    ellipse(0,-300,dia,dia);    
  }
  popMatrix();
}
  
void mousePressed(){
  noLoop();
}
void mouseReleased(){
  loop();
}


