
class Dog {

  float x;         
  float y;         
  float angle;     
  float rad;  
  float speed = 3;


  Dog(float r, float xVal, float yVal) {
    x = xVal;
    y = yVal;
    rad = r;
  }

  void dogFence() {
  if (rectDog1Intersect(rectX, rectY, rectWidth, rectHeight, x, y, rad) == true) {
      angle += PI; //bounce
      
      if (lineY1 > y) { //PREVENT DOG FROM GETTING WEDGED
        y -= 3;
      }       
      if (lineY3 < y) {
        y += 3;
      } 
        if (lineX5 > x) {
        x -= 3;
      } 
      if (lineX7 < x) {
        x += 3;
      } 
      
    }    
  }

  void moveDog() {
    angle += random(-0.2, 0.2);
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    if (x > width - 25 || x < 25 || y > height - 25 || y < 25) {
      angle += PI;
    }
    
     //preventing all the dogs from being pushed off screen

    //right
    if (x > width - 25) {
      angle = PI;
    }

    //left
    if (x  < 25) {
      angle = 2*PI;
    } 

    //bottom
    if ( y > height - 25) {
      angle = 3*PI/2;
    } 

    //top
    if (y < 25) {
      angle = PI/2;
    }
    
  }

  void drawDog() {

    noStroke();
    pushMatrix();
    stroke(255, 105, 18);
    strokeWeight(5);
    fill(255, 0, 0);
    translate(x, y);
    rotate(angle);
    ellipse(0, 0, rad, rad);
    popMatrix();
  }
}


