
/*
#	classname:	Bug
#	scope:		PUBLIC
#
*/

class Bug {

  float vx, vy, posX, posY;


  Bug() {
    this.vx = 0;
    this.vy = 0;
    this.posX = 320;
    this.posY = 220;
  }

  public void draw() {
    noStroke();
    fill(150, 60);
    ellipse(this.posX, this.posY, 50, 50);
  }


  public void move() {
    this.vx += random(-0.1, 0.1) * 15 ;
    this.vy += random(-0.1, 0.1) * 15 ;

    // Friction
    this.vx *= 0.95;  
    this.vy *= 0.95;

    // Move
    this.posX += this.vx;
    this.posY += this.vy;

    // Stage boundaries
    if (this.posX > width) {
      this.posX = width;
      // Reverse
      this.vx *= -1;
    }
    if (this.posX < 0) {
      this.posX = 0;
      this.vx *= -1;
    }
    if (this.posY > height) {
      this.posY = height ;
      this.vy *= -1;
    }
    if (this.posY < 0) {
      this.posY = 0 ;
      this.vy *= -1;
    }

    //AI
    if (abs(this.posX - mouseX) < 60) {
      if (abs(this.posY - mouseY) < 60) {
        this.vy += mouseY*0.01 + random(-0.1, 0.1) * 15;
        this.vx += mouseX*0.01 + random(-0.1, 0.1) * 15;
        if (abs(mouseY) < 1 && (abs(mouseX) < 1)) {
          this.posX += (this.vx * -1);
          this.posY += (this.vy *  -1);
          this.vx *= -1;
          this.vy *= -1;
        }
      }
    }
  }
}


