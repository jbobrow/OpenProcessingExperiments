
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: JEONG Eunyeah <<------ Write your full name here!
 // ID: 201420106 <<--------- Write your ID here!

float cX=50; 
float direction=0;; 

void setup() 

{  
  size(600,600); 
  background(255); 
} 


void draw() 
{ 
  noStroke(); 
  fill(50,50,255); 
  rectMode(RIGHT); 
  rect(0,0,width,height); 

  stroke(0); 
  fill(20,230,cX,10); 



  for(int i=30; i<width; i+=60){ 
    for(int j=30; j<height; j+=60){ 

      strokeWeight(random(20)); 
      rectMode(CENTER); 
      rect(i,j,cX,cX); 
    } 


  } 

  cX = cX + (1 * direction); 
  
  if ((cX<0)||(cX>300)){ 
    direction*=-1; 

  } 

} 

void mousePressed(){ 
noLoop(); 
} 
void mouseReleased(){ 
  loop(); 
} 



