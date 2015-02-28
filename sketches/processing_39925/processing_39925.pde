
class Alien {

  int x, y;   // Variables for location of alien
  float speed; // Speed of alien
  color c;
  float r;     // Radius of alien

  Alien() {
    r = random(15, 30);               
    x = int(random(width));     
    y = int(random(height));              
    speed = random(1, 4);   // Pick a random speed
   
  }

  // Move the alien down
  void mov() {
    // Increment by speed
    y += speed;
    
    if(y > height || y < 0){
      speed = speed*-1;
    }
  }



  // Display the alien
  void display() {
     c = color(0, random(50, 255), random(0, 200));
    fill(c);
    noStroke();
    ellipse(x, y, r, r);
    rect(x+r/2, y, 30, 1);
    rect(x-r/2, y, 30, 1);
    fill(255);
    ellipse(x-5, y-3, r/4, r/4);
    ellipse(x+5, y-3, r/4, r/4);
    fill(0);
    ellipse(x-5, y-3, r/8, r/8);
    ellipse(x+5, y-3, r/8, r/8);

  }

  // if alien is hit
  void burst() {
    
    stroke(255);
    strokeWeight(4);
    line(x+r/2, y, x+r/2+20, y);
    line(x+r/2, y+r/2, x+r/2+20, y+r/2+20);
  line(x, y+r/2, x, y+r/2 + 20);
line(x-r/2, y+r/2, x-r/2-20, y+r/2+20);
line(x-r/2, y, x-r/2-20, y);
line(x-r/2, y-r/2, x-r/2-20, y-r/2-20);
line(x, y-r/2, x, y-r/2-20);
  y += height+10;
  speed=0;
  }
  }



