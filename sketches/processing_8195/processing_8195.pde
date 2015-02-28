
// Brian Sorahan
// Recursive Productions

// Draw a logarithmic spiral

float a = 0.5;
float b = 0.2;
float theta = 0.0;
float inc = 0.01;

float x1, y1;
float x2, y2;
float x3, y3;

void setup()  {
  size(400, 400);
  background(255);
}

void draw()  {
  
  translate(width/2, height/2);
  
  theta += inc;
 
  x1 = a * cos(theta-inc) * exp(b * (theta-inc));
  y1 = a * sin(theta-inc) * exp(b * (theta-inc));
  
  x2 = a * cos(theta) * exp(b * theta);
  y2 = a * sin(theta) * exp(b * theta);
  
  stroke(0);
  line(x1, y1, x2, y2);
  
  if(theta >= TWO_PI)  {
    stroke(40, 20);
    
    x3 = a * cos((theta-TWO_PI)-inc) * exp(b * ((theta-TWO_PI)-inc));
    y3 = a * sin((theta-TWO_PI)-inc) * exp(b * ((theta-TWO_PI)-inc));
    
    line(x3, y3, x1, y1);
  }
  
  if(theta > 50.0)  {
    noLoop();
  }
}

// Save an image
void mousePressed()  {
  if(key == 115)  {
    saveFrame("Screenshot.jpg");
  }
}

