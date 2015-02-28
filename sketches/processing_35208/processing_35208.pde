
float paintSize = 50;

void setup(){
  smooth();
  noStroke();
  size(screen.width/4, screen.height);
  fill(255,0,0,40);
}

void draw(){
  paintSize = random(50);
  ellipse(mouseX+random(-100, 100), mouseY+random(-100, 100), paintSize, paintSize);

  if(mousePressed == true){
    fill(90,80,255,80);
  }
  else {
    fill(255,0,0,40);    
  }
}
