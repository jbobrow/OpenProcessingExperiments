
PImage space, space2, spaceShip, meteorite;
boolean game = true;
boolean started = false;
int y = 0;
int x = (int)(random(800));
//ArrayList<Meteorite> meteor = new ArrayList<Meteorite>;
void setup() {
  size(800, 500);
  noStroke();
  smooth();
  space = loadImage("space.jpg");
  space2 = loadImage("space2.jpg");
  spaceShip = loadImage("ship.png");
  meteorite = loadImage("meteor.png");
}

void mousePressed() { 
  if (game == true && started == false) {
    started = true;
  }
}
void draw() {
  if ( game == true && started == false) {
    background(space);
    textSize(40);
    fill(250);
    text("Never Stop Dodging ", width/4, height/5);
    textSize(40);
    fill(250);
    text("Click To Start Game ", width/4, height/2);
  }
  if ( game == true && started == true) {
    background(space2);
    image(spaceShip, mouseX-25, mouseY-25, 50, 50);
    
    
    if ( y < height) {
      image(meteorite, x, y, 20, 110);
      y+=3;
    } else { //off screen
        y = 0;
        x = (int)(random(800));
        image(meteorite, x, y, 20, 110);
        
    }
  }
}


