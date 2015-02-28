
//Fading Brush

void setup(){
  size(600,600);
  smooth();
}

void draw(){
  fill(255,10);
  rect(0,0,width,height);
  for(int i = 0;i < 30; i++){
    strokeWeight(.2);
    fill(random(255),random(255),random(255),50);
    ellipse(mouseX,mouseY,i*3,i*3);
  }
}

