
int counter;
PVector[] wheres;
PVector[] deltas;

void setup() {  //setup function called initially, only once

  wheres = new PVector[15];
  for(int i=0;i<wheres.length;i++) {
      wheres[i] = new PVector(25*(i+1),145);
  }
  deltas = new PVector[15];
  for(int i=0;i<deltas.length;i++) {
    deltas[i] = new PVector(1,1);
  }
  size(510, 250);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  //                               
  for(int i=0;i<wheres.length;i++) {
      fill(random(wheres[i].x%5,255),100,100,50);
      ellipse(wheres[i].x, wheres[i].y, 8*sin(counter), 8*sin(counter));
 
      deltas[i] = ricocheteDelta(wheres[i], deltas[i]);
      
      wheres[i].x = wheres[i].x + deltas[i].x;
      wheres[i].y = wheres[i].y + deltas[i].y; 
  }
}

PVector ricocheteDelta(PVector w, PVector del) {

  PVector newDelta = new PVector(del.x, del.y);
  if ((w.x + del.x) > width)
      newDelta.x = -1;
      
  if ((w.x + del.x) < 0)
      newDelta.x = 1;
 
  if ((w.y + del.y) > height)
      newDelta.y = -1;
      
  if ((w.y + del.y) < 0)
      newDelta.y = 1;

  return newDelta;
}
