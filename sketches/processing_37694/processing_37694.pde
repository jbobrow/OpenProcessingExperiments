

int distance = 50;
int distanceA = 150;

   
size(500,700);
 
background(225,88,93);
smooth();
noStroke();

 

for (int x=-height; x<=height; x=x+100)
{
  for (int y=-height; y<=height; y=y+100)
  {
    for (int j=0; j<=width && j<=height; j++) {
    fill(224,52,58,j*5);
      ellipse(((x +j*distance)-(j)), (j*distance)-(j), 8*j, 8*j);
       
       fill(255,255,255,j*10);
       
      
      noStroke();
      pushMatrix();
      rotate(radians(45));
       
     rect(((j*distanceA)-(j*12-100)),(x+j*distance)-(j*5), 10+(j*2), 10+(j*2));
      
     rect(((j*distanceA)-(j*12-100-45)),(x+j*distance)-(j*45), 15+(j*2), 15+(j*2));
      
     rect(((j*distanceA)-(j*12-100)-65),(x+j*distance)-(j*5), 5+(j*2), 5+(j*2));
 
       
      popMatrix();
       
       
       
    }
}
 
}


                
                                
