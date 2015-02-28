
int d = day();
int m = month();
int y = year();
int h = hour();
int mi = minute();
int s = second();

void setup()
{
  size(500,500);
  smooth();
  background(255);
  ellipseMode(CENTER);
  planetary();
}

void planetary() {
  stroke(154,166,151);
  noFill();
  rect(55,55,390,390);
  ellipse(145,250,20,20); // 1
  ellipse(304,250,80,80); // 2
  ellipse(304,250,40,40); // 3
  ellipse(344,250,40,40); // 4
  line(95,250,405,250); // – horizontal
  line(145,95,145,405); // | vertikal
  ellipse(145,250,40,40); // 2.2
  ellipse(145,270,20,20); // 3.2
}

void draw()
{
  if(mousePressed)
  {
    saveFrame("PlanetaryBalanceChanged-"+d+"."+m+"."+y+" "+h+" "+mi+" "+s+".png");
    println("Saved!");
  }
}


