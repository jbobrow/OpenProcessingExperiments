
//Tile test = new Tile();
Tile[] tileList = new Tile[28];

boolean move = false;

float random_color;


void setup() {
  size(700, 400);

  //test.position(0, 0);

  for (int i = 0; i <tileList.length; i++) {
    tileList[i] = new Tile();
    if (i<7) {
      tileList[i].position(100*i, 0);
    }
    else if (i<14) {
      tileList[i].position(100*(i-7), 100);
    }
    else if (i<21) {
      tileList[i].position(100*(i-14), 200);
    }
    else if (i<28) {
      tileList[i].position(100*(i-21), 300);
    }
    
    tileList[i].col = color(255, 255, 255);
    
  }
}


void draw() {
  background(255);

  //test.display();

  for (int i =0; i < tileList.length; i++) {
    tileList[i].display();
    if (move == true) {
      tileList[i].motion();
    }
  }
}


void keyPressed() {
  if (key == ENTER) {
    move = !move;
  }
  
  if(key == ' '){
    random_color = random(255);
    for (int i = 0; i <tileList.length; i++){
      tileList[i].col = color(random_color, 255, 255);
    }
  }
}

class Tile {

  float x;
  float y;
  float centerx;
  float centery;
  float speedx;
  float speedy;
  color col;


  void position(float a, float b) {
    colorMode(HSB);
    
    x=a;
    y=b;
    centerx = x + 50;
    centery = y + 50;
    speedx= random(-5, 5);
    speedy= random(-5, 5);

    
    col = color(random(255), 255, 255);
  }

  void motion() {
    centerx = centerx+speedx;
    centery = centery + speedy;
    if (centerx > x+100) {
      speedx = -speedx;
    }
    if (centerx < x) {
      speedx=-speedx;
    }
    if (centery > y+100) {
      speedy = -speedy;
    }
    if (centery < y) {
      speedy= -speedy;
    }
  }



  void display() {
    stroke(col);
    line(x, y, centerx, centery);  
    line(x+50, y, centerx, centery);
    line(x+100, y, centerx, centery);
    line(x, y+50, centerx, centery);
    line(x, y+100, centerx, centery);
    line(x+50, y+100, centerx, centery);
    line(x+100, y+100, centerx, centery);
    strokeWeight(2);
    line(x+100, y+50, centerx, centery);
  }
}



