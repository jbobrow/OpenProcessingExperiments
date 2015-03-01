
void setup(){
  size(900, 150);
  smooth();
  noCursor();
}
void draw(){
  background(122, 190, 201);
  for(int x = 20; x < 50; x += 1){
  
    float mx = mouseX;
    float offsetA = random(-mx, mx);
    float offsetB = random(-mx, mx);
    stroke(255);
    line(40 + offsetA, 0, 40 - offsetB, 150);
    
}
}



