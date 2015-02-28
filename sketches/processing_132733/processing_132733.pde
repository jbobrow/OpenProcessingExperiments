
class Player1 {
  float pX;
float pY;
float speed;
color pColor = color(#92E5AA);


 Player1(float tempX, float tempY, float tempSpeed){
   pX = tempX;
   pY = tempY;
   speed = tempSpeed;
 }
 void display(){
 if (keyPressed) {
    if (key=='a') {
      pX -= speed;
    }
    if (key=='d') {
      pX += speed;
    }
    if (key=='s') {
      pY += speed;
    }
    if (key=='w') {
      pY -= speed;
    }
  }
  fill(pColor);


 
 }
}

