
void setup(){
  size(600,400);
  background(255);
  colorMode(HSB);
  int counter=0;
}

void draw(){
  
  for(int i=0;i<4;i++){
    if(mousePressed){
      noStroke();
      fill(random(255),100,255,50);
      ellipse(mouseX,mouseY,20,20);
      i++;
    }

  }
  
  if(mousePressed){
    point(mouseX,mouseY+10);
    point(mouseX,mouseY+5);
    point(mouseX,mouseY);
    point(mouseX,mouseY-5);
    point(mouseX,mouseY-10);
  }
  else{
    noStroke();
    fill(random(255),100,255,50);
    ellipse(mouseX,mouseY,50,50);
  }
}




