
PImage PlayershootFrames[] = new PImage[4];
PImage PlayerstandFrames[] = new PImage[5];
PImage PlayerwalkFrames[] = new PImage[4];
PImage GhostmoveFrames[] = new PImage[5];
PImage GhostdieFrames[] = new PImage[5];
PImage bullet[] = new PImage[1];
PImage background;
Background BG;
boolean test = false;
Player Player1;


//Ghost Ghosts[] = new Ghost[7];
ArrayList<Ghost> Ghosts = new ArrayList();
ArrayList<bullet> bt = new ArrayList();
int ghostCounter = 100; 

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  imageMode(CENTER);
  background = loadImage("Background.png");
  size(background.width, background.height);
  //load standing frames for player
  for (int i = 0; i < PlayerstandFrames.length; i++) {
    PlayerstandFrames[i] = loadImage("Playerstand-" + i + ".png");
  }
  //Load walk frames for player
  for (int i = 0; i < PlayerwalkFrames.length; i++) {
    PlayerwalkFrames[i] = loadImage("Playerwalk-" + i + ".png");
  }
  //Load shooting frames for player
  for (int i = 0; i < PlayershootFrames.length; i++) {
    PlayershootFrames[i] = loadImage("Playershoot-" + i + ".png");
  }

  //Load Ghost move frames
  for (int i=0; i < GhostmoveFrames.length; i++) { 
    GhostmoveFrames[i] = loadImage("Ghostmove-" + i + ".png");
  }
    for (int i=0; i < GhostdieFrames.length; i++) { 
    GhostdieFrames[i] = loadImage("Ghostdie-" + i + ".png");
  }

  BG = new Background();
  Player1 = new Player();
  for (int i=0; i < bullet.length; i++) { 
    bullet[i] = loadImage("bullet-" + i + ".png");
  }

  //for (int i=0; i <Ghosts.length; i++) {
  //  Ghosts[i] = new Ghost();
  //}

  // add one ghost
  Ghosts.add( new Ghost() );
  bt.add(new bullet(Player1.x,Player1.flip) );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() { 
  BG.display();
 
     
    for (int t=0; t < bt.size(); t++) {
 bullet b = bt.get(t); 
    b.display(); 
  for (int i=0; i < Ghosts.size(); i++) {
    Ghost g = Ghosts.get(i); 
    g.display();
    g.move();
      
      if ( collides(Player1.x, Player1.y, Player1.radius, g.x, g.y, g.radius) == true ) {
      // yep, we have a collision
      text("OUCH!", Player1.x, Player1.y-50);
      //Ghosts.remove(g);
    }
       

 
  pushMatrix();
     if ( collides(b.x, b.y, b.radius, g.x, g.y, g.radius) == true ) {
      // yep, we have a collision
      text("OUCH!", g.x, g.y-50);
      g.dead();
      Ghosts.remove(g);
      bt.remove(b);
    }
       popMatrix();
    
    // do the collisions between bullets and ghosts 
    // compare each bullet with each ghost 
    // if youffind a collision
    //   Ghosts.remove(g);  // also remove the bullet probably..
  }
  }

  // display the bullets
  //for (int i=0; i < bt.size(); i++) {
    //bullet b = bt.get(i); 
   // b.display();
  //}

  if (mousePressed == true) {
    Player1.shoot();
  }
  else if (keyPressed == true) {
    if (keyCode == LEFT) Player1.moveLeft();
    if (keyCode == RIGHT) Player1.moveRight();
    if (key == ' ') Player1.shoot();
  }
  else {
    Player1.stand();
  }


  Player1.display();

  if (Player1.x < 0) Player1.x = width;
  if (Player1.x > width) Player1.x = 0; 

  // update the ghost counter
  ghostCounter--; 
  if (ghostCounter == 0) {
    // make a new ghost
    Ghosts.add( new Ghost() );
    ghostCounter = (int)random(100, 200);
  }
}

void mouseMoved() {
  Player1.moveMouse();
}

void mouseClicked() {
  bt.add(new bullet(Player1.x,Player1.flip) );
}

