
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: Park Hyebin 
 // ID: 201420081 

float angle;  
float xW =20;
float direction = 5;


void setup()  
{  
  size(600, 600);  
  smooth();
  background(#24A6BD);
}  

void draw()  
{  

  background(#1294AB);  
  // rotation angle  
  angle += 0.001;  
  strokeWeight(13);  
  stroke(#B2EBF4);  
  fill(0);   
  translate(width/2, height/2);    

  for (int i=0; i<70;i++) {  
    rotate(angle);
    scale(0.90);
    fill(#D1B2FF);
    random(75);
    line(0, 0, 700, 700);
    ellipse(0, 0, 30, 30);
  }
 for (int j = 10; j<0; j++){
   ellipse(0,0,50,50);
 }
 
} 

 


