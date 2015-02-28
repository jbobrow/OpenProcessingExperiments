
size(500, 500);
float space = 5;
smooth();
float moon = 0; 
 
 
for(float x = 0; x < width;x = x + space){
  for(float y = 0; y < height; y = y + space){
    fill(moon);
    rect(x,y,space, space);
    moon = moon + random(10);
    if(moon > 255)moon = 0;
    
    }
  
    }

saveFrame("thumbnail.png");






