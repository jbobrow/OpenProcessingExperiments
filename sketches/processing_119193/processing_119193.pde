
void setup()
{ 
size(500,500);
background(50);
frameRate(20);
}

void draw() 
{ 
  fill(240); 
  noStroke(); 
  
  background(50);
  
  pushMatrix();
   rect(20,164,60,140); 
  
   translate(100,164); 
   rect(0,0,60,140);
  
   translate(160,0);
   rect(0,0,60,140);
  
   translate(80,0);
   rect(0,0,60,140);
  
   translate(80,0);
   rect(0,0,60,140);
  popMatrix();
  
  
  translate(180,164);
  pushMatrix();
  translate(mouseX/3,0);
  fill(150,160,255);
  rect(0,0,60,140);
  popMatrix();
  

}
