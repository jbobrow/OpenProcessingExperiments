
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: EOM Hyebin
 // ID:EOM HYE BIN 201420089


void setup(){
size (600, 600);
background(#D5FFAF);
smooth();
 }


void draw() { 


  for (int i = 20; i< width; i = i + 40) { 


    for (int j = 20; j< width; j = j + 40) { 

      noFill(); 
      rectMode(CENTER); 
      rect(i,j,20,20);
      strokeWeight(2); 
      stroke(25,152,49); 
      fill(0); 
      noFill(); 
     fill(255); 
      noFill(); 
      fill(255); 
      ellipse(i,j,10,10); 

     
     
      } 


  } 


} 
 

