
1420// SOS iDesign  
// KU DYNAMIC MEDIA  
// Park Hyebin
// 201420081

float cX=140;  
float direction=4;

void setup()  
{   
  size(640, 360);  
  background(0);
}  

void draw()  
{  
  background(cX);  
  stroke(0, cX);  
  fill(0, 100, cX, 40);    

  for (int i=50; i<width; i+=30) {  
    for (int j=50; j<height; j+=30) {  
      strokeWeight(random(5));  
      ellipse(i, j, cX, cX);
    }
  }    
  cX = cX + (1 * direction); 
  if ((cX<0)||(cX>200)) {  
    direction*=-1;
  }  
}

