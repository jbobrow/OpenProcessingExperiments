
Menu menu;
Damagochi damagochi;
Sb sb;

Button select, ok, cancel;
PImage image1, image2, image3, image4;
int savedTime;
int totalTime = 500;
int eatState = 0;
boolean eat = false;
boolean soccer = false;
boolean shower = false;
boolean status = false;
PFont f = createFont("Arial", 14);

void setup() {
  size(300, 400);

  textFont(f);
  textAlign(CENTER, CENTER);
  image1 = loadImage("image1.jpg");
  image2 = loadImage("image2.jpg");
  image3 = loadImage("image3.jpg");
  image4 = loadImage("image4.jpg");

  select = new Button(95, 330, 20, 20);
  select.setTitle("Select");
  ok = new Button(150, 330, 20, 20);
  ok.setTitle("Ok");
  cancel = new Button(205, 330, 20, 20);
  cancel.setTitle("Cancel");

  menu = new Menu();
  damagochi = new Damagochi(200, 250, 40, 5, 7);
  savedTime = millis();
  sb = new Sb(100, 150, 32);
}

void draw() {
  background(150);
  int passedTime = millis() - savedTime;
  ellipseMode(CENTER);
  noStroke();
  fill(100, 200, 255);
  ellipse(width/2, height/2, 280, 380);

  select.show();
  ok.show();
  cancel.show();
  rectMode(CENTER);
  stroke(255, 150, 255);
  fill(255, 230, 255);
  rect(width/2, height/2+15, 200, 130);
  stroke(255, 150, 255);
  fill(255, 255, 255);
  rect(width/2, height/2-70, 200, 40);
  int state = menu.getClickState();
  int daState = damagochi.getDamaState();
  switch(state) {
  case 1:
    image(image1, 60, 113, 36, 36);
    if (eat) {
      float b = 0;
      ellipse(150-b, 260, totalTime/20, totalTime/20);
      b = b+0.1;
      damagochi.eat1();
      if (passedTime>totalTime) {
        damagochi.eat2();
      }
      if (passedTime>totalTime*2) {
        savedTime = millis();
        b = 0;
      }
    } 
    else {
      damagochi.normal1();
      if (passedTime>totalTime) {
        damagochi.normal2();
      }
      if (passedTime>totalTime*2) {
        savedTime = millis();
      }
    }

    if (ok.over() && mousePressed) {
      eat = !eat;
    }

    break;
  case 2:
    image(image2, 108, 113, 36, 36);
    if (soccer) {
      damagochi.soccer1();
      sb.display();
      sb.move();
    } 
    else {
      damagochi.normal1();
      if (passedTime>totalTime) {
        damagochi.normal2();
      }
      if (passedTime>totalTime*2) {
        savedTime = millis();
      }
    }
    if (ok.over() && mousePressed) {
      soccer = !soccer;
    }
    break;
  case 3:
    image(image3, 152, 113, 36, 36);
    if (shower) {
      damagochi.shower1();
      damagochi.rain1();
      if (passedTime>totalTime) {
        damagochi.rain2();
        damagochi.shower2();
      }
      if (passedTime>totalTime*2) {
        savedTime = millis();
      }
    } 
    else {
      damagochi.normal1();
      if (passedTime>totalTime) {
        damagochi.normal2();
      }
      if (passedTime>totalTime*2) {
        savedTime = millis();
      }
    }
    if (ok.over() && mousePressed) {
      shower = !shower;
    }

    break;
  case 4:
    image(image4, 200, 113, 36, 36);
    if (status) {
      damagochi.status1();
    } 
    else { 
      damagochi.normal1();
      if (passedTime>totalTime) {
        damagochi.normal2();
      }
      if (passedTime>totalTime*2) {
        savedTime = millis();
      }
    }
    if (ok.over() && mousePressed) {
      status = !status;
    }
    break;
  default:
    damagochi.normal1();
    if (passedTime>totalTime) {
      damagochi.normal2();
    }
    if (passedTime>totalTime*2) {
      savedTime = millis();
    }
    break;
  }
}

void mousePressed() {
  int state = menu.getClickState();
  int daState = damagochi.getDamaState();
  if (select.over()) {
    menu.click();
  }
  if (cancel.over()) {
    menu.cancel();
  }
}

class Button {
  
  // instance variables
  int cirX, cirY;
  int cirW;
  int cirCenterX, cirCenterY;
  String buttonTitle = "button";
  PFont buttonFont;
  
  // constructor
  Button(int x, int y, int w, int h) {
    cirX = x;
    cirY = y;
    cirW = w;
    cirCenterX = x + w/2;
    cirCenterY = y + w/2;
    buttonFont = createFont("Arial", 14);
  }
  
  // show button
  void show() {    
    textFont(buttonFont);
    if (over()) {
      fill(255,255,0,255);
    } else {
      fill(255,255,150,255);
    }
    ellipseMode(CENTER);
    stroke(255,165,0,255);
    ellipse(cirX, cirY, cirW, cirW);
    textAlign(CENTER, CENTER);
    fill(50);
    text(buttonTitle, cirCenterX-10, cirCenterY+10);   
  }
  
  // set button title
  void setTitle(String title) {
    buttonTitle = title;
  }
  
