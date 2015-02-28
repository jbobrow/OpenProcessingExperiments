
import netscape.javascript.*;

PImage track;
PImage plate;
PImage fridge;
PImage hot;
PImage piz;
PImage bur;
PImage p;
PImage h;
PImage b;
PImage inst;
PVector currentP;
PVector currentP2;
PVector currentP3;
PVector l = new PVector(-5, 0);
PVector r = new PVector(5, 0);
PVector u = new PVector(0, -5);
PVector d = new PVector(0, 5);
String pizza = "pizza.png";
String hotdog = "hotdog.png";
String burrito = "burrito.png";
String msg = "wrong way!";
PVector pos = new PVector(20, 30);
PVector pos2 = new PVector(20, 60);
int bt_width = 100;
int bt_height = 25;
int myColor = color(206, 255, 245);
PGraphics ins;
PGraphics hid;
PFont font;




void setup() {
  size(800, 600);
  background(0);
  ins = createGraphics(width, height, P2D);
  hid = createGraphics(width, height, P2D);
  smooth();
  font = loadFont("OratorStd-48.vlw");
  textFont(font, 12);
  track =  loadImage("track.jpg");
  plate = loadImage("plate.png");
  fridge = loadImage("fridge.png");
  track.loadPixels();
  //track.resize(width,height);
  track.updatePixels();
  hot = loadImage(hotdog);
  piz = loadImage(pizza);
  bur = loadImage(burrito);
  inst = loadImage("inst.png");


  currentP = new PVector(650, 470);
  currentP2 = new PVector(650, 470);
  currentP3 = new PVector(650, 470);
}


void draw() {
  image(track, 0, 0);
  image(plate, 115, 450);
  image(piz, currentP.x, currentP.y);
  image(hot, currentP2.x, currentP2.y);
  image(bur, currentP3.x, currentP3.y);
  image(fridge, 660, 370);
  image(ins, 20, 90);

  btn(pos, "instructions");
  btn(pos2, "restart");
}

void popIns() {
  ins.beginDraw();
  ins.fill(myColor);
  ins.noStroke();
  ins.rect(0, 0, 100, 400);
  ins.image(inst, 3, 20);
  ins.endDraw();
}

void hideIns() {
  ins.beginDraw();
  smooth();
  ins.fill(0);
  ins.noStroke();
  ins.rect(0, 0, 100, 400);
  ins.endDraw();
}

void restart() {
  currentP = new PVector(650, 470);
  currentP2 = new PVector(650, 470);
  currentP3 = new PVector(650, 470);
}


void btn(PVector hi, String label) {
  fill(myColor);
  noStroke();
  rect(int(hi.x), int(hi.y), bt_width, bt_height);
  fill(0);
  text(label, hi.x + 5, hi.y + 16);
}

void selectIcon() {
  p = loadImage(pizza);
  h = loadImage(hotdog);
  b = loadImage(burrito);
}


void pizza() {
  PVector thingy;
  piz = p;

  if (keyCode == LEFT) {
    thingy = PVector.add(currentP, l);
    if (allowed(thingy) == true) {
      currentP = thingy;
    }
  } 
  else if (keyCode == RIGHT) {
    thingy = PVector.add(currentP, r);
    if (allowed(thingy) == true) {
      currentP = thingy;
    }
  } 
  else if (keyCode == UP) {
    thingy = PVector.add(currentP, u);
    if (allowed(thingy) == true) {
      currentP = thingy;
    }
  } 
  else if (keyCode == DOWN) {
    thingy = PVector.add(currentP, d);
    if (allowed(thingy) == true) {
      currentP = thingy;
    }
  } 
}


void hotd() {
  PVector thingy2;
  hot = h;

  if (keyCode == 65) {
    thingy2 = PVector.add(currentP2, l);
    if (allowed(thingy2) == true) {
      currentP2 = thingy2;
    }
  } 
  else if (keyCode == 68) {
    thingy2 = PVector.add(currentP2, r);
    if (allowed(thingy2) == true) {
      currentP2 = thingy2;
    }
  } 
  else if (keyCode == 87) {
    thingy2 = PVector.add(currentP2, u);
    if (allowed(thingy2) == true) {
      currentP2 = thingy2;
    }
  } 
  else if (keyCode == 83) {
    thingy2 = PVector.add(currentP2, d);
    if (allowed(thingy2) == true) {
      currentP2 = thingy2;
    }
  } 
}


void burrto() {
  PVector thingy3;
  bur = b;

  if (keyCode == 71) {
    thingy3 = PVector.add(currentP3, l);
    if (allowed(thingy3) == true) {
      currentP3 = thingy3;
    }
  } 
  else if (keyCode == 74) {
    thingy3 = PVector.add(currentP3, r);
    if (allowed(thingy3) == true) {
      currentP3 = thingy3;
    }
  } 
  else if (keyCode == 89) {
    thingy3 = PVector.add(currentP3, u);
    if (allowed(thingy3) == true) {
      currentP3 = thingy3;
    }
  } 
  else if (keyCode == 72) {
    thingy3 = PVector.add(currentP3, d);
    if (allowed(thingy3) == true) {
      currentP3 = thingy3;
    }
  } 
}


void keyPressed() {
  if (ins()) {
    hideIns();
  } 
  hotd();
  selectIcon();
  pizza();
  hotd();
  burrto();
}


void mousePressed() {
  if (ins()) {
    println("click for instructions"); 
    popIns();
  } 
  else if (res()) {
    restart();
    hideIns();
    println("restart");
  }
}



boolean ins() {
  if (mouseX >= pos.x && mouseX <= pos.x + bt_width && mouseY >= pos.y && mouseY <= pos.y + bt_height) {
    return true;
  }
  return false;
}

boolean res() {
  if (mouseX >= pos2.x && mouseX <= pos2.x + bt_width && mouseY >= pos2.y && mouseY <= pos2.y + bt_height) {
    return true;
  }
  return false;
}


boolean allowed(PVector test) {
  float value = brightness(track.get(int(test.x), int(test.y)));
  if (value > 0) {
    return true;
  } 
  else {
    println(msg);
    return false;
  }
}









