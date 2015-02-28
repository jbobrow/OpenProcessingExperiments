

 
void setup(){
size(500,500);
smooth();
background(255);
}
 
 
void draw(){
  noStroke();
  fill(0);
   rect(100,0,20,500);
   rect(0,100,500,20);
   rect(100,280,500,20);
   rect(350,350,500,20);
   rect(330,280,20,500);
   
   
  if (mousePressed && (mouseButton == LEFT)) {
 
    stroke(255);
    strokeWeight(25);
 line(mouseX, mouseY, pmouseX, pmouseY);
 
 
  if (keyPressed && key == 'r') {
   stroke(255,0,0);
    strokeWeight(25);
 line(mouseX, mouseY, pmouseX, pmouseY);   
      
    
   

    }
    if (keyPressed && key == 'b') {
   stroke(0,0,255);
    strokeWeight(25);
 line(mouseX, mouseY, pmouseX, pmouseY);   
      
    
   

    }
    
    if (keyPressed && key == 'y') {
   stroke(255,230,0);
    strokeWeight(25);
 line(mouseX, mouseY, pmouseX, pmouseY);   
      
    
   

    }
if (keyPressed && key == '0') {
   stroke(0);
    strokeWeight(25);
 line(mouseX, mouseY, pmouseX, pmouseY);     

}

}
  
}
                
                
