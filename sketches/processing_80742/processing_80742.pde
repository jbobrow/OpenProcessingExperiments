
size(400,400);
background(0);

int i          = 0,        
    nbCercles  = 68,
    decalage   = 3,
    r          = 0,
    g          = 20,
    b          = 0;    

while (i < nbCercles) {
  stroke((i+r)%255, g*i%255, (i+b)%255);
  noFill();
  ellipse(200+2*i, 200+2*i, 220-i*decalage, 220-i*decalage);
  i++;
}


