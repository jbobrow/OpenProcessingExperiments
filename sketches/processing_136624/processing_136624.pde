
// hyundouk@andrew
// Copyright 2014 Hyun Doug Kim

void setup()
{
size(800, 400);

//black square
fill(0);
rect(0, 0, width/2, height);

//white square
fill(255);
rect(width/2, 0, width/2, height);
}

void draw()
{
  int pos= 0;
  while (pos < width/2)
  {
    fill(255, 0, 0);
    rect(pos, 0, width/40, height/20);
    rect(pos, height-20, width/40, height/20);
    rect(height-20, pos, width/40, height/20);
    rect(0, pos, width/40, height/20);
    pos+=20;
  }
  
  for (pos= width/2; pos<width ; pos+= 20)
  {
    fill(0, 0, 255);
    ellipse(pos, pos-width/2, 20, 20);
    ellipse(pos, width-pos, 20, 20);
  }
  
}