void keyPressed() {
  if (key == ' ') bt.add(new bullet(Player1.x,Player1.flip) );
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Player {

  int frame; // current animation frame
  int flip; // 1 -> facing right, -1 -> facing left 
  //seperate the mouseX and mouseY to a variable of X, Y so that you can create another player, meaning its more flexible now to create a new character with different elements.
  float x;
  float y;

  PImage[] animation;

  float radius;  // used for collisions  

    Player() { // constructor 
    frame = 0; 
    flip = 1;
    radius = 18;
    animation = PlayerstandFrames;
    y = 575;
  }

  void display() {

    // animate
    //% the remainder of a division, to show a repeating pattern. so from 
    if (frameCount % 4 == 0) frame++;
    if (frame >= animation.length) frame = 0;

    pushMatrix();

    translate(x, y);
    scale(flip, 1); 
    image (animation[frame], 0, 0);      
    if (test == true) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }
    popMatrix();
  }


  void moveMouse() {
    x = mouseX;
    //y = mouseY;   
    y = 575; 

    //flip variable, based on previous mouse position to the actual position it will change.   
    if ( pmouseX < mouseX ) flip = 1; 
    if ( mouseX < pmouseX ) flip = -1;

    animation = PlayerwalkFrames;
  }

  void moveLeft() {
    flip = 1; 
    x -= 5;   
    animation = PlayerwalkFrames;
  }

  void moveRight() {
    flip = -1;
    x += 5;   
    animation = PlayerwalkFrames;
  }

  void shoot() {
    animation = PlayershootFrames;
  }

  void stand() {
    animation = PlayerstandFrames;
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Ghost {
  int frame; // current animation frame
  int flip; // 1 -> facing right, -1 -> facing left 

  float x;
  float y; 

  float radius;

  float speedX; 
  float speedY; 
  
  boolean alive;

  Ghost() { // constructor 
    frame = 0; 
    flip = 1; 
    x = 1150; 
    y = 585;

    speedX = random(2, -2); 
    speedY = random(-2, 2);

    radius = 20;
  }

  void display() {
    pushMatrix(); 
    translate(x, y); 
    scale(flip, 1); 
    image(GhostmoveFrames[frame], 0, 0);

    if (test == true) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    } 

    popMatrix();
  }

  void move() {    
    x -= speedX;
    y = 585; 

    if ( x < 10 || x > width ) speedX *= -1; 
    if ( y < 0 || y > height ) speedY *= -1;  

    if ( speedX < 0 ) flip = -1; 
    if ( speedX > 0 ) flip = 1; 

    if (frameCount % 4 == 0) frame++;
    if (frame >= GhostmoveFrames.length) frame = 0;
  }
   void dead() {
    pushMatrix(); 
    translate(x, y); 
    scale(flip, 1); 
    image(GhostdieFrames[frame], 0, 0);
  popMatrix();
    if (test == true) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    } 
 if (frameCount % 1 == 0) frame++ ;
    if (frame >= GhostmoveFrames.length) frame = 5; 
 }

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Background { 
  float x;
  float y;

  Background() {
    x = 0;
    y = 0;
  }

  void display() {

    image(background, 642.5, 401.5);
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class bullet {
  float x;
  int frame;
  float y;
  float speed = 5;
  float flip;
  float radius;

  // constructor
  bullet(float startX, float flip) {
    x = startX;
    speed = speed * -flip;
    this.flip = -flip;
    y = 585;
    radius = 15;
  }

  void display() {
    pushMatrix();
    translate(x,y);
    scale(flip,1);
    image(bullet[0], 0, 0);

    x = x + speed;
 
    popMatrix();
    if (x > width) {
      bt.remove(this); // inverting the sign
    }
       if (test == true) {
      noFill();
      stroke(255);
      ellipse(x,585,radius,radius);
    } 
   
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////.
boolean collides(float x1, float y1, float radius1, 
float x2, float y2, float radius2) {                   
  float distance = dist(x1, y1, x2, y2); 
  if ( distance < radius1 + radius2 ) {
    return true;
  }
  else {
    return false;
  }
}
 


