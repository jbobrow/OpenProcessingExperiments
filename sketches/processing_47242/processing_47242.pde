
PImage scene;

void setup(){
  size(385,385);
  smooth();
  scene = loadImage("owl.jpg");
  image(scene,0,0,385,385);
}

void draw() { 
  float d = dist(150, 0, mouseX, 0);
  noStroke();
  image(scene,0,0,385,385);
  fill(0);
  if (mouseX<200){
  ellipse(130-(d/12),95,40,40);
  ellipse(183-(d/12),95,40,40);
  fill(255,170,2);
  ellipse(130-(d/12),95,35,35);
  ellipse(183-(d/12),95,35,35);
  fill(0);
  ellipse(130-(d/12),95,10,10);
  ellipse(183-(d/12),95,10,10);
  }
  else if (mouseX>200){
  ellipse(130+(d/20),95,40,40);
  ellipse(183+(d/20),95,40,40);
  fill(255,170,2);
  ellipse(130+(d/20),95,35,35);
  ellipse(183+(d/20),95,35,35);
  fill(0);
  ellipse(130+(d/20),95,10,10);
  ellipse(183+(d/20),95,10,10);
  }
}

