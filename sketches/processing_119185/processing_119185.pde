
void setup(){
 
 size (500,500);
 
 background(0);
 
 pushMatrix();
 
 translate(50,50);
 rect (0,0,50,5);
 
  translate(0,50);
 rect (0,0,50,5);
 
  translate(0,50);
 rect (0,0,50,5);
 
  translate(0,50);
 rect (0,0,50,5);
 
  translate(0,50);
 rect (0,0,50,5);
 
  translate(0,50);
 rect (0,0,50,5);
 
  translate(0,50);
 rect (0,0,50,5);
 
  translate(0,50);
 rect (0,0,50,5);
 
  translate(0,50);
 rect (0,0,50,5);
 
 popMatrix();
 resetMatrix();
 
 pushMatrix();
 
 translate(150,50);
 rect (0,0,50,5);
  
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 popMatrix();
 resetMatrix();
 
 pushMatrix();
 
 translate(250,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 popMatrix();
 resetMatrix();
 
 pushMatrix();
 
 translate(350,50);
 
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 translate(0,50);
 rect (0,0,50,5);
 
 popMatrix();
 resetMatrix();
 
 
}

void draw()
{
     
  pushMatrix();
   
 translate(375,50);
     
    float drehen= map(mouseY,5,250,3500,1.5*PI);
     
    rotate(drehen);
     
           
     
    fill(200,100,47);
    
    rectMode(CENTER);
    rect(0,0,50,5);
   
  popMatrix();
  resetMatrix();
  
  pushMatrix();
  translate (175,203);
  rotate(drehen);
  rectMode(CENTER);
  rect(0,0,50,5);
  
  popMatrix();
}
