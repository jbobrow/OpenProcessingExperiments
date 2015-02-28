
ArrayList <Shape >shapelist = new ArrayList <Shape> ();
void setup() {
  size(400, 400);
}
void draw() {
  background(0);
  if(mousePressed && dist(mouseX, mouseY, pmouseX, pmouseY)>1) {  
    shapelist.add(new Shape(int(random(3, 9)), dist(mouseX, mouseY, pmouseX, pmouseY), mouseX, mouseY, random(0.003, 0.1)));
  } 
  for(int i = 0; i < shapelist.size(); i++){
    shapelist.get(i).drawMe();
  }
}

  
class Shape {
  int sides; float rad; float d; float plus;
  PVector position;
  Shape(int sidesvar, float radvar, float x, float y, float plusvar){
    position = new PVector(x, y);
    d =0;
    rad=radvar;
    sides = sidesvar;
    plus=plusvar;
  }
  void drawMe() {
    d+=plus;
    beginShape();
    for(int i = 0; i < sides+1; i++) {
      vertex(position.x+sin(d+((TWO_PI/sides)*i))*rad, position.y+cos(d+((TWO_PI/sides)*i))*rad);
    }
    endShape();
  }
}
