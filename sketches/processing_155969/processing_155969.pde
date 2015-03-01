
PImage doge;
PImage cage;

float tintR;
float tintG;
float tintB;

float headWidth;
float headHeight;

void setup() {
  size(600,600); 
  background(255); 
  
  doge = loadImage("doge.jpg");
  cage = loadImage("cage.png");
}

void draw() {
//  background(255); 
  //rect(width/2, height/2, 100, 100);
  
  tintR = map(mouseX, 0, width, 0, 255);
  tintG = map(mouseY, 0, height, 0, 255); 
  tintB = map(frameCount, 0, 300, 0, 255); 
  
  headWidth = map(mouseX, 0, width, 0, 400);
  headHeight = map(mouseY, 0, height, 0, 550);
  
  
  float random1 = (random(-30, 30)); 
  
  float random2 = (random(300)); 
  
  int intRandom1 = int(random1); 
  int intRandom2 = int(random2); 
  
  //println("random1: " + random1 + " random2: " + random2); 
  //println("intRandom1: " + intRandom1 + " intRandom2: " + intRandom2); 
  
  tint(tintR,tintG,tintB); 
  //imageMode(CORNER);
  // 
  imageMode(CENTER); 
  
  float freq = map(frameCount, 0, 10000, 0.001, 0.1 );
  float scale = map(sin(frameCount * freq), -1, 1, 200, 300);
  
  
  pushMatrix(); 
  translate(width/2, height/2);
  rotate(radians(-frameCount * 0.5));
  image(cage, 0, 0, scale, scale);
  fill(255); 
  text("CAGE", 0,0); 
  //image(cage,width/2, height/2, headWidth + sin(mouseX * 0.1 )*100, headHeight + cos(mouseX * 0.1)*100);
  println(sin(mouseX * 0.01));
  
  pushMatrix();
  translate(width/2, height/5 - frameCount/ 10);  
  rotate(radians(-frameCount * 0.9));
  image(doge,0,0,80,80);
  
  popMatrix(); 
  popMatrix(); 
} 


