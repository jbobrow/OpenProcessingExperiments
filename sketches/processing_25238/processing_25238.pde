
ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
 
void setup() {
  size(500, 500);
  smooth();
  reset();
}
 
void reset() {
   
 
  points.clear();
   
 
  for (int i = 0; i < 100; i++) {
    
    points.add(new PVector(random(width), random(height), random(TWO_PI)));
  }
  

}
 
void draw() {
  model();
  view();
}
 
void model() {
   
  for (int i = 0; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
   
    p.x += 4.0*cos(p.z);
    p.y += 3.0*sin(p.z);
    if (p.x < 0 || p.x > width) { p.z += PI; }
    if (p.y < 0 || p.y > height) { p.z += PI; }
  }
   
  
   
}
   
void view() {
  background(184,214, 216);   
 
  fill(71);
   
  
  for (int i = 0; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    ellipse(p.x, p.y, 80, 80);
  }
  
 
  stroke(83, 214, 212);
  fill(255, 40, 222);
  beginShape(TRIANGLES);
  
  for (int i = 0; i < triangles.size(); i++) {



   
  }
   
  endShape();
   
}








                
                
