
ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();

void setup() {
  size(500, 700);
  smooth();
  reset();
}

void reset() {


  points.clear();


  for (int i = 0; i < 70; i++) {

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
    if (p.x < 0 || p.x > width) { 
      p.z += PI;
    }
    if (p.y < 0 || p.y > height) { 
      p.z += PI;
    }
  }
}

void view() {
  background(67,36, 31);  

  fill(71);


  for (int i = 0; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    fill(249,168,27);
    ellipse(p.x, p.y, 130, 130);
    fill(238,28,37);
    println(i);
    ellipse(p.x, p.y, 110, 110);
    fill(244,127,23);
    ellipse(p.x, p.y, 90, 90);
    fill (242,88,35);
    ellipse(p.x, p.y, 70, 70);
    fill (67,36,31);
    ellipse(p.x, p.y, 50, 50);
  }


  noStroke();
  fill(255, 40, 222);
  beginShape(TRIANGLES);

  for (int i = 0; i < triangles.size(); i++) {
  }

  endShape();
}


                
                                
