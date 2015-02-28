
//Alex Nelson

void setup(){
  size(600,200);
  stroke(30,120,250,50);
  background(10,150,0);
}

int i = 1; 
int j = 1;
void draw(){
  noFill();
  
  stroke(0);
  pushMatrix();
    translate(300,100); 
    rotate(radians(i));         
    translate(100,0);             
    rotate(radians(j + 100));     
    ellipse(10,100,100,50);       
  popMatrix();
  
  stroke(255,150,100);
   pushMatrix();
    translate(500,100); 
    rotate(radians(i));         
    translate(100,0);             
    rotate(radians(j + 100));     
    ellipse(10,50,100,50);       
  popMatrix();
  
   stroke(300,200,100);
   pushMatrix();
    translate(100,100); 
    rotate(radians(i));         
    translate(100,0);             
    rotate(radians(j + 50));     
    ellipse(10,50,100,50);       
  popMatrix();
  
  
  j+=10;
  i++;
}


