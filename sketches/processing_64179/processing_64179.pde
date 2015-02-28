
size(700, 200);
background(255);
strokeWeight(4);
smooth();
 
float space = 3;
   
for (float y = 15; y <= height -15; y = y + space) {
  for (float x = 15; x <= width -15; x = x + space) {
     point(x,y);
      
     if ( random(100) > 50) {
       space = random (0, 10);
    }else{
      space = random (10,30);
    }
  }
}


