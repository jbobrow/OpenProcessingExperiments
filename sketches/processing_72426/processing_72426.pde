
float X;
float Y;
float Z;
void setup ()  {
  float X = 0;
  float Y = 0;
  float Z = 400;
  size(400,400);
  background (255);
}

void draw ()  {
  fill (0, 10);
  stroke (255);
  rect (0,0,400,400);
  line (0 , 0, X, 200); 
  line (0, 400, X, 200);  
  X = X + 1;
  X = X % width;
  line (400 , 0, Y, 200);
  line (400 , 400, Y, 200); 

  line (0 , 0, X, 200); 
  line (0, 400, X, 200);  
  X = X + 1;
  X = X % width;
  line (400 , 0, Y, 200);
  line (400 , 400, Y, 200); 

  
  Y = X - 1;
  Y = Y % width;
  //line (0, 0, Z, 200);
  //Z = Z + 1;
  //Z = Z % width;
  
}


