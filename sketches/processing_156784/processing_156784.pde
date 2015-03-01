
float posX = 30;
float posY = 30;
float easing = 0.1;


void setup(){
  size(900, 900);
  background(255);
  stroke(2);
}

void draw(){
  //draw the cover transparent rect
  fill(255, 100);
  quad(20, 38, 72, 30, 69, 17, 20, 46);
  background(255);
  stroke(2);
  posX += (mouseX - posX) * easing;
  posY += (mouseY - posY) * easing;

  fill(20);
  for (int i = 0; i < 30; i++) {
    if(i%3 == 0){
   quad(posX + i * 4, posY + i * 20, 37, 20, 10, 2, 15, 58);
    }
    else if(i%6 == 1){rect(30, 20, 55, 55, 7);
      rect(posX + i * 10, posY + i * 20, 70, 70, 6);
    }
  else{
  quad(posX + i * 115, posY + i * 40, 40, 28, 45, 50, 47, 30);  
  }
  }
}



