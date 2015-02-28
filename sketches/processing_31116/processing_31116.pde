
float step;
int points = 3;
 
void setup () {
  size (400, 200);
  background (0);
  smooth();
  frameRate (30);

  step = float (width) / (points - 1);
}
 
void draw () {  

  beginShape ();
  noFill();
  stroke(255, 70);
  
  if (mousePressed) {
    stroke(0);
    for (int i=0; i < points; i = i + 1) {
 
    float posx = i * step;
    float posy = height + random (-mouseY, mouseY);
    curveVertex (posx, posy);

    if (i == 0) {
      curveVertex (posx, posy);
    }
    if (i == points - 1) {
      curveVertex (posx, posy);
    }
  }
  }

  
  else {
     for (int i=0; i < points; i = i + 1) {
 
    float posx = i * step;
    float posy = height/80 + random (-mouseY, mouseY);
    curveVertex (posx, posy);

    if (i == 0) {
      curveVertex (posx, posy);
    }
    if (i == points - 1) {
      curveVertex (posx, posy);
    }
  }
  }
  
  
  endShape ();
}

