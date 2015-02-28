
size(400, 400);
background(255);

strokeWeight(1);
rect(0, 0, 399, 399);

noStroke();



int x = 0;
int y = 0;
int c = 0; 

translate(140,-220);
fill(c);
rectMode(CENTER);

for (int i=0; i<40; i++) {
  for (int j=0; j<40; j++) {
    float s = pow(j - 9, 2);
    
    if(s > 38) {
      s = 38;
    }
    if(s < 2) {
      s = 2;
    }
    
    fill(c);
    
    pushMatrix();
      rotate(radians(45) );
      rect(x, y, s, s );
    popMatrix();
      x = x + int(s) + 20;
      c = 180 - int(s) * 4;
  }
  c = 0;
  x = 0;
  y = y + 40;
}