  // check if mouse pointer is on the button
  boolean over() {
    if (mouseX > cirX-cirW && mouseY > cirY-cirW && mouseX < cirX+cirW && mouseY < cirY+cirW) {
      return true;
    } else {
      return false;
    }
  } 
}

class Damagochi {
  float dx;
  float dy;
  float dw;
  int dm;
  int de;
  int damaState;
  float speed;
  float c;

  Damagochi(float _x, float _y, float _w, int _m, int _e) {
    dx = _x;
    dy = _y;
    dw = _w;
    dm = _m;
    de = _e;
    damaState = 0;
    speed = -1;
    c = 250;
  }

  int getDamaState() {
    return damaState;
  }

  void okClick() {
    if (ok.over()) {
      damaState = menu.getClickState();
    }
  }

  void normal1() {
    stroke(0);
    fill(c);
    ellipse(dx, dy, dw, dw);
    line(dx-15, dy-de, dx-5, dy-7);
    line(dx+5, dy-7, dx+15, dy-de);
    ellipse(dx, dy+5, dm, dm);
  }

  void normal2() {
    stroke(0);
    fill(c);
    ellipse(dx, dy, dw, dw);
    line(dx-15, dy-de+2, dx-5, dy-7);
    line(dx+5, dy-7, dx+15, dy-de+2);
    ellipse(dx, dy+5, dm+2, dm+2);
  }

  void eat1() {
    stroke(0);
    fill(c);
    ellipse(dx-10, dy, dw, dw);
    line(dx-20, dy-de, dx-10, dy-de+2);
    stroke(100);
    line(dx-30, dy+5, dx-10, dy+5);
    line(dx-15, dy+20, dx-10, dy+5);
    dw = dw + 0.01;
    dy = dy - 0.005;
  }
  void eat2() {
    stroke(0);
    fill(c);
    ellipse(dx-10, dy, dw, dw);
    line(dx-20, dy-de, dx-10, dy-de+2);
    stroke(100);
    line(dx-20, dy+15, dx-10, dy+5);
    line(dx-25, dy+10, dx-10, dy+5);
  }
  void soccer1() {
    stroke(0);
    fill(c);
    ellipse(dx-10, dy, dw, dw);
    line(dx-15, dy-de-2, dx-5, dy-7);
    line(dx+5, dy-7, dx+15, dy-de-2);
    line(dx-3, dy+5, dx+3, dy+5);
    dw = dw - 0.01;
    dx = dx + speed;
    c = c - 0.1;
    if ((dx < 80)|| (dx>230)) {
      speed = speed * -1;
    }
  }

  void shower1() {
    stroke(0);
    fill(c);
    ellipse(dx, dy, dw, dw);
    line(dx-15, dy-de+2, dx-5, dy-7);
    line(dx+5, dy-7, dx+15, dy-de+2);
    ellipse(dx, dy+5, dm+2, dm+2);
    c = c + 0.1;
  }

  void shower2() {
    stroke(0);
    fill(c);
    ellipse(dx, dy-2, dw, dw);
    line(dx-15, dy-de+2, dx-5, dy-7);
    line(dx+5, dy-7, dx+15, dy-de+2);
    ellipse(dx, dy+5, dm+4, dm+4);
  }

  void rain1() {
    stroke(150);
    line(100, 160, 100, 190);
    line(130, 170, 130, 200);
    line(80, 200, 80, 230);
    line(150, 180, 150, 210);
    line(180, 190, 180, 220);
    line(220, 150, 220, 180);
    line(230, 170, 230, 200);
    line(60, 210, 60, 240);
  }
  
  void rain2() {
    rectMode(CENTER);
  stroke(255, 150, 255);
  fill(255, 230, 255);
  rect(width/2, height/2+15, 200, 130);
    stroke(150);
    line(100, 210, 100, 240);
    line(130, 220, 130, 250);
    line(80, 250, 80, 280);
    line(150, 230, 150, 260);
    line(180, 240, 180, 270);
    line(220, 200, 220, 230);
    line(230, 220, 230, 250);
    line(60, 150, 60, 180);
    line(190,170,190,200);
    line(160,180,160,210);
  }
  
  void status1() {
    fill(0);
    textFont(f, 30);
    text("Weight" + " : " + dw, 150, 180);
    textFont(f, 24);
    text("Cleaness" + " : " + c, 150, 220);
    textFont(f, 18);
    text("Copyright by Sunjae", 150, 260);
  }
}

class Menu {
  float menuX, menuY;
  int clickState;
  PImage image1, image2, image3, image4;

  Menu() {
    menuX = width/2;
    menuY = height/2-70;
    clickState = 0;
  }

  int getClickState() {
    return clickState;
  }

  void click() {
    if (select.over()) {
      clickState = (clickState +1) % 5;
    }
  }
  
  void cancel(){
    clickState = 0;
  }
}

class Sb {
  float x;
  float y;
  float xspeed;
  float yspeed;
  float w;
  float gravity = 0.1;

  Sb(float xpos, float ypos, float ww) {
    x = xpos;
    y = ypos;
    w = ww;
    xspeed = 2;
    yspeed = 0;
  }

  void display() {
    fill(255);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(x, y, w, w);
  }

  void move() {
    y = y + yspeed;
    x = x + xspeed;
    yspeed = yspeed + gravity;
    if ((x<80) || (x>230)){
      xspeed = xspeed * -1;
    }
    if(y>250){
      yspeed = yspeed * -0.95;
    }
  }
}



