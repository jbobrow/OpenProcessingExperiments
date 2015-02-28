
void setup(){
  size(600,600);
  frameRate(30);
}

void draw(){
  scale(3);
  background(250,100,0);
  
  stroke(250,100,0);
  strokeWeight(0);

  fill(255,255,255);
  rect(20,50,160,60);  
  
  fill(250,100,0);
  textSize(20);
  text("Mauskoordinaten!",23,85);
  mausZeichnen();
}

void mausZeichnen(){
fill(255,255,255);
text("X:"+mouseX, 50,150);
text("Y:"+mouseY, 110,150);
rect(mouseX,mouseY,5,5);
}
