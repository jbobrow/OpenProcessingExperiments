
size(500, 500);
float step = width/50;
float abstand = 0;
background(255, 255, 255);


smooth();
fill(25, 50, 0);
noStroke();
for (float x = 0; x < width; x=x+step) {
  for (float y = 0; y < height; y=y+step) {

    if (random(0, 10) < 5) {
     abstand = random(-7,-70);    
    } 
    
    else {
      abstand = random(17,60);    
    }
        ellipse (x + abstand, y, step, step);

  }
}


