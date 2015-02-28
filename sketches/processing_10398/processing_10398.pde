
float val;

float col;

void setup () {
  size (400, 400, P2D);
  smooth ();
  
  background (255);
  stroke (0);
  strokeWeight (3);
  
  colorMode (HSB);;
  
  val = 0;
  col = 0;
}

void draw () {
  noStroke ();
  fill (255, 10);
  rect (0, 0, 400, 400);
  
  
  stroke (col, 255, 255);
  if (col > 255) col = 0;
  else col ++;
  
  float nX = map (sin(radians(val)), -1, 1, 0, 400);
  val += 5;
    
  bezier (200, 0, nX, 200, 400-nX, 200, 200, 400); 
  
  stroke (256 - col, 255, 255);
  bezier (0, 200, 200, 400-nX, 200, nX, width, 200); 
  
}

