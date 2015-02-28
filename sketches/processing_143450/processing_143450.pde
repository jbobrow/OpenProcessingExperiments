
// SOS iDesign   
// KU DYNAMIC MEDIA   
//Park Hyebin 
//201420081

float cX=140;   
float direction=4; 

void setup()  
{    
  size(600, 600);   
  background(0);
 noLoop(); 
}   
void draw()  
{   

  background(#4374D9);   
  stroke(0, #B2EBF4);   

  fill(0, 600, cX, 70);     

  for (int i=40; i<width; i+=100) {   
    for (int j=40; j<height; j+=100) {   
      strokeWeight(random(4));   
      ellipse(i, j, cX, cX); 
    } 
  }      

  cX = cX + (3 * direction);      
  if ((cX<0)||(cX>350)) {   
    direction*=-50; 
  }   


} 

