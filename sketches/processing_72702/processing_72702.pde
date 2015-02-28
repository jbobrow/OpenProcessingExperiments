
PImage sis,phen,phen2,phen3,phen4;
float ang,lastang=0;
float buffer = 50;
float alph;

void setup(){
  size(800, 400);
  imageMode(CENTER);
  sis = loadImage("sisyphus.jpeg");
  phen = loadImage("phen.jpeg");
  phen2 = loadImage("phen2.jpeg");
  phen3 = loadImage("phen3.jpeg");
  phen4 = loadImage("Zoetrope.jpeg");
  frameRate(8);
}

void draw(){
  background(255);
  
  pushMatrix();
  translate(400, 400);
  float moused = dist(mouseX, mouseY, pmouseX, pmouseY);
  ang = lastang + moused*PI/128;
  rotate(ang);
  if (mouseX < width/5-buffer/2){
    image(sis, 0, 0, 800, 800);
  } else if (mouseX >= width/5-buffer/2 && mouseX < width/5+buffer/2){
    alph = map(mouseX, width/5-buffer/2, width/5+buffer/2, 0, 255);
    image(sis, 0, 0, 800, 800);
    tint(255,alph);
    image(phen, 0,0, 850, 850);
  } else if (mouseX < 2*width/5-buffer/2){
    image(phen, 0,0, 850, 850);
  } else if (mouseX >= 2*width/5-buffer/2 && mouseX < 2*width/5+buffer/2){
    alph = map(mouseX, 2*width/5-buffer/2, 2*width/5+buffer/2, 0, 255);
    image(phen, 0, 0, 850, 850);
    tint(255,alph);
    image(phen2, 0,0, 850, 850);
  } else if (mouseX < 3*width/5-buffer/2){
    image(phen2, 0,0, 850, 850);
  } else if (mouseX >= 3*width/5-buffer/2 && mouseX < 3*width/5+buffer/2){
    alph = map(mouseX, 3*width/5-buffer/2, 3*width/5+buffer/2, 0, 255);
    image(phen2, 0, 0, 850, 850);
    tint(255,alph);
    image(phen3, 0,0, 850, 850);
  } else if (mouseX < 4*width/5-buffer/2){
    image(phen3, 0,0, 850, 850);
  } else if (mouseX >= 4*width/5-buffer/2 && mouseX < 4*width/5+buffer/2){
    alph = map(mouseX, 4*width/5-buffer/2, 4*width/5+buffer/2, 0, 255);
    image(phen3, 0, 0, 850, 850);
    tint(255,alph);
    image(phen4, 0,0, 850, 850);
  } else {
    image(phen4, 0,0, 850, 850);
  }
  noTint();
  lastang = ang;
  popMatrix();
  
//  for(int i=0; i<5; i++){
//    line(i*width/5, 0, i*width/5, height);
//    line(i*width/5-buffer/2, 0, i*width/5-buffer/2, height);
//    line(i*width/5+buffer/2, 0, i*width/5+buffer/2, height);
//  }
}

