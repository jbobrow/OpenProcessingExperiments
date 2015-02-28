
Dropper dropper1, dropper2, dropper3, dropper4;
Cannon cannon;
Projectile projectile;
PFont font;
int fontSize = 30;
int fillColor = 1;
int score = 0;

void setup(){
  size(600,600);
  background(54,22,22);
  noSmooth();
  textMode(CENTER);
  font = loadFont("LevenimMT-Bold-30.vlw");
  textFont(font);
  cannon = new Cannon();
  projectile = new Projectile();
  dropper1 = new Dropper(random(.1,1));
  dropper2 = new Dropper(random(.1,1));
  dropper3 = new Dropper(random(.1,1));
  dropper4 = new Dropper(random(.1,1));
}

void draw(){
  background(54,22,22);
  textSize(30);
  fill(255);
  text("Score: ", width/2 - 30, height/2);
  text(score, width/2 + 100,height/2);
 
  if(keyPressed && key == '1'){
    fillColor = 1;}
  if(keyPressed && key == '2'){
    fillColor = 2;}
  if(keyPressed && key == '3'){
    fillColor = 3;}
  if(keyPressed && key == '4'){
      fillColor = 4;}
    
  dropper1.update();
  dropper1.display(1);

  dropper2.update();
  dropper2.display(2);
  
  dropper3.update();
  dropper3.display(3);

  dropper4.update();
  dropper4.display(4);
  
  projectile.update(10);
  projectile.display(fillColor);

  cannon.update(10);
  cannon.display(fillColor);
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
    
  
  void display(int CanColor) {
    
    if(CanColor == 1){ //1 = RED
      fill(255,0,0);}
    if(CanColor == 2){ //2 = GREEN
      fill(0,255,0);}
    if(CanColor == 3){ //3 = BLUE
      fill(0,0,255);}
    if(CanColor == 4){ //4 = YELLOW
      fill(255,255,0);}

    stroke(120,120,135);
    strokeWeight(10);
    strokeCap(SQUARE);
    line(loc.x,loc.y,posx,posy);
    ellipse(loc.x,loc.y,radius,radius);
  }
}

class Dropper {

  float posx, posy; // Current location of Dropper.
  float radiu = 40;
  float fallspeed;
  int DropperColor;
  float hit;
  float a;
  
// Two inputs for Dropper: color, and fallspeed.
  Dropper(float speed) {   
// Object appears on top page within a margin
    posx = random(radiu, width-radiu); 
    posy = 0;
    fallspeed = speed;
    hit = 0;
    a = 255;
    
  }
  
  void update() {
    
    posy += fallspeed + (score * .01);
    
    if(posy >= height+radiu){ //When Dropper hits bottom of page...
    posy = 0 - radiu; //Reset Dropper
    posx = random(10, width-10); 
    a = 255;

    }
  }

  void display(int DropperColor) {
    if(DropperColor == 1){ //1 = RED
      fill(255,0,0,a);}
    if(DropperColor == 2){ //2 = GREEN
      fill(0,255,0,a);}
    if(DropperColor == 3){ //3 = BLUE
      fill(0,0,255,a);}
    if(DropperColor == 4){ //4 = YELLOW
      fill(255,255,0,a);}
      
      if(dist(posx,posy,projectile.ProjX,projectile.ProjY)<radiu/2
         && hit == 0 && projectile.loaded == 0){
        if(DropperColor == fillColor){
          println("BOOM!");
          hit = 1;
          score += 5;
        } else{
          projectile.kill =1;
          score --;
        }
      }
      
      if(hit == 1){
        a-=25;
      }
      
      if(a <= 0){
        hit = 0;
        posy = height*2;
        
      }
      

      
      
    noStroke();
    ellipse(posx,posy,radiu,radiu);
  }
}
  
class Projectile {

  PVector loc = new PVector(); // Point of cannon base
  float ProjDist = 0; // Distance of target for Projectile to travel.
  float radius = 20; // Size of cannon's base
  float targetX, targetY; // Directional point of cannon's barrel
  float ProjX, ProjY; // Current position of Projectile.
  float velocity = 100; // Rate at which ProjDist increases.
  float easing = 0.001;
  int kill = 0; // Used to reset Projectile when hitting wrong ball.
  float px;
  float py;
  int loaded = 1; // Determines if Projectile loaded in cannon.
  float locx;
  float locy;
  
  
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
    float angle = atan2(py-locy,px-locx);
    targetX = (ProjDist * cos(angle)) + locx;
    targetY = (ProjDist * sin(angle)) + locy;
    
// Base moves with cannon when LEFT and RIGHT are pressed.   
    if(keyPressed && keyCode==LEFT && loc.x >= radius){
      loc.x -= speed;
      if(loaded == 1){
      ProjX = loc.x;
      }
    }
    if(keyPressed && keyCode==RIGHT && loc.x <= width-radius){
      loc.x += speed;
      if(loaded == 1){
      ProjX = loc.x;
      }
    }
      
// Fires projectile when mouse clicked and Projectile loaded.
    if(mousePressed && loaded==1) {
   
     loaded = 0;
      
      if(ProjDist == 0){
        ProjDist = height*2;
      }
      // px, py set temporary mouse position while button is held.
      px = mouseX;
      py = mouseY;
      ProjDist += velocity;
      ProjX = loc.x;
      ProjY = loc.y;
      } else {
      ProjX += (targetX - ProjX) * easing;
      ProjY += (targetY - ProjY) * easing;
      locx = loc.x;
      locy = loc.y;
      }
     
// Resets Projectile when off the screen or upon hitting wrong color.
    if(ProjX >= width || ProjX <= 0 || ProjY <= 0 || kill == 1) {      
      ProjX = loc.x;
      ProjY = loc.y;
      ProjDist = 0;
      px = loc.x;
      py = loc.y; 
      ProjDist = 0;
      kill = 0;
    }

// Monitors if Projectile is loaded by checking relative position to cannon.
    if(dist(ProjX,ProjY,loc.x,loc.y)<5){
      loaded = 1;
    } else{
      loaded = 0;
    }
 
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


