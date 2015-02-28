
class Chair {
  PImage chairImage;
  float positionX;
  float positionY;
  float counter = 0;
  float speed = 1;
  boolean fall = true;

  Chair() {
    chairImage = loadImage("chair.png");
    positionX = 400;
    positionY = 440;
  }

  void Update() {
    println(hit);
    if (tipped && true){
      
      if (counter < 1.8){
      counter += 0.1;
      }
      
      if (speed > 0){
      speed -= speed/10;
      }
      
      if (positionYLegs < 400){
      positionYLegs += speed;
      }else {
        fall = false;
      }
    }
    fill(#000000, 0);
    rect(300, 388, positionX, positionY);
    float DistanceX = mouseX - positionX;
    float DistanceY = mouseY - positionY;

    //check collision
    if ((abs(DistanceX) < 400/2) && (abs(DistanceY) < 388/2)) {
      hit = true;
    }
    else {
      hit = false;
    }
  }


  void Display() {
    pushMatrix();
    translate(positionX, positionY);
    rotate(counter);
    imageMode(CENTER);
    image(chairImage, 0, -150);
    popMatrix();
  }
}


