
int value = 50;
void setup() {
  size(500,500);
  noStroke();
  background(222,240,250);
}
void draw() {

  fill(value+random(255));
  ellipse(random(500),255,30,30);
  fill(value+random(255));
  ellipse(random(500),225,30,30);
  fill(value+random(255));
  ellipse(200,random(500),30,30);
  fill(value+random(255));
  ellipse(230,random(500),30,30);
  fill(value+random(255));
  ellipse(260,random(500),30,30);
  fill(value+random(255));
  ellipse(290,random(500),30,30);
  fill(value+random(255));
  ellipse(470,random(500),30,30);
  fill(value+random(255));
  ellipse(random(500),470,30,30);
  fill(value+random(255));
  ellipse(random(500),370,30,30);
  fill(value+random(255));
  ellipse(random(500),30,30,30);
 // fill(value+random(255));
 // ellipse(random(500),60,30,30);
  fill(value+random(255));
  ellipse(random(500),90,30,30);
  fill(value+random(255));
  ellipse(random(500),150,30,30);

  fill(value+random(100));
  rect(random(500),random(500), random(60),random(50));
}
                
