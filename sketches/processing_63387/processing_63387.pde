
size(300, 300);
smooth();
background(152,206,187);


 for (float y = 30; y <= height - 30; y = y + 30) {
  for (float x = 30; x <= width - 30; x = x + 30) {
    
    if (random (100) > 40) {
       strokeWeight(30);
       stroke(255, random (20,100));
     point(x,y);
    }else{
      noStroke();
      fill(255, random(20,100));
      rectMode (CENTER);
      rect (x,y,50,50);
    }

  }
}


