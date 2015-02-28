
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: you chahee
// ID: 201420092

void setup(){
size (1024, 768);
smooth();
noLoop();
}

void draw(){
   for (int i = 0; i < 1024; i = i +110) {
    for (int j = 0; j < 768; j = j +110) {
 
 
        
    
      
      fill(#BFB5C7,500);
      noStroke();     
      rect(i-40, j-30, 30, 150);
  
      fill(#2F2C67);    
      rect(i+5, j+30, 50, 50);
      
      fill(#614A73,500);   
      rect(i-20, j-10, 120, 20);
      
      stroke(255);
      strokeWeight(2);
      fill(#BFB5C7,500);
      ellipse(i-50, j-3, 50, 50);
 
      
      noStroke();
      fill(#3A3763);
      ellipse(i-50, j-3, 30, 30);
 
      fill(255);
      ellipse(i, j+50, 50, 50);
      
      fill(0);
      ellipse(i, j+50, 30, 30);
      
      fill(255);
      ellipse(i, j+50, 10, 10);
 
     
     
     
    }
  }
}

void keyPressed(){
background(0);
redraw();
} 
