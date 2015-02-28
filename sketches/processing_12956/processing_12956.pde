
Room room1;
Room room2;
Room room3;
Room room4;

void setup(){
  size(200,200);
  
  room1 = new Room(color(255,0,0),0,100,2);
  room2 = new Room(color(0,0,255),0,50,1);
    room3 = new Room(color(0,150,0),0,200,3);
  room4 = new Room(color(0,0,20),0,150,4);
}

void draw(){
  background(255);
  room1.move();
  room1.display();
    room2.move();
  room2.display();
    room3.move();
  room3.display();
    room4.move();
  room4.display();
}

class Room{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Room(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
  void move(){
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


