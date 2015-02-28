
//Code based off example below
//http://openprocessing.org/sketch/119309

void setup()
{
  size(500, 500); 
  
  background(0);
  fill(255);
  noStroke();
  rect(100,0,300,500);
  stroke(0);
  line(100,0,150,75);
  line(150,75,250,0);
  line(250,0,350,75);
  line(350,75,400,0);
  strokeWeight(5);
  stroke(255,255,255,40);
  line(0,0,100,500);
  line(500,0,400,500);

} 
 
void draw()
{
  textSize(25);
 
  pushMatrix();
  fill(255, 0, 0); 
  translate(30,100);
  text("Filipino", 0, 0);
  rotate(radians(10));
  popMatrix();
      
  pushMatrix();
  translate(145,100);
  rotate(radians(45)); 
  text("Chillaxed", 0, 0);
  popMatrix();
   
  pushMatrix();
  translate(350,100);
  text("Musical", 0, 0);
  popMatrix();
   
  pushMatrix();
  translate(265,180);
  rotate(radians(-45));
  text("Simplest", 0, 0);
  popMatrix(); 
  pushMatrix();
  translate(250,250);
  rotate(radians(45)); 
  text("Graphic", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(450,110);
  rotate(radians(90)); 
  text("Artistic", 0, 0);
  popMatrix();
 
  pushMatrix();
  translate(450, 225);
  rotate(radians(90)); 
  text("DePaul", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(30,110);
  rotate(radians(90)); 
  text("Leadership", 0, 0);
  popMatrix(); 
  
  pushMatrix();
  translate(30,250);
  rotate(radians(90)); 
  text("Classy", 0, 0);
  popMatrix(); 
   
  pushMatrix();
  translate(30,350); 
  text("Creative", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(350,350); 
  text("Design", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(155,350);
  rotate(radians(-45));  
  text("Community", 0, 0);
  popMatrix(); 
    
}


