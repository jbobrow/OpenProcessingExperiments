
//New tab for Diamond class

//declare the variables for Diamond
class Diamond {
  float xpos;
  float ypos;
  float r;
  float g;
  float b;
  float a;
  float speed;
  float size;
 
  Diamond(float xpos_, float ypos_) {
    xpos = mouseX;
    ypos = mouseY;
    speed = random(1,15);
    
  }

  // Display Diamond - this is the construction info for Diamond
  void display() { 
    noStroke();
    beginShape(); // Diamond top left
    vertex(xpos, ypos+50);
    vertex(xpos+50, ypos);
    vertex(xpos+50, ypos+50);
    vertex(xpos, ypos+50);
    fill(r, g, b, a);
    endShape(CLOSE);
    beginShape(); // Diamond top right
    vertex(xpos+50, ypos+50);
    vertex(xpos+50, ypos);
    vertex(xpos+100, ypos+50);
    vertex(xpos, ypos+50);
    fill(r+50, g, b+50, a); // same random RGB values plus 50 to lighten the color, adding shading to the shape
    endShape(CLOSE);
    beginShape(); // Diamond bottom right
    vertex(xpos+50, ypos + 50);
    vertex(xpos+100, ypos+50);
    vertex(xpos+50, ypos+125);
    vertex(xpos +50, ypos+50);
    fill(r, g, b, a);
    endShape(CLOSE);
    beginShape(); // Diamond bottom left
    vertex(xpos+50, ypos + 50);
    vertex(xpos+50, ypos+125);
    vertex(xpos, ypos+50);
    vertex(xpos, ypos+50);
    fill(r+50, g+50, b+50, a); // same random RGB values plus 50 to lighten the color, adding shading to the shape
    endShape(CLOSE);
    r = random (0, 255);
    g = random (0);
    b = random (0, 255);
    a = random (0, 255);
  }

void move() {  //to make a falling display of diamonds I added speed to the ypos only. I set the xpos to  mouseX
    ypos = ypos + speed;
   if (ypos > height || ypos < 0) { //if the ypos is greater than the height (400) or less than zero, it changes direction
   speed = speed *-1;
ypos = height;
   }
   }
    }
 
   
    




