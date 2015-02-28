
float angle = 0;
float pos = 0;
float gap = 16.0;

void setup() {
  size(600,400, P3D);
  textMode(SCREEN);
}

void draw() {
  int cnt = 80;
  background(0);
  if (keyPressed) {
    if (key == 'a' || key == 'A') angle -= PI/200;
    if (key == 'd' || key == 'D') angle += PI/200;
    if (key == 'w' || key == 'W') gap +=.2;
    if (key == 's' || key == 'S') gap -=.2;
  }
  
  pushMatrix(); 
  translate(width * 0.5, height, -height*3);
  rotateX(-.4);
  rotateY(angle);
  
  pos += gap;
  noFill();
  for (float z = -cnt; z<cnt; z++)
    for (float x = -cnt; x<cnt; x++) {
      float expX = x*gap;
      float expZ = z*gap;
      float expY = noise((expX+1000)*.01, (expZ-pos)*.01)*500;
      float sqY = expY*expY-(expX*expX+expZ*expZ)/gap;
      if(sqY > 1000) {
        stroke(sqY*.002,sqY*.004,sqY*.001);
        point (expX,-expY,expZ);
      }
    }
  popMatrix();
}


