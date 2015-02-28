
PFont Andale;
ArrayList mixed_shapes;
int focus;
// *********************************************************************
void setup() {
  size(610, 675);
  colorMode(HSB);
  smooth();
  Andale = loadFont("AndaleMono-15.vlw");
  textFont(Andale, 15);
  focus  = 0;
  mixed_shapes = new ArrayList();
  mixed_shapes.add(new Mixed());
  rectMode(CENTER);
  textAlign(CENTER);
  strokeWeight(3);
  textLeading(20);
}

// *********************************************************************
// *********************************************************************
void draw() {
  background(128);
  translate(5,5);
  fill(110);
  if (mouseX+5 < 600 & mouseY+5 < 600) {
    rect(50+mouseX+5-((mouseX+5)%100),50+mouseY+5-((mouseY+5)%100), 100, 100);
  }
  for (int i = mixed_shapes.size()-1; i >= 0; i--) {
    pushMatrix();
    translate(50+(i%6)*100,50+(i-(i%6))*100/6);
    Mixed m_s = (Mixed) mixed_shapes.get(i);
    m_s.draw_the_thing();
    popMatrix();
  }
  fill(70);
  rect(300,635,600,60);
  fill(255);
  text("<N> to add a New array. <E> to Erase the focused array,\n<C> to change its Color,"+
    " <S> to change its Shape\nand <D> to duplicate it. Thank you Dr Sinan.", 300, 620);
  stroke(255);
  noFill();
  rect(50+(focus%6)*100,50+(focus-(focus%6))*100/6, 100, 100);
  noStroke();
}

// *********************************************************************
// *********************************************************************
void mousePressed() {
  if (mouseX < 600 & mouseY < 600) {
    focus = min(int(mouseX/100)+int(mouseY/100)*6,mixed_shapes.size()-1);
  }
}
// *********************************************************************
void keyPressed() {
  // ************************************************************
  if (key == 'n' || key == 'N') {
    if (mixed_shapes.size() < 36) { 
      mixed_shapes.add(new Mixed());
      focus = mixed_shapes.size()-1;
    }
  }
  // ************************************************************
  if (key == 'e' || key == 'E') {
    if (mixed_shapes.size()>1) {
      mixed_shapes.remove(focus);
      focus = (focus>0) ? focus-1 : 0;
    }
  }
  // ************************************************************
  if (key == 'c' || key == 'C') {
    Mixed edit_s = (Mixed) mixed_shapes.get(focus);
    edit_s.colo = int(random(255));
  }
  // ************************************************************
  if (key == 's' || key == 'S') {
    Mixed edit_s = (Mixed) mixed_shapes.get(focus);
    edit_s.rando_base = random(-1,1);
  }
  // ************************************************************
  if (key == 'd' || key == 'D') {
    Mixed edit_s = ((Mixed) mixed_shapes.get(focus)).cloneMe();
    if (mixed_shapes.size() < 36) { 
      mixed_shapes.add(edit_s);
      focus = mixed_shapes.size()-1;
    }
  }
  // ************************************************************
}

// *********************************************************************
// *********************************************************************
class Mixed {
  int     colo;
  float   rando_base;
  float   rando_iter;
  int     the_brightness;
  float   scalus;
  // ************************************************************
  Mixed() {
    colo       = int(random(255));
    rando_base = random(-1,1);
  }
  // ************************************************************
  void draw_the_thing() {
    the_brightness = 0;
    scalus = 80;
    rando_iter = rando_base;
    rando_base = rando_base+.0001;
    pushMatrix();

    for (int i = 0; i < 26; i++) {
      fill(colo,255,the_brightness,255);
      rotate(rando_iter*PI);
      if (sin(rando_iter) > .6) {
        rect(0,0,sin(rando_iter*2)*scalus*2,sin(rando_iter*3)*scalus/6);
      } 
      else if (sin(rando_iter) > -.1) {
        ellipse(
        sin(rando_iter*2)*scalus/2,
        sin(rando_iter*3)*scalus/2,
        sin(rando_iter*4)*scalus/3,
        sin(rando_iter*4)*scalus/3);
      } 
      else if (sin(rando_iter) > -.93){
        triangle(
        sin(rando_iter)*scalus/2,
        sin(rando_iter*2)*scalus/2,
        sin(rando_iter*3)*scalus/2,
        sin(rando_iter*4)*scalus/2,
        sin(rando_iter*5)*scalus/2,
        sin(rando_iter*6)*scalus/2);
      }
      else if (sin(rando_iter) > -.95){
        rect(0,0,sin(rando_iter*2)*scalus*18,sin(rando_iter)*scalus/24);
      }
      else {
        ellipse(
        sin(rando_iter*2)*scalus*9,
        sin(rando_iter*3)*scalus/2,
        sin(rando_iter*4)*scalus/6,
        sin(rando_iter*4)*scalus/6);
      } 
      the_brightness = the_brightness + 10;
      scalus = scalus*.99;
      rando_iter ++;
    }
    popMatrix();
  }
  // ************************************************************
  Mixed cloneMe(){
    Mixed newObject      = new Mixed();
    newObject.colo       = this.colo;
    newObject.rando_base = this.rando_base;
    return newObject;
  }
}
// ************************************************************

