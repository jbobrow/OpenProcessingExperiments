
//BIG RED BUTTON


void setup () {
  size (500, 500);
  smooth();
}


void draw () {
//  println (mouseX + " " + mouseY);
  
  background (255);
  translate (250, 250);
  
  if (mousePressed &&
      mouseX > width/2-100 &&
      mouseX < width/2+100 &&
      mouseY > height/2-40 &&
      mouseY < height/2+40) {
        
    cursor (HAND);
    
    fill (150, 0, 0);
    noStroke ();
    rect (-100, 40, 200, 10);
    
    stroke (1);
    arc (0, 50, 200, 80, 0, PI);
    
    fill (255, 0, 0);
    ellipse (0, 40, 200, 80);
    
    line (-100, 40, -100, 50);
    line (100, 40, 100, 50);  
    
  }else if (mouseX > width/2-100 &&
      mouseX < width/2+100 &&
      mouseY > height/2-40 &&
      mouseY < height/2+40) {
    
    cursor (HAND);
    
    fill (150, 0, 0);
    noStroke ();
    rect (-100, 0, 200, 50);
    
    stroke (1);
    arc (0, 50, 200, 80, 0, PI);
    
    fill (255, 0, 0);
    ellipse (0, 0, 200, 80);
    
    line (-100, 0, -100, 50);
    line (100, 0, 100, 50);
    
  }else{
    
    cursor (ARROW);
    
    fill (150, 0, 0);
    noStroke ();
    rect (-100, 0, 200, 50);
    
    stroke (1);
    arc (0, 50, 200, 80, 0, PI);
    
    fill (255, 0, 0);
    ellipse (0, 0, 200, 80);
    
    line (-100, 0, -100, 50);
    line (100, 0, 100, 50);
  }
}

