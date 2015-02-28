
size (400, 400);
background(150,240,130);
rectMode(CENTER);
 
translate(width/2, height/2); 
//moves origin to center of sketch

for (int x=0; x<width/3; x+=5) { 
  //spacing of ovals along x-axis
  for (int y=0; y<height/3; y+=5) { 
    //spacing of ovals along y-axis
    
    rotate(radians(45)); 
    //rotates each set of ovals around centerpoint
   
    fill(10+x,10+y,150); 
    rect(x,y,30,10);
    
    fill(150,240,130);
    ellipse(x,y,15,5);
        
  }
}

