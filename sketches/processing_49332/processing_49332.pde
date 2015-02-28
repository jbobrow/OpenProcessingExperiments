
class Bob {
  
  boolean hit = false;
  color c;
  float x;
  float y;
  int bodySize = 80;
  float xoff = random(100);
  float yoff = random(100);
  float a = 0;
  float speed = .75;
  
  Bob(color tempC, float tempX, float tempY) {
    c = tempC;
    x = tempX;
    y = tempY;
    rectMode(CENTER);
    
  }
  
  void display() {
 
    
    if (hit) {
      bodyHit();
      limbs();
      mouthHit();
      eyesHit();
    } else {
      body();
      limbs();
      mouth();
      eyes();
    }
    
  }
  
  void groove() {
    xoff = xoff + .01;
    yoff = yoff + .01;
    
    x = noise(xoff) * width;
    y = noise(yoff) * height;
    


  }
  
  void hitTest(Bob bob) {
    float rad = (bodySize > bob.bodySize ? bodySize : bob.bodySize);
    
    if(dist(x, y, bob.x, bob.y) <= rad) {
      bob.hit = true;
      hit = true;
    } else {
      bob.hit = false;
      hit = false;
    }
  }
  
  float x() {
    return x;
  }
  
  float y() {
    return y;
  }
  
  void moveArms() {
    a = a+speed;
    
    if(a > 10 || a < -5){
      speed *= -1;
    }
  }
  
  void body() {
    noStroke();
    fill(c);
    ellipse(x, y+10, 35, 35);
    ellipse(x, y-20, 42, 42); 
  }
  
  void bodyHit() {
    noStroke();
    fill(c);
    ellipse(x, y+10, 35, 35);
    fill(242,12,81);
    ellipse(x, y-20, 42, 42);
  }
  
  void limbs() {
    //hands
    fill(c);
    ellipse(x-33-a, y+7, 10, 10);
    ellipse(x+33+a, y+7, 10, 10);
    //legs&arms
    stroke(99,125,188);
    strokeWeight(3);
    line(x-7, y+27, x-10, y+37); 
    line(x+8, y+27, x+10, y+37);
    line(x-19, y+7, x-27-a, y+7);
    line(x+19, y+7, x+27+a, y+7);
    //feet
    strokeWeight(1);
    fill(255);
    ellipse(x-15, y+40, 18, 9);
    ellipse(x+15, y+40, 18, 9);
    fill(99,125,188);
    rect(x-15, y+43, 18, 5);
    rect(x+15, y+43, 18, 5); 
  }
  
  void mouth() {
    fill(255);
    noStroke();
    arc(x, y-10, 20, 15, 0, PI);
    //moustache
    fill(0);
    noStroke();
    triangle(x-5, y-2, x+5, y-2, x, y+4);
  }
  
  void mouthHit() {
    fill(0);
    noStroke();
    ellipse(x,y-6,5,5);
    //moustache
    fill(0);
    noStroke();
    triangle(x-5, y-2, x+5, y-2, x, y+4);
  }
  
  void eyes() {
    fill(#80C691);
    stroke(0);
    strokeWeight(2);
    //outer circles
    ellipse(x-7, y-22, 12, 15);
    ellipse(x+7, y-22, 12, 15);
    fill(0);
    //inner circles
    ellipse(x-6, y-22, 4, 5);
    ellipse(x+7, y-22, 4, 5);
    stroke(255);
    //white highlights
    line(x-12, y-26, x-11, y-25);
    line(x+3, y-26, x+4, y-25);
  }
  
  void eyesHit() {
    fill(#80C691);
    stroke(0);
    strokeWeight(2);
    arc(x-7, y-22, 12, 15, 0, PI);
    line(x-12, y-22, x-1, y-22);
    
    arc(x+7, y-22, 12, 15, 0, PI);
    line(x+1, y-22, x+12, y-22);
    
    fill(0);
    ellipse(x-8, y-19,4,4);
    ellipse(x+6, y-19,4,4);
    
    //eyebrow
 
    line(x-12, y-26, x-3, y-29);
    
  }

  
}

