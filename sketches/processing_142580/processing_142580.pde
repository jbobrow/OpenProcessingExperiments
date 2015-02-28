
Dropper dropper1, dropper2, dropper3, dropper4;
Cannon cannon;

void setup(){
  size(400,400);
  background(255);
  smooth();
  cannon = new Cannon();
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

  cannon.update();
  cannon.display();
}
class Cannon {

  PVector loc = new PVector(); // Point of cannon base
  float cannonLength = 30;
  float radius = 20; // Size of cannon's base
  float posx, posy; // Directional point of cannon's barrel
  float speed = 1;
  
  Cannon() {
    loc.x = width/2;
    loc.y = height;
  }
  
  void update() {
    
    // This creates the turret of the cannon that follows the mouse
    float angle = atan2(mouseY-loc.y,mouseX-loc.x);
    posx = (cannonLength * cos(angle)) + loc.x;
    posy = (cannonLength * sin(angle)) + loc.y;
    
      if(keyPressed && keyCode==LEFT && !(keyCode==RIGHT)){
        loc.x -= 1;
      }
      if(keyPressed && keyCode==RIGHT && !(keyCode==LEFT)){
        loc.x += 1;
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
  
  float posx, posy;
  float radius = 40;
  float fallspeed;
  int DropperColor;
  
  //Two inputs for Dropper: color, and fallspeed.
  Dropper(float speed) {   
    //object appears on top page within a margin
    posx = random(radius, width-radius); 
    posy = 0;
    fallspeed = speed;
  }
  
  void update() {
    
    posy += fallspeed;
    
    if(posy >= height+radius){ //When Dropper hits bottom of page...
//    score -= 1; //Add one point
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
  


