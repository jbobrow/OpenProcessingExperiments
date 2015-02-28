
void setup() {
  size(500, 500);
  smooth();
}

void draw(){
  background(255);
  if ((mouseX<=(height/2)+40)&&(mouseY>=(height/2)-40)
  &&((mouseY<=(height/2)+40))) {
    fill(random(255), random(255), random(255));
  } else {
    fill(0,0,255);
  }
  
  rectMode(CENTER);
  rect(width/2,height/2,80,80);
  
}


