
size(400, 700); 
background(0);

fill(0,238,255);
rect(0,640,50,50);
rect(55,640,50,50);
rect(110,640,50,50);
rect(165,640,50,50);

pushMatrix();
translate(165,0)
    fill(200,0,255);
    rect(55,640,50,50);
    rect(110,640,50,50);
    rect(165,640,50,50);
    translate(0,-55);
     rect(110,640,50,50);
popMatrix();


pushMatrix();
  
    
    rotate(radians(45));
    translate(100,70)
    fill(255,157,0);
    rect(300,300,50,50);
 
    rect(300,245,50,50);
   
    rect(300,190,50,50);
 
    rect(245,190,50,50);
   
popMatrix();


pushMatrix();
rotate(radians(45));
translate(400,100);
fill(255,255,0);
for(i = 0; i < 110; i+=55)
for(j = 0; j<110; j+=55)
    {
    rect(i,j,50,50)
    }

popMatrix();
  
