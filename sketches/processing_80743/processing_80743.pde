
size(400,400);
background(0);

int i          = 0,        
    nbCercles  = 200,
    decalage   = 1,
    r          = 0,
    g          = 0,
    b          = 0;    

while (i < nbCercles) {
  stroke((i+r)%255, (i+g)%255, (i+b)%255);
  noFill();
  ellipse(200, 200, 220-i*decalage, 220-i*decalage);
  i++;
}


