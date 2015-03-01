
PFont ahn;
void setup(){
  size(600,600, P2D); 
  ahn = createFont("Arial", 100, true); 
  smooth(); 
  background(0); 
  
}

void draw(){
  ahnJae(); 
}

void ahnJae(){
  textFont(ahn, random(0, 100)); 
  fill(random(0, 255), random(0, 255), random(0, 255)); 
  text("Happy Birthday Ahn Jae!", random(-100, 600), random(0, 600)); 
  
}
