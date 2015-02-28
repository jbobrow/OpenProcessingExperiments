
// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: shin yeon sik
// ID: dnmys11



float angle=4; 



void setup(){ 
  size(600,600); 
  background(255); 
  colorMode(HSB, width); 
} 


void draw(){ 
  noStroke(); 
  fill(0,100); 
  rect(0,0,width,height); 


  angle += 0.01; 


    



  translate(width/2,height/2); 


  scale(0.2); 


 


  for (int i=0; i<width; i+=40){ 


    for (int j=0; j<height; j+=40){ 


    rotate(-angle/1); 


      


    pushMatrix(); 


    stroke(600,300);     


    strokeWeight(i/60);  


    fill(100);           


    translate(i,j);    


    rotate(angle*6); 


    scale(2); 


  
      pushMatrix(); 


      for (int k=0; k<width; k+=40){ 


        noStroke(); 


        fill(i,200,200); 


        translate(100,100); 


        rotate(-angle/1); 


        scale(0.95); 


        rect(500,100,20,20); 


      } 


      popMatrix();      


    popMatrix(); 


    } 


  } 


} 
 

