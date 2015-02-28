
PFont Andale;
ArrayList mixed_shapes;
int focus;
int numero;
// *********************************************************************
void setup() {
  size(610, 690);
  colorMode(HSB);
  smooth();
  Andale = loadFont("AndaleMono-15.vlw");
  textFont(Andale, 15);
  numero = 0;
  focus  = 1;
  mixed_shapes = new ArrayList();
  for (int i = 0; i < 12; i++) {
    mixed_shapes.add(new Mixed(numero++));
  }
  rectMode(CENTER);
  textAlign(CENTER);
  strokeWeight(3);
  textLeading(20);
}

// *********************************************************************
// *********************************************************************
void draw() {
  background(0);
  text("frameRate = "+nf(frameRate,2,1)+"     nb of arrays = "+mixed_shapes.size(),305,685);

  translate(5,5);

  fill(45);
  if (mouseX < 600 & mouseY < 600) {
    rect(50+mouseX-(mouseX%100),50+mouseY-(mouseY%100), 100, 100);
  }
  rect(300,635,600,60);

  stroke(100);
  noFill();
  rect(50+(focus%6)*100,50+(focus-(focus%6))*100/6, 100, 100);
  noStroke();

  rect(50+mouseX-(mouseX%100),50+mouseY-(mouseY%100), 100, 100);

  fill(255);
  text("<N> to add a New array. <E> to Erase the focused array,\n<C> to Change its color,"+
    " <S> to change its Shape\nand <D> to duplicate it…but…oh no…what the F#*$", 300, 620);

  for (int i = mixed_shapes.size()-1; i >= 0; i--) {
    pushMatrix();
    translate(50+(i%6)*100,50+(i-(i%6))*100/6);
    Mixed m_s = (Mixed) mixed_shapes.get(i);
    m_s.draw_the_thing();
    popMatrix();
  }
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
      mixed_shapes.add(new Mixed(numero++));
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
    Mixed edit_s = (Mixed) mixed_shapes.get(focus);
    if (mixed_shapes.size() < 36) { 
      mixed_shapes.add(edit_s);//     <- here is the only thing I've found :^(
      focus = mixed_shapes.size()-1;
      /*
      Hi, there! Here is my problem:
      I want to duplicate an array, but I want it independent of
      its original array. As I've done here, if I modify one, the other
      is also modify. So I understand it's the same object. How can I do
      a copy of the object within the array. I tried the clone() method
      but I can't find out the good syntax. Or is it something else?
      
      Of course I could add a new array with a new objet and then fill it
      with the values of the original one, but this seems unrefined. And 
      would be laborious with more complexe objects. So… I can sing it…
      
      Help me, get my feet back on the ground,
      Won't you please, please help me, help meee, help meeee e ooooo
      */
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
  int     number;
  String  name;

  Mixed(int i) {
    number     = i;
    colo       = int(random(255));
    rando_base = random(-1,1);
    name       = "truc "+i;
  }
  // ************************************************************
  void draw_the_thing() {
    the_brightness = 55;
    scalus = 80;
    rando_iter = rando_base;
    rando_base = rando_base+.0001;
    pushMatrix();

    for (int i = 0; i < 20; i++) {
      fill(colo,255,the_brightness,100);
      rotate(rando_iter*PI);
      if (sin(rando_iter) > .6) {
        rect(0,0,sin(rando_iter*2)*scalus*2,sin(rando_iter*3)*scalus/6);
      } 
      else if (sin(rando_iter) > -.6) {
        ellipse(
        sin(rando_iter*2)*scalus/2,
        sin(rando_iter*3)*scalus/2,
        sin(rando_iter*4)*scalus/3,
        sin(rando_iter*4)*scalus/3);
      } 
      else {
        triangle(
        sin(rando_iter)*scalus/2,
        sin(rando_iter*2)*scalus/2,
        sin(rando_iter*3)*scalus/2,
        sin(rando_iter*4)*scalus/2,
        sin(rando_iter*5)*scalus/2,
        sin(rando_iter*6)*scalus/2);
      }
      the_brightness = the_brightness + 10;
      scalus = scalus*.99;
      rando_iter ++;
    }
    popMatrix();
    fill(colo,255,255);
    text(name,0,45);
  }
}  
// ************************************************************

