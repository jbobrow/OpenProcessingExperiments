
//Cecilia Jin z3291190
//Polar bear eating fish!
//Based off the cursor thief by Gum



// Global variables
Bear bear;
int celebrate = 30;
int wait = 10;
PImage fishCursor;
PImage sweatDrop;
PImage heart;
PImage bearHead;
PImage bearTailLeft;
PImage bearTailRight;
PImage bearHappyFace;
PImage bearHappyFaceTwo;
PImage bearLookUp;
PImage bearX;
PImage bg;
 
// Setup variables
void setup() {
  size(600, 200);
  bear = new Bear(width*0.5, 170);
  noCursor();
  fishCursor = loadImage("fishcursor.png");
  sweatDrop = loadImage("sweatdrop.png");
  heart = loadImage("heart.png");
  bearHead = loadImage("bearhead.png");
  bearTailLeft = loadImage("tail.png");
  bearTailRight = loadImage("tail2.png");
  bearHappyFace = loadImage("bearhappy.png");
  bearHappyFaceTwo = loadImage("bearhappyeat.png");
  bearLookUp = loadImage("bearlookup.png");
  bearX = loadImage ("bearx.png");
  bg = loadImage ("bg.jpg");
  smooth();
}
 

void draw() {
  image (bg,0,0);
  bear.run();
}
 

class Bear {
  float posX;
  float posY;
  int state;
  boolean animate;
  int reach;
  int stretch;
 
  Bear(float x, float y) {
    posX = x;
    posY = y;
    state = 0;
    animate = false;
    reach = 0;
    stretch = 0;
  }
 
  void run() {
    wait--;
    if (wait == 0) {
      wait = 10;
      animate = !animate;
    }   
    action();
    render();
  }
 
  void action() {
    if (mouseX + mouseY > 0) {
      switch (state) {
        case 0: { // Jumping
          switch (reach) {
            case 0: { // Nothing
              if (dist(mouseX + 5, mouseY + 10, posX, posY) < 40) state = 3; // Cursor is caught
              else if (mouseX < posX - 15) state = 1;
              else if (mouseX > posX + 15) state = 2;
              else if (round(random(100)) == 5) { stretch = 0; reach = 1; }
              break;
            }
            case 1: { // Reaching up >:3
              if (dist(mouseX + 5, mouseY + 10, posX, stretch + posY - 10) < 20) reach = 3;
              else if ((abs(stretch) + 30) > height - mouseY - 10) reach = 2;
              else stretch--;
              break;
            }
            case 2: { // So close...
              if (dist(mouseX + 5, mouseY + 10, posX, stretch + posY - 10) < 20) reach = 3;
              else if (stretch < 0) stretch++;
              else { reach = 0; stretch = 0; }
              break;
            }
            case 3: { // Woot!
              if (stretch < 0) stretch++;
              else { reach = 0; stretch = 0; state = 3; }
              break;
            }
          }
          break;
        }
        case 1: { // Chase left
          posX += (mouseX - posX)*0.02;
          if (dist(mouseX + 5, mouseY + 10, posX, posY) < 40) state = 3; // Cursor is caught
          else if (mouseX <= posX + 15 && mouseX >= posX - 15) state = 0;
          else if (mouseX > posX + 15) state = 2;
          break;
        }
        case 2: { // Chase right
          posX += (mouseX - posX)*0.02;
          if (dist(mouseX + 5, mouseY + 10, posX, posY) < 40) state = 3; // Cursor is caught
          else if (mouseX <= posX + 15 && mouseX >= posX - 15) state = 0;
          else if (mouseX < posX - 15) state = 1;
          break;
        }
        case 3: { // Hide cursor
          if (posX > width + 50) { state = 0; celebrate = 10; }
          else posX += 2;
          break;
        }
      }
    }
  }
 
