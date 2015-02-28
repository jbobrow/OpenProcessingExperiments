



int size = 20;
float distance = 0.0;

void setup() {
  size(400, 400);
  background(255);
  noFill(); 
}

void draw() {
  
  background(255);
  
  stroke (50, 100);
  
  // ilim and jlim represent "how many squares will fit?"
  int ilim = width / size;
  int jlim = height / size;
  
  int x = 0;
  int y = 0;
  
  // here we have a loop inside a loop!
  // the "j" loop draws a column or squares down
  // the the "i" loop moves to the right, so the next column is drawn further over
 
  for(int i = 0; i < ilim; i++)
  {   
      for(int j = 0; j < jlim; j++)
      {
        
          x = i * size;
          y = j * size;
          
          // some math magic to find this square's distance from the mouse
          // ...please feel free to ignore this...
          distance = (x - mouseX) * (x - mouseX) + (y - mouseY) * (y - mouseY);
          distance = sqrt(distance) / sqrt(width * width + height * height);
          distance = 1.0 - distance;
          distance = distance * distance * distance;
          distance = distance * 255.;
          
          // use distance for the color of this square
          fill(distance);
          rect(x, y, size - 2, size - 2);
      }
  }
  
}

