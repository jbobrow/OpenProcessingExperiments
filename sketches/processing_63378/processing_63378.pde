
size(300, 300);
smooth();
background(255);
  
strokeWeight(10);
stroke(0);

float space = 30;
  
for (float y = 30; y <= height - 30; y = y + space) {
  for (float x = 30; x <= width - 30; x = x + space) {
     point(x,y);
     
     if ( random(100) > 50) {
       space = random (10, 50);
    }else{
      space = random (70,100);
    }
  }
}


