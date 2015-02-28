
PImage btrio; //introduce image
PImage hexsil;
PImage tripri;
PImage trisec;
PImage bsnow;
PImage neonred;
PImage wtrio;
PImage wspider;
float minX, maxX,minY,maxY;
void setup () {
  size(1000,1000);
  btrio = loadImage("motif14.png"); //load image
  hexsil=loadImage("motif31.png");
  tripri=loadImage("motif14.png");
  trisec=loadImage("motif14.png"); 
 bsnow=loadImage("motif14.png"); 
 neonred=loadImage("motif12.png");
 wtrio=loadImage("motif30.png");
 wspider=loadImage("motif26.png");
  imageMode(CENTER);
  
  background(1);
}

int counter = 0;

void draw() {
  pushMatrix();
  
  rotate(random(0, 2*PI));
  
  float w1 = neonred.width;
  float h1 = neonred.height;
  float x1 = random(0, width);
  float y1 = random(0, height);
  float s1 = random(0.7, 100);
  
  tint(255, 255, 255, 90);
  image(neonred, x1, y1, w1/2, h1/2);
  
  float w2 = wtrio.width;
  float h2 = wtrio.height;
  float x2 = random(0, width);
  float y2 = random(0, height);
  float s2 = random(50, 90);
  
  tint(255);
  image(wtrio, x2, y2, w2/s2, h2/s2);
  
  counter++;
  println(counter);
  
  popMatrix();
}

void mousePressed() {
  pushMatrix();
  
  translate(mouseX, mouseY);
  rotate(random(0, 3*PI));
  image(wspider, 0, 0, wspider.width, wspider.height);
  
  popMatrix();
}

void keyPressed() {
  pushMatrix();
  
  translate(mouseX, mouseY);
  rotate(random(0, 3*PI));
  image(hexsil, 0, 0, hexsil.width, hexsil.height);
  
  popMatrix();
}


