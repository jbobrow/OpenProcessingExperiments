
void setup() { 
  size(1000, 800);
  background(255); 
 
  smooth();
}
  
void draw() {  
 frameRate(2000);
  if(mousePressed == true ) { 
    fill(random(10,550), random(10,100), random(10,100));
    
   
    noStroke();
    rect(mouseX+random(300,100), mouseY+random(108,100), 10, 10);
    ellipse(mouseX-random(300,100), mouseY-random(108,100), 10, 10);
    ellipse(mouseX+random(800,100), mouseY-random(10,100), 10, 10);
  }
  else {
     
  }
 
 
 
 
}
 
void keyPressed(){
  
   if(key=='s'){
  background(255);
   }
 
   
 
 
   
}

