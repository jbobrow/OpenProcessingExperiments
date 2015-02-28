
class Ball{

  int speedX=int (random(1,3));
  int frame=0;
  float posX;
  float posY;
  float side;

  boolean spinning=true;

  Ball(float posX_, float posY_,float side_){
    posX=posX_;
    posY=posY_;
    side=side_;
  }

  void display(){

    pushMatrix();
    translate(posX,posY);
    rotate(frame * 0.175);

    
    image(enemy,0-side/2, 0-side/2,side,side);

    if (spinning){
      frame++;
    }
    popMatrix();

    posX = posX + speedX;
    if (posX > width-side/2 && speedX > 0) {
      speedX = -(speedX);
    }

    if (posX < 0+side/2 && speedX < 0) {
      speedX = abs(speedX);
    }
  }
  boolean intersect (Craft b) {
    // Calculate distance
    float distance = dist(posX,posY,b.posX,b.posY); 
    // Compare distance to sum of sides
    if (distance < side/2 + b.side/2) {
      return true;
    } 
    else {
      return false;
    }
  }
}

