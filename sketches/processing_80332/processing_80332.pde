

float w, h;
  
void setup() {
  size(200, 200);
  background(0);
   
  strokeCap(SQUARE);
  noFill();
  w = width / 2;
  h = height / 2;
}  
  
void draw() {
  background(65);

  noFill();
  strokeWeight(30);
  stroke(#22E202);
  if (hour()>12) hand(new PVector(w, h), 30, (hour()-12)*30);
  else hand(new PVector(w, h), 30, hour()*30);
  
  strokeWeight(30);
  stroke(#E2E210);
  hand(new PVector(w, h), 90, minute()*6);
  
  strokeWeight(30);
  stroke(#F20202);
  hand(new PVector(w, h), 150, second()*6);  
}
  
void hand(PVector loc, float radius, float angle){    
    arc(loc.x, loc.y, radius, radius, radians(-90), radians(angle-90));
}



