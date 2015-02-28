
Dropper dropper1, dropper2, dropper3, dropper4;
Cannon cannon;
Projectile projectile;

void setup(){
  size(400,400);
  background(255);
  smooth();
  cannon = new Cannon();
  projectile = new Projectile();
  dropper1 = new Dropper(1.9);
  dropper2 = new Dropper(4.5);
  dropper3 = new Dropper(7);
  dropper4 = new Dropper(3);
}

void draw(){
  background(255);
  
  dropper1.update();
  dropper1.display(1);

  dropper2.update();
  dropper2.display(2);
  
  dropper3.update();
  dropper3.display(3);

  dropper4.update();
  dropper4.display(4);
  
  projectile.update(10);
  projectile.display(1);

  cannon.update(10);
  cannon.display();
}
class Cannon {

  PVector loc = new PVector(); // Point of cannon base
  float cannonLength = 30;
  float radius = 20; // Size of cannon's base
  float posx, posy; // Directional point of cannon's barrel
  
  Cannon() {
    loc.x = width/2;
    loc.y = height;
  }
  
  void update(float speed) {
    
    // This creates the turret of the cannon that follows the mouse
    float angle = atan2(mouseY-loc.y,mouseX-loc.x);
    posx = (cannonLength * cos(angle)) + loc.x;
    posy = (cannonLength * sin(angle)) + loc.y;
    
      if(keyPressed && keyCode==LEFT && loc.x >= radius){
        loc.x -= speed;
      }
      if(keyPressed && keyCode==RIGHT && loc.x <= width-radius){
        loc.x += speed;
      }
    }
  
  void display() {
    fill(0);
    stroke(0);
    strokeWeight(10);
    strokeCap(SQUARE);
    ellipse(loc.x,loc.y,radius,radius);
    line(loc.x,loc.y,posx,posy);
  }
}
class Dropper {
  
  float posx, posy; // Current location of Dropper.
  float radius = 40;
  float fallspeed;
  int DropperColor;
  
// Two inputs for Dropper: color, and fallspeed.
  Dropper(float speed) {   
// Object appears on top page within a margin
    posx = random(radius, width-radius); 
    posy = 0;
    fallspeed = speed;
  }
  
  void update() {
    
    posy += fallspeed;
    
    if(posy >= height+radius){ //When Dropper hits bottom of page...
//  Score -= 1; //Lose one point
    posy = 0 - radius; //Reset Dropper
    posx = random(10, width-10); 
    }
  }

  void display(int DropperColor) {
    if(DropperColor == 1){ //1 = RED
      fill(255,0,0);}
    if(DropperColor == 2){ //2 = GREEN
      fill(0,255,0);}
    if(DropperColor == 3){ //3 = BLUE
      fill(0,0,255);}
    if(DropperColor == 4){ //4 = YELLOW
      fill(255,255,0);}
    noStroke();
    ellipse(posx,posy,radius,radius);
  }
}
  
class Projectile {

  PVector loc = new PVector(); // Point of cannon base
  float ProjDist = 30;
  float radius = 20; // Size of cannon's base
  float targetX, targetY; // Directional point of cannon's barrel
  float ProjX, ProjY; // Current position of Projectile.
  float velocity = 10;
  float easing = 0.01;
  
  float px;
  float py;
  
  int loaded = 1;
  
  
  Projectile() {
    loc.x = width/2;
    loc.y = height;
    ProjX = loc.x;
    ProjY = loc.y;
    px = loc.x;
    py = loc.y;
  }
  
  void update(float speed) {
    
// This creates the turret of the cannon that follows the mouse
    float angle = atan2(py-loc.y,px-loc.x);
    targetX = (ProjDist * cos(angle)) + loc.x;
    targetY = (ProjDist * sin(angle)) + loc.y;
    
// Base moves with cannon when LEFT and RIGHT are pressed.   
    if(keyPressed && keyCode==LEFT && loc.x >= radius){
      loc.x -= speed;
    }
    if(keyPressed && keyCode==RIGHT && loc.x <= width-radius){
      loc.x += speed;
    }
      
// Fires projectile when mouse clicked
  
    if(mousePressed) {
      
      px = mouseX;
      py = mouseY;
//      ProjX += (targetX - ProjX) * easing;
//      ProjY += (targetY - ProjY) * easing;
      ProjDist += velocity;
      ProjX = loc.x;
      ProjY = loc.y;
      ProjY += (targetY - ProjY) * easing;
    } else {
   //   ProjDist = 30;

      ProjX += (targetX - ProjX) * easing;
      ProjY += (targetY - ProjY) * easing;
    }
  
    if(ProjX >= width || ProjX <= 0 || ProjY <= 0) {
      
      ProjX = loc.x;
      ProjY = loc.y;
      ProjDist = 0;
      px = loc.x;
      py = loc.y; 
      
      


    }
    
  if(dist(ProjX,ProjY,loc.x,loc.y)<5){
    loaded = 1;
  }else{
    loaded = 0;
  }
 
  
  println(loaded);
    
 //     ProjX = loc.x;
 //     ProjY = loc.y;
  }
  
  void display(int ProjColor) {
    
    if(ProjColor == 1){ //1 = RED
      fill(255,0,0);}
    if(ProjColor == 2){ //2 = GREEN
      fill(0,255,0);}
    if(ProjColor == 3){ //3 = BLUE
      fill(0,0,255);}
    if(ProjColor == 4){ //4 = YELLOW
      fill(255,255,0);}

    ellipse(ProjX,ProjY,10,10);
    noStroke();
    strokeWeight(1);
    strokeCap(SQUARE);
    line(loc.x,loc.y,targetX,targetY);
  }
}


