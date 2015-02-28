

void setup()
{
  size(500, 500);
  background(255, 255, 255);
  smooth();
}

void draw()
{
  background(0);

  
  for (int i = 0; i<700; i = i+30) {
    noStroke();
    for (int j=0; j<700; j= j +30)
    { 
      fill(255);
        pushMatrix();
         //translate(250,-200);
         float distance = dist(i,j, pmouseX, pmouseY); 
         //float distanceY =dist(j,mouseY);
     //rotate(radians(45));  
        rectMode(CENTER);
        
          
          
          rect(i, j, 10+(distance-100), 10+(distance-100));
         


   

//int x = dist(pmouseX);
//int y = dist(pmouseY);


    
    popMatrix();
    }
  }  
 
  
}         
                
