

void setup(){
  stroke(255, 0, 0);
  fill(0,255,0);
  size(1080, 680);
  background(#000000);
}

ArrayList verteces = new ArrayList();

void mousePressed(){
  Coords c = new Coords();
  c.x = mouseX;
  c.y = mouseY;
  verteces.add(c);
}

void keyPressed(){
  for(int k=0; k<verteces.size(); k++){
    Coords c = (Coords)verteces.get(k);
    println(c.x + ", " +c.y);
  }
  println("------");
  noStroke();
  fill(#000000);
  rect(0,0,1080,680);
  stroke(255, 0, 0);
  fill(0,255,0);
  verteces = new ArrayList();
}

void draw(){
  noStroke();
  fill(#000000);
  rect(0,0,1080,680);
  stroke(255, 0, 0);
  fill(0,255,0);
  
  beginShape();
  for(int k=0; k<verteces.size(); k++){
    Coords loc = (Coords)verteces.get(k);
    curveVertex(loc.x, loc.y);
  }
  endShape(CLOSE);
}

class Coords{
  public int x;
  public int y;
}

