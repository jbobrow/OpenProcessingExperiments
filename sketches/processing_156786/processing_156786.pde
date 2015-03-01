
float posX = 0;
float posY = 0;
float easing = 0.1;


void setup(){
  size(900, 900);
  background(255);
  noStroke();
}

void draw(){
  //draw the cover transparent rect
  fill(255, 100);
  rect(0, 0, 50, 20);
  background(255);
  noStroke();
  
  posX += (mouseX - posX) * easing;
  posY += (mouseY - posY) * easing;

  fill(20);
  for (int i = 0; i < 30; i++) {
    if(i%1 == 0){
    quad(posX + i * 4, posY + i * 20, 20, 20, 50, 3, 76, 32);
    }
    else if(i%7 == 1){
      ellipse(posX + i * 20, posY + i * 20, 30, 30);
    }
  else{
  quad(posX + i * 40, posY + i * 40, 40, 28, 45, 50, 18, 30);  
  }
  }
}



