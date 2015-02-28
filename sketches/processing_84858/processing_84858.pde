
class Car { //Define the "Car" class
  color c; 
  float xpos; //Declare float variables for car position and speed
  float ypos;
  float xspeed; 
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { //Constructor
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  
  void display() { //Function to display the car object
    noStroke();
    fill(0);
    ellipse(xpos-15,ypos-15,15,10); //Draw wheels of the car object
    ellipse(xpos+15,ypos-15,15,10);
    ellipse(xpos-15,ypos+15,15,10);
    ellipse(xpos+15,ypos+15,15,10);
    rectMode(CENTER); //Draw car object
    stroke(0);
    strokeWeight(2);
    fill(c);
    rect(xpos,ypos,40,30);
  }
  
  void move() { //Function to move the car object
    xpos = xpos + xspeed;
    if (xpos > width) { //If the car object is greater than the width of the sketch window then reset to original position
      xpos = 0;
    } else if (xpos < 0) { //If the car object is less than the width of the sketch window then change x position to 500
      xpos = 500;
    }
    
    if (fxpos > xpos - 20 && fxpos < xpos + 20 && fypos > ypos && fypos < ypos + 15) { //If frog position intersects with car object then reset frog to starting position and change the score and life count
      fxpos = width/2;
      fypos = 580;
      life = life - 1; 
      score = score - 25;
    } 
  }
}

  

