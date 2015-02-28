
//Spray

//Sebastian Lindquist
//07.26.2010
//www.sebastianlindquist.com




void setup()  {
  size(400, 400);
  smooth();
  noCursor();
  frameRate(18);

}

void draw()  {
  back();
  circle();  
  spray();
  spraytwo();
}

void back() {
  background(0, 10);
}

void circle() {
 float dia = random(50);
 fill(random(50, 150), random(50, 200), random(150, 250));
 ellipse(mouseX, mouseY, dia, dia); 
}

void spray()  {
  int mx = mouseX;
  int my = mouseY;
  float spdia = random(30);
  fill(255);
  pushMatrix();
  //rotate(radians(random(1, 10)));
  translate(0,0);
  ellipse(mx + random(-100, 100), my + random(-100, 100), spdia, spdia);
  popMatrix();
} 

void spraytwo()  {
  int mx = mouseX;
  int my = mouseY;
  float spdia = random(30);
  fill(random(50, 150), random(50, 150), random(50, 150));
  pushMatrix();
  //rotate(radians(random(1, 10)));
  translate(0,0);
  ellipse(mx + random(-100, 100), my + random(-100, 100), spdia, spdia);
  popMatrix();
} 

