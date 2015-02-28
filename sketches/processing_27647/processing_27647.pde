
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 23-2: Simple particle system with ArrayList

// A simple Particle class
class Cat {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  float xdir;
  float ydir;
  
  Cat() {
    x = random(100,700);
    y = random(100,700);
    xspeed = random(-1,1);
    yspeed = random(-2,0);
    xdir = 1;
    ydir = 1;
  }
  
  void move() { //movement and reverse speed to bounce off edges
    x += xspeed * xdir;
    y += yspeed * ydir;
    
    if (x > width-100 || x < 100) {
      xdir *= -1;
    }
    
    if (y > height-120 || y < 100) {
      ydir *= -1;
    }
  }//end of move
  void mouse() {
    if (mousePressed == true) {
      if (dist(mouseX,mouseY, x,y) < 50) {
        if (mouseX < x) {
        x += 10;
        } else if (mouseX > x) {
          x -= 10;
        } 
      }//end of distance cond.
      if (dist(mouseX,mouseY,x,y) < 50) {
        if (mouseY < y) {
          y += 10;
        } else if (mouseY > y) {
          y -= 10;
        }
      }
    }//end of mousePress
    if (mousePressed == true) { //tail straighten
      strokeWeight(1);
      fill(245,184,0);
      beginShape();
      vertex(x-15,y);
      vertex(x-35,y-5);
      vertex(x-35,y+5);
      vertex(x-15,y);
      endShape();
    } else {
      fill(245,184,0);
      curve(x,y,x-20,y,x-30,y-15,x-50,y+20); //tail
    }
  } //end of mouse
  
  void display() {
    fill(245,184,0);
    ellipse(x,y,30,18); //body
    ellipse(x+15,y,15,15); //head
    fill(251,215,72);
    //curve(x,y,x-20,y,x-30,y-15,x-50,y+20); //tail
    strokeWeight(1);
    fill(68,68,37); //eye fill
    ellipse(x+18,y-2,4,4); //top eye
    ellipse(x+18,y+3,4,4); //bottom eye
    fill(251,215,72);
    beginShape();
    vertex(x+3,y-9);
    vertex(x+1,y-15);
    vertex(x+5,y-15);
    vertex(x+4,y-9);
    endShape();
    beginShape();
    vertex(x-8,y-8);
    vertex(x-10,y-15);
    vertex(x-6,y-15);
    vertex(x-7,y-8);
    endShape();
    beginShape();
    vertex(x+3,y+9);
    vertex(x+1,y+15);
    vertex(x+5,y+15);
    vertex(x+4,y+9);
    endShape();
    beginShape();
    vertex(x-8,y+8);
    vertex(x-10,y+15);
    vertex(x-6,y+15);
    vertex(x-7,y+8);
    endShape();
  }//end of display
  
  boolean finished() {
    if(x > width) {
      return true;
    } else {
      return false;
    }
  }

  
  /*
  boolean score() {
    if (x > width) {
      println("true");
      return true;
    } else {
      println("false");
      return false;
    }
  }//end boolean
  */
}//end of Cat class

