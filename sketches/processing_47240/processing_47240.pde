
PImage scene;

void setup(){
  size(600,600);
  smooth();
  scene = loadImage("owl.jpg");
  image(scene,0,0,600,600);
}

void draw() { 
  float d = dist(200, 0, mouseX, 0);
  noStroke();
  image(scene,0,0,600,600);
  fill(0);
  if (mouseX<200){
  ellipse(195-(d/12),150,70,70);
  ellipse(288-(d/12),150,70,70);
  fill(255,170,2);
  ellipse(195-(d/12),150,60,60);
  ellipse(288-(d/12),150,60,60);
  fill(0);
  ellipse(195-(d/12),150,20,20);
  ellipse(288-(d/12),150,20,20);
  }
  else if (mouseX>200){
  ellipse(195+(d/20),150,70,70);
  ellipse(288+(d/20),150,70,70);
  fill(255,170,2);
  ellipse(195+(d/20),150,60,60);
  ellipse(288+(d/20),150,60,60);
  fill(0);
  ellipse(195+(d/20),150,20,20);
  ellipse(288+(d/20),150,20,20);
  }
}

