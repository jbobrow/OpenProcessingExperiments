
void setup(){ 
  smooth(); 
  background(0);  
  noStroke(); 
  size(600,600); 
  noFill(); 
  frameRate(100); 
} 
 
void draw(){ 
  for(int a=0;a<mouseX/75;a++){ 
  for(int b=0;b<mouseY/75;b++){
    if (mousePressed)    {
  float bier = random(0, 100);
      stroke(250, random(0, 250), random(0, 250));
    ellipse(a*100+50, b*100+50, bier, bier);
}
  else {
    float bier = random(0, 100);
  
    stroke(random(0, 250), 250, random(0, 250));
    ellipse(a*100+50, b*100+50, bier, bier);
  }
  }
}
if(keyPressed){
  setup();
}
}


