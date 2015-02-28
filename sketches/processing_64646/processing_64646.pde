
size (200,200);
background (255);
strokeWeight (5);
smooth();
float space = 15;

for (float x = 0; x < 200; x = x+space) {
  for (float y = 0; y < 200; y = y+space) {
    if(x<20||y>180){
      x = x + space * 2;
    
    }else{
       x = x + space * 1;
       }
      
       point(x, y);
  }
}

