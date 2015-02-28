
void setup () {
  size(500,500);
  background(255,255,255);
}
  


void draw () {
    
  
  if(key=='1')
  if (mousePressed) {
      line(pmouseX, pmouseY, mouseX, mouseY);
}



if(key=='2')
if(mousePressed){
    stroke(random(0, 255), random(0, 255), random(0, 255));
    strokeWeight (1);
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(mouseX, mouseY,50,50);
   }
  
  
  
  
  if(key=='3')
  if(mousePressed){  
   stroke(#2A16F0);
      strokeWeight (5);
      fill (#6EE8C2);
      ellipse (mouseX,mouseY,random(0,10),random(0,10));
      ellipse (mouseX+random(10,15),mouseY+random(10,15),random(0,5),random(0,5));
      
    stroke(#6ECEE8);
      strokeWeight (1);
      fill (0,0,0,30);
      ellipse (mouseX,mouseY,random(0,20),random(0,10));
      ellipse (mouseX,mouseY,random(15,20),random(10,20));
    
      
}  

 if(key=='c'){
      fill(255,255,255,255);
      rect(0,0,500,500);
 }
  
 
}

