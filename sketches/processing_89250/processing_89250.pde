
float d = 0;
ArrayList <PVector> flist = new ArrayList <PVector> ();
void setup() {
  size(400, 400);
  strokeWeight(5);
  stroke(175.5);
}
void draw() {
  d+=0.07;
  background(0);
  if(mousePressed) {
    flist.add(new PVector(mouseX, mouseY));
  }
  for(int i = 0; i < flist.size(); i++) {
  fill(abs(sin(i)*255), flist.get(i).x/2, flist.get(i).y/2);
    ellipse(flist.get(i).x, flist.get(i).y, (sin(d-(i*3)/50)*20), ( sin(d-(i*3)/50)*20));
  }

}

