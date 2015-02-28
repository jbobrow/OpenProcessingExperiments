
rustler rustler;
int celebrate = 30;
int wait = 10;
int time;
PImage mouseBalloon;
PImage sweatDrop;
PImage heart;
PImage rustlerHead;
PImage rustlerHappyFace;
PImage rustlerHappyFaceTwo;
PImage rustlerLookUp;
PImage rustlerX;
PImage baseIn;

// Setup variables
void setup() {
  size(600, 200);
  rustler = new rustler(width*0.5, 170);
  noCursor();
  baseIn = loadImage("backdrop.png");
  mouseBalloon = loadImage("ballooncursor.png");
  sweatDrop = loadImage("sweatdrop.png");
  heart = loadImage("heart.png");
  rustlerHead = loadImage("rustlerhead.png");
  rustlerHappyFace = loadImage("rustlerhappy.png");
  rustlerHappyFaceTwo = loadImage("rustlerhappyeat.png");
  rustlerLookUp = loadImage("rustlerlookup.png");
  rustlerX = loadImage ("rustlerx.png");
  smooth();
}

class rustler {
  float posX;
  float posY;
  int state;
  boolean animate;
  int reach;
  int stretch;
 
  rustler(float x, float y) {
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
    fill(50,50,50);
    stroke(0); 
    strokeWeight(2);
 
    switch (state) {
      case 1: {
        //Body
        pushMatrix();
        translate(posX, posY);
        // Sweatdrops
        if (!animate) {
          pushMatrix();
          translate(20, -15);
          rotate(-HALF_PI*0.5);
          scale(0.5, 0.5);
          image(sweatDrop, 0, 0);
          popMatrix();
        }
        // Hands
        if (animate) {
          pushMatrix();     
          translate(-4, -10);
          image(rustlerHead,-45,-35);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(-6, -8);
          image(rustlerHead,-47,-33);
          popMatrix();
        }
        if (animate) {
          pushMatrix();     
          popMatrix();
        }
        else {
          pushMatrix();     
          popMatrix();
        }
        popMatrix();
        image(mouseBalloon, mouseX, mouseY);
        break;
      }
      case 2: {
        pushMatrix();
        translate(posX, posY);
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
          image(rustlerHead,-15,-35);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(6, -8);
          image(rustlerHead,-13,-33);
          popMatrix();
        }
        if (animate) {
          pushMatrix();     
          popMatrix();
        }
        else {
          pushMatrix();     
          popMatrix();
        }
        popMatrix();
        image(mouseBalloon, mouseX, mouseY);
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
        pushMatrix();
        translate(posX, posY);
        // Hands
        if (animate) {
          pushMatrix();     
          translate(4, 0);
          image(mouseBalloon, 18, -15);
          image(rustlerHappyFace,-15,-40);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(6, 0);
          image(mouseBalloon, 18, -15);
          image(rustlerHappyFaceTwo,-13,-37);
          popMatrix();
        }
        if (animate) {
          pushMatrix();     
          popMatrix();
        }
        else {
          pushMatrix();     
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
            image(mouseBalloon, -5, stretch - 30);
            
          }
          // Arms
          strokeWeight(2);
          pushMatrix();
          translate(0, -15);
          ellipse(7, 10, 5, stretch - 10);
          ellipse(-12, 10, 5, stretch - 10);
          for (int i = 0; i > stretch; i--) {
            if (i%10 == 0) {
              strokeWeight(1);
              line(7, i, 12, i);
              line(-12, i, -7, i);
            }           
          }
          popMatrix();
          strokeWeight(2);
          
        }
        else {
          if (animate) {
            translate(posX, posY);
          }
          else {
            translate(posX, posY - 3);
          }
        }
       
        // Hands
        if (reach > 0) {
          pushMatrix();
          translate(0, -15);
          ellipse(10, stretch, 15, 15);
          ellipse(-10, stretch, 15, 15);
          image(rustlerX,-38,-43); //rustler making a >< face!
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(0, -15);  
          ellipse(14, stretch, 15, 15);
          ellipse(-14, stretch, 15, 15);
          image(rustlerLookUp,-38,-40); //rustler looking up!
          popMatrix();
        }
        pushMatrix();     
        popMatrix();
        popMatrix();
        if (reach < 3) image(mouseBalloon, mouseX, mouseY);
        break;
      }
    }
  }
}
 
//0 drawing loop
void draw() {
  
  background(baseIn = loadImage("backdrop.png"));
  fill(229, 103, 50);    //Fill Orange
    text("Time: " + (time/55), 250, 25); //Create Text for Time
    time = time + 1; //If Time equals Time plus 1
  rustler.run();
}
 



