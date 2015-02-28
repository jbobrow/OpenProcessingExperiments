
PImage map, ui1, ui2, p1,p2;

PFont font; 

void setup() {

  size(800, 600);

  map = loadImage("map.jpg");
  ui1 = loadImage("UI.png");
  ui2 = loadImage("UI2.png");
  p1 = loadImage("linmushitang.jpg");
  p2 = loadImage("xiyangguozi.jpg");

}

void draw() {

  image(map, 0, 0);

  image(ui1, 70, 180);
  image(ui2, 147, 233);
  image(ui1, 70, 305);
  image(ui1, 220, 375);
  image(ui2, 500, 295);
  image(ui2, 605, 390);
  image(ui1, 635, 415);
  image(ui2, 550, 510);
  
  noFill();
  smooth();
  strokeWeight(1);
  stroke(#ff415b);
  bezier(609, 410, 499,404,525, 320,515,325);
  bezier(505,312,505, 280, 176, 245,176,245);

  font = createFont("April", 16);
  fill(#ff415b);
  smooth();
  textFont(font, 12);
  text("Cheese Cake!", 420, 320);
  text("India", 70, 285);
  text("Restaurant",35,300);
  text("Milky Tea",495,530);

  frameRate(8);
  fill(255,random(120,200),random(150,200));
  noStroke();  
  beginShape();
  vertex(674, 432);
  vertex(683, 422);
  vertex(683, 427);
  vertex(696, 427);
  vertex(696, 437);
  vertex(683, 437);
  vertex(683, 442);
  endShape(CLOSE);

  frameRate(8);
  fill(255,random(120,200),random(150,200));
  noStroke();  
  beginShape();
  vertex(139, 248);
  vertex(128, 258);
  vertex(128, 253);
  vertex(116, 253);
  vertex(116, 243);
  vertex(128, 243);
  vertex(128, 238);
  endShape(CLOSE);

int x = mouseX;
int y = mouseY;

  if((x>635) && (x<665) && (y>415) && (y<445)){
    fill(255);
    strokeWeight(2);
    stroke(#fcb1ca);
    rect(280, 40, 400, 200, 10);
    strokeWeight(1);
    image(p1, 290, 48);
    font = createFont("April", 16);
    fill(0);
    textFont(font, 15);
    text("SUZUKI", 625, 210);
    text("KITCHEN", 614, 233);
  } 
  if ((x>147) && (x<177) && (y>233) && (y<263)){
    fill(255);
    strokeWeight(2);
    stroke(#fcb1ca);
    rect(280, 40, 400, 200, 10);
    strokeWeight(1);
    image(p2, 290, 48);
    font = createFont("April",16);
    fill(0);
    textFont(font, 15);
    text("WESTERN", 588, 210);
    text("FRUIT & CAKE", 578, 233);
  } 
}





