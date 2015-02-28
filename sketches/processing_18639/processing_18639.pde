
class Beaver {

  float x;
  float y;
  float speed;
  
Beaver(float tempX, float tempY, float tempSpeed) {
  x = tempX;
  y = tempY;
  speed = tempSpeed;
  
}

void display()  {
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  //tail
  fill(57,50,33);
  ellipse(x + 57, y - 30, 35, 80);
  
  //right arm
  fill(70,57,29);
  quad(x - 48, y - 2, x - 20, y + 15, x - 20, y + 30, x - 48, y + 12);
  
  //body
  fill(85,72,38);
  strokeWeight(2);
  stroke(46,38,17);
  ellipse(x + 25, y, 92, 80);
  noStroke();
  ellipse(x - 15, y - 10, 65, 50);
  ellipse(x - 5, y + 5, 60, 30);
  
  //left arm
  fill(70,57,29);
  quad(x - 17, y - 7, x + 15, y + 20, x, y + 20, x - 17, y + 7);
  
  //water cover
  fill(83,178,77);
  noStroke();
  rect(x, y + 40, 200, 50);
 
  
  //face
  fill(15);
  ellipse(x - 28, y - 15, 5, 5);
  ellipse( x - 39, y - 8, 10, 9);
  strokeWeight(3);
  stroke(47,38,17);
  noFill();
  ellipse(x - 11, y - 25, 18, 11);
  noStroke();
  fill(85,72,38);
  ellipse(x - 13, y - 23, 19, 13);
  
  //paws
  fill(70,57,29);
  ellipse(x - 17, y, 10, 14);
  ellipse(x - 48, y + 5, 10, 14);
  
  //branch
  noFill();
  strokeWeight(7);
  stroke(49,38,16);
  line(x - 75, y + 10, x - 55, y + 8);
  line(x - 55, y + 8, x - 22, y + 1);
  line(x - 22, y + 1, x - 10, y - 1);
  line(x - 10, y - 1, x + 10, y + 10);
  
  //teeth
  noStroke();
  fill(250);
  rect(x - 40, y, 3, 8);
  rect(x - 36, y, 3, 8);
  
  //paws 2
  fill(70,57,29);
  ellipse(x - 17, y - 4, 8, 4);
  
}

void move() {
  y = y + speed;
  if (y == 70 || y == 385) {
    speed = speed * -1;
  }
}

void shake() {
  x = x + random (-2,2)*speed;
  x = constrain (x, 60, 120);
}
}




