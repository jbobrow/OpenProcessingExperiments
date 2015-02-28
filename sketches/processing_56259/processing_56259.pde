

void setup (){
  smooth ();
  size (300, 300);
}

void draw (){
  background (255);
  //fill (155, 204, 83);
stroke (0, 204, 83, 150);

for (int y = 20; y<= height-20; y += 10) {
  for (int x = 20; x<= width-20; x +=10) {
    float mx = mouseX/20;
    
    
 
    float offsetA = random (-mx, mx);
    float offsetB =  random (-mx, mx);
    fill (x, y, 5); // will go through the colour gradient based on x + y coordinates
    rect (x + offsetA, y - offsetB, 5, 5);
    stroke (x, y, 125);
    line (x + offsetA, y- offsetB, 250, 200);
  }
}

}









//rect (random(width), random (height), 5, 5);
  /* float redcol = map (x, 20, 280, 0, 255);
    float r = random (0, 255);
    float g = random (0, 255);
    float b = random (0, 255);
    fill (r, g, b);*/

