
Rect[] Rects = new Rect[150];   

void setup() {

  size(900, 400); 
  background(255);
  smooth();
  noStroke();
  for (int i=0; i < Rects.length; i++) 
    Rects[i] = new Rect();
}

void draw() {
  for (int i=0; i<Rects.length; i++) {
    Rects[i].draw();
  }
}

//================================= 

class Rect {

  // properties
  float x, y, rad, xSpd, ySpd;

  // constructor
  Rect () {
    x = random(width);
    y = random(height);
    rad = random(1);
    xSpd = random(-1, 1); 	
    ySpd = random(-1, 1);
  }

  void draw() {

    float scale = cos(frameCount/200.0);// -1 -> 1
    float radScale = 70 + (scale*20);
    float radius = (rad * radScale);
    float spdScale = 10 -(10*(.5+scale/2.0)); // 0,10 (inverse)
    frameRate(5+spdScale*3);    
    
    x += xSpd * (2+spdScale/2);
    y += ySpd * (2+spdScale/2);
    
    //println(scale);

    if (x > (width+radius)) 
      x = 0 - radius;
    if (x < (0-radius)) 
      x = width+radius;
    if (y > (height+radius)) 
      y = 0 - radius;
    if (y < (0-radius)) 
      y = height+radius;

    for (int i=0; i<Rects.length; i++) {

      Rect otherCirc = Rects[i];
      float otherCircRadius = Rects[i].rad * scale;

      if (otherCirc != this) {  
        float dis = dist(x, y, otherCirc.x, otherCirc.y); 
        float overlap = dis - radius - otherCircRadius; 
        if (overlap < 0) { 
          float midx, midy;
          if (x < otherCirc.x) 
            midx = x + (otherCirc.x - x)/2;
          else 
            midx = otherCirc.x + (x - otherCirc.x)/2;
          if (y < otherCirc.y) 
            midy = y + (otherCirc.y - y)/2;
          else 
            midy = otherCirc.y + (y - otherCirc.y)/2;
          overlap *= -1; 
          
          fill( (frameCount%256<128 ) ? 0 : 255, 3);
          rect(midx, midy, overlap, overlap);
        }
      }
    }
  }
}



