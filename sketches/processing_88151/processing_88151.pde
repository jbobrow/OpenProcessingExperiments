
void setup(){
  size( 500, 500);
  smooth();
  background (10, 31, 57);
}

void draw() {
  int i;
  //horizontal
  for (i = 0; i < 500; i++)
  { stroke( random(0, 255), random(0, 255), random(0, 255));
    line(0, i, 500, i);
    
    if (keyPressed) {
      if(key == 'p' || key == 'P')
      stroke( random (0, 255), random (0, 0), random (0, 255));
      line(0, i, 500, i);
      if(key == 'r' || key == 'R')
      stroke( random (0, 255), random (0, 0), random (0, 0));
      line(0, i, 500, i);
      if(key == 'g' || key == 'G')
      stroke( random (0, 0), random (0, 255), random (0, 0));
      line(0, i, 500, i);
      if(key == 'b' || key == 'B')
      stroke( random (0, 0), random (0, 0), random (0, 255));
      line(0, i, 500, i);
      if(key == 'h' || key == 'H')
      stroke( random (0, 0), random (0, 255), random (0, 255));
      line(0, i, 500, i);
      if(key == 'w' || key == 'W')
      stroke( random (0, 255));
      line(0, i, 500, i);
    }
}
}



