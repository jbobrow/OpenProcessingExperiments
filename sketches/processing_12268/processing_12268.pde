
//With the 4D Glasses
//by Robert Dao
//September 17, 2010


void setup() {
  size(600, 600);
  background(0);
  //noCursor();
  noStroke();
  smooth();
  frameRate(999999999);
}


void draw() {
  //fill(0);
  //ellipse(mouseX, mouseY, 20, 20);
//background(0, 10);
  if(mousePressed) {



    {
      if(mouseY > 0) {
        fill(mouseX, mouseY, mouseY, 50);
        ellipse(mouseX, mouseY, 20, 20);
        fill(mouseX, mouseY, mouseY);
        quad(mouseX, mouseY, mouseX, mouseY, -5, 0, 0, -5);
        fill(mouseX, mouseY, mouseX);
        quad(mouseX, mouseY, mouseX, mouseY, 605, 600, 600, 605);
      } 
      else {
        fill(mouseX, mouseX, mouseY);
        ellipse(mouseX, mouseY, 20, 20);
      }
    }
    {
      if(mouseY < height)
      {
        fill(255, 50);
        ellipse(mouseX, mouseY, 20, 20);
        fill(mouseX, mouseY, mouseY);
        quad(mouseX, mouseY, mouseX, mouseY, 605, 0, 600, -5);
        fill(mouseX, mouseY, mouseX);
        quad(mouseX, mouseY, mouseX, mouseY, 0, 605, -5, 600);
      }
      else {
        fill(255);
        ellipse(mouseX, mouseY, 20, 20);
      }
    }
    {
      if(mouseX > 0)
      {
        random(50, 100);
      }
      else {
        fill(mouseY, mouseY, mouseX);
        ellipse(mouseX, mouseY, 20, 20);
      }
    }
  }
}


