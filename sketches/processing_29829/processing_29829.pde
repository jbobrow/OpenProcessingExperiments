
class Enemy {
  float x;
  float y = random(height/8, height - height/8);
  float dia = 50;
  float speed = 4;
  float angle1 = PI + HALF_PI;
  float angle2 = atan2(y-height/2, x-width/2);


  Enemy(float tempX) {
    x = tempX;
  }

  void drawEnemy() {



    noStroke();
    fill(0, 155, 0);
    rect(0, 0, 0, 0);
    pushMatrix();
    ellipse(x, y, dia, dia);
    rotate(angle1);
    popMatrix();

    angle1 += random(-0.1, 0.1);
    x += cos(angle1) * speed;
    y += sin(angle1) * speed;


    if (x > width - dia || x < 0 + dia || y > height - dia || y < 0 + dia) {
      angle1 += PI;
    }

    //    if(score >= 1) {
    //      speed += 1;
    //    }
  }
}


