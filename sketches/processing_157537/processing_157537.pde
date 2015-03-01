
float sSize; 
float factor;  

void setup() {
  size(400, 400); 
  background(255);
  smooth(); 

  factor = 0; 
  sSize = 25;
}

void draw() {
  background(255);

  strokeWeight(2);
  float x, y, xStart;  

  if (factor < 2) {
    xStart = -sSize;
  } else {
    xStart = -2 * sSize;
  }
  for (y = 1.5*sSize; y < height; y += 2*sSize) { 
    for ( x = xStart; x < width; x += 2*sSize) { 
      drawShape(x, y, sSize, sSize, factor);
    }
  }

  factor += 0.02; 
  if (factor > 4) {
    factor = 0;
  }
}

void drawShape(float _xStart, float _yStart, float _length, float _height, float _factor ) {
  float xs, ys, l, h, f; 
  float x; 

  xs = _xStart; 
  ys = _yStart; 
  l = _length; 
  h = _height;
  f = _factor;  

  if (f > 2) {
    f = f - 2;
  }
  if (f < 1) {
    beginShape();
    vertex(xs, ys); 
    vertex(xs+l, ys);
    x = lerp(xs+l, xs+2*l, f); 
    vertex(x, ys-h);  
    vertex(x+l, ys-h); 
    endShape();
    
  } else {
    beginShape();
    x = lerp(xs, xs+l, f-1); 
    vertex(x, ys); 
    vertex(x+l, ys);   
    vertex(xs+2*l, ys-h);  
    vertex(xs+3*l, ys-h); 
    endShape();
  }
}