  void render() {
    fill(255);
    stroke(0); 
    strokeWeight(1);
 
    switch (state) {
      case 1: {
        //Body
        pushMatrix();
        translate(posX, posY);
        ellipse(0, 0, 30, 30);
        //Tail
        image(bearTailLeft,-18,-40);
        // Sweatdrops
        if (!animate) {
          pushMatrix();
          translate(15, -10);
          rotate(-HALF_PI*0.5);
          scale(0.5, 0.5);
          image(sweatDrop, 0, 0);
          popMatrix();
        }
        // Hands
        if (animate) {
          pushMatrix();     
          translate(-4, -10);
          image(bearHead,-45,-35);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(-6, -8);
          image(bearHead,-47,-33);
          popMatrix();
        }
        // Feet
        if (animate) {
          pushMatrix();     
          translate(-3, 19);
          arc(-3, 0, 14, 14, PI, TWO_PI);
          line(-9, 0, 3, 0);
          arc(3, 0, 14, 14, PI, TWO_PI);
          line(9, 0, -3, 0);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(-1, 19);
          arc(-6, 0, 14, 14, PI, TWO_PI);
          line(-12, 0, 0, 0);
          arc(4, 0, 14, 14, PI, TWO_PI);
          line(10, 0, -2, 0);
          popMatrix();
        }
        popMatrix();
        image(fishCursor, mouseX, mouseY);
        break;
      }
      case 2: {
        //Body
        pushMatrix();
        translate(posX, posY);
        ellipse(0, 0, 30, 30);
        //Tail
        image(bearTailRight,-55,-40);
        // Sweatdrops
        if (!animate) {
          pushMatrix();
          translate(-20, -15);
          rotate(HALF_PI*0.5);
          scale(0.5, 0.5);
          image(sweatDrop, 0, 0);
          popMatrix();
        }
        // Hands
        if (animate) {
          pushMatrix();     
          translate(4, -10);
          image(bearHead,-15,-35);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(6, -8);
          image(bearHead,-13,-33);
          popMatrix();
        }
        // Feet
        if (animate) {
          pushMatrix();     
          translate(3, 19);
          arc(3, 0, 14, 14, PI, TWO_PI);
          line(9, 0, -3, 0);
          arc(-3, 0, 14, 14, PI, TWO_PI);
          line(-9, 0, 3, 0);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(1, 19);
          arc(6, 0, 14, 14, PI, TWO_PI);
          line(12, 0, 0, 0);
          arc(-4, 0, 14, 14, PI, TWO_PI);
          line(-10, 0, 2, 0);
          popMatrix();
        }
        popMatrix();
        image(fishCursor, mouseX, mouseY);
        break;
      }
      case 3: {
        if (celebrate > 0) {
          celebrate--;
          // Heart
          pushMatrix();
          translate(posX + 5, posY - 40);
          scale(0.3, 0.3);
          image(heart, 0, 0);
          popMatrix();
        }
        //Body
        pushMatrix();
        
        translate(posX, posY);
        ellipse(0, 0, 30, 30);
        //Tail
        image(bearTailRight,-55,-40);
        // Hands
        if (animate) {
          pushMatrix();     
          translate(4, 0);
          image(fishCursor, 18, -15);
          image(bearHappyFace,-15,-40);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(6, 0);
          image(fishCursor, 18, -15);
          image(bearHappyFaceTwo,-13,-37);
          popMatrix();
        }
        // Feet
        if (animate) {
          pushMatrix();     
          translate(3, 19);
          arc(3, 0, 14, 14, PI, TWO_PI);
          line(9, 0, -3, 0);
          arc(-3, 0, 14, 14, PI, TWO_PI);
          line(-9, 0, 3, 0);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(1, 19);
          arc(6, 0, 14, 14, PI, TWO_PI);
          line(12, 0, 0, 0);
          arc(-4, 0, 14, 14, PI, TWO_PI);
          line(-10, 0, 2, 0);
          popMatrix();
        }
        popMatrix();
        break;
      }
      default: {
        pushMatrix();
        if (reach > 0) {
          translate(posX, posY);
          if (reach == 3) {
            image(fishCursor, -5, stretch - 30);
            
          }
          // Arms
          strokeWeight(2);
          pushMatrix();
          translate(0, -15);
          rect(7, 10, 5, stretch - 10);
          rect(-12, 10, 5, stretch - 10);
          for (int i = 0; i > stretch; i--) {
            if (i%10 == 0) {
              strokeWeight(1);
              line(7, i, 12, i);
              line(-12, i, -7, i);
            }           
          }
          popMatrix();
          strokeWeight(2);
          ellipse(0, 0, 30, 30);
          
        }
        else {
          if (animate) {
            translate(posX, posY);
            ellipse(0, 0, 30, 30);
          }
          else {
            translate(posX, posY - 3);
            ellipse(0, 0, 30, 30);
          }
        }
       
        // Hands
        if (reach > 0) {
          pushMatrix();
          translate(0, -15);
          ellipse(10, stretch, 15, 15);
          ellipse(-10, stretch, 15, 15);
          image(bearX,-38,-43);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(0, -15);  
          ellipse(14, stretch, 15, 15);
          ellipse(-14, stretch, 15, 15);
          image(bearLookUp,-38,-40);
          popMatrix();
        }
        // Feet
        pushMatrix();     
        translate(0, 19);
        arc(10, 0, 14, 14, PI, TWO_PI);
        line(16, 0, 4, 0);
        arc(-10, 0, 14, 14, PI, TWO_PI);
        line(-16, 0, -4, 0);
        popMatrix();
        popMatrix();
        if (reach < 3) image(fishCursor, mouseX, mouseY);
        break;
      }
    }
  }
}

