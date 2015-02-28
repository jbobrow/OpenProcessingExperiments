
PFont depot10;
PFont depot20;
PFont depot30;


void setup () {

  size(400, 400);
  smooth();
  noStroke();
}

void draw() { 

  background (230);
  noStroke();
  depot10 = createFont("DepotNew-Rg", 10, false);
  depot20 = createFont("DepotNew-Rg", 20, true);
  depot30 = createFont("DepotNew-TH", 30, true);
  textAlign(CENTER);

  float h = map(hour(), 0, 23, 0, height);
  float m = map(minute(), 0, 60, 0, height);
  float s = map(second(), 0, 60, 0, height);

  //  println();
  //  print(s);
  //  print(m);
  //  print(h);

  textFont (depot30);
  text(hour(), width/4, h);
  
  fill(55, 180, 35, random(90, 110));
  ellipse(width/2, m, m, m);

  fill(55, 180, 35, random(60, 80));
  ellipse(width/4, h, h*2, h*2);

  fill(240, 200, 55, 200);
  ellipse(width-100, s, s/3, s/3);
  fill(255);
  
  textFont(depot10);
  text(second(), width-100, s+4);
  
  textFont(depot20);
  text(minute(), width/2, m+4);


}


