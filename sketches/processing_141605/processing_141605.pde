
Dropper dropper1, dropper2, dropper3, dropper4;

void setup(){
  size(400,400);
  background(0);
  smooth();
  
  dropper1 = new Dropper(1.9);
  dropper2 = new Dropper(4.5);
  dropper3 = new Dropper(7);
  dropper4 = new Dropper(3);
}

void draw(){
  background(0);
  
  dropper1.update();
  dropper1.display(1);

  dropper2.update();
  dropper2.display(2);
  
  dropper3.update();
  dropper3.display(3);

  dropper4.update();
  dropper4.display(4);

}
class Dropper {
  
  float posx, posy;
  float radius = 40;
  float fallspeed;
  
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
  
  void display(int dropperColor) {
  
    if(dropperColor == 1){ //1 = RED
      fill(255,0,0);}
    if(dropperColor == 2){ //2 = GREEN
      fill(0,255,0);}
    if(dropperColor == 3){ //3 = BLUE
      fill(0,0,255);}
    if(dropperColor == 4){ //4 = YELLOW
      fill(255,255,0);}
  
    noStroke();
    ellipse(posx,posy,radius,radius);
  }
}
  
