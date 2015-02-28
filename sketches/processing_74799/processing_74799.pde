
float X;

void setup ()  {
  float X = 0;
  size(400,400);
  background (255);
}

void draw ()  {
  fill (0, 10);
  stroke (255);
  rect (0,0,400,400);
  line (0 , 0, X, 200); 
  line (0, 400, X, 200);  

  line (400 , 0, X, 200);
  line (400 , 400, X, 200); 
  
  X = X + 1;
  if (X > width) {
    X = width - X * -1;
  }

}


