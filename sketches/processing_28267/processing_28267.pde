
PFont textx;
PFont texty;
PImage photosy;
PImage mito;
PImage pe;
PImage re;
PImage fe;
int x = 10;
CircleButton circle1, circle2, circle3;
int buttoncolor = #00E3FF;
int highlight = #000000;
boolean locked = false;

void setup() {
  size(800,500);
  background(35,235,25);
  smooth();
  stroke(255,255,0);
  fill(255,255,0);
  rect(0,0,800,30);
  ellipse(800,0,200,200);
  fill (0);
  textx = loadFont("NewsGothicMT-16.vlw");
  textFont(textx, 16);
  text("Photosynthesis and Respiration",560,15);
  circle1 = new CircleButton(175, 45, 20, 255, 0);
  circle2 = new CircleButton(456, 45, 20, 255, 0);
  circle3 = new CircleButton(765, 45, 20, 255, 0);
  text("Learn the Basics", 10, 60);
  text("Vocabulary & Definitions", 230, 60);
  text("Fermentation",560, 60);
  text("A Project By Riley Galloway & Sierra Hearn", 0, 15);
  photosy = loadImage("photosynthesis.gif");
  mito = loadImage("mitochondria.jpg");
  pe = loadImage("photosynequation.png");
  re = loadImage("respirationequation.png");
  fe = loadImage("fermentation.jpg");
}

void draw() {
  stroke(0);
  update(mouseX, mouseY);
  circle1.display();
  circle2.display();
  circle3.display();
}

void update(int x, int y) {
  if(locked == false) {
    circle1.update();
    circle2.update();
    circle3.update();
  } 
  else {
    locked = false;
  }
  if(mousePressed) {
    if(circle1.pressed()) {
      start1();
    }
    else if(circle2.pressed()) {
      vocabulary();
    }
    else if(circle3.pressed()) {
      fun();
    }
  }
}

/* asdgklhjasdfhakjadshgkjahdgakdhg
 i was bored
 and hate coding buttons                                                                                              ¡me duele la cabeza!
 buttons are my pet peeve */

void start1() {
  noStroke();
  fill(35,235,25);
  rect(0,65,800,445);
  fill(0);
  texty = loadFont("NewsGothicMT-12.vlw");
  textFont(texty, 12);
  text("Photosynthesis:", 0,77);
  text("There are 2 stages in the process of Photosynthesis. Capturing light energy and energy conversion.",0,89);
  text("Stage 1:  Chloroplasts in plants use light from sun as energy by capturing it through the chrophyll in the chloroplasts.",0,101);
  text("The chrophyll are green organelles that are green because of it's pigment.",0,113);
  text("Stage 2: The light energy is used to create sugar and oxygen from water and carbon dioxide.",0,125);
  text("The water enters the leaf through the plant's xylem, and the carbon dioxide enters the leaf through it's stomatas.",0,137);
  text("The sugar that is created by the cells are used by the plant for more energy and the oxygen created exits through the stomatas.",0,149);
  image(photosy, 350,161,100,89.25);
  text("Respiration:",0,250);
  text("Like Photosynthesis, there are also 2 stages in Respiration. Breaking down molecules and release of carbon dioxide.",0,262);
  text("Stage 1: In the cytoplasm of an oxygen consuming cell, glucose is broken down and split to smaller molecules.",0,274);
  text("Very little energy is released in this process, but oxygen is not involved yet.",0,286);
  text("Stage 2: The smaller molecules and oxygen are sent into the mitochondrion and are converted into water and carbon dioxide.",0,298);
  text("In this process, a large amount of energy is released and completes the photosynthesis-respiration cycle.",0,310);
  text("Which is maintaning Earth's atmosphere's oxygen and carbon dioxide levels.",0,322);
  text("For extended information on respiration, see Fermentation.",0,334);
  image(mito,350,346,100,89.25);
}

void vocabulary() {
  noStroke();
  fill(35,235,25);
  rect(0,65,800,445);
  fill(0);
  texty = loadFont("NewsGothicMT-12.vlw");
  textFont(texty, 12);
  text("Definitions:",0,77);
  text("Photosynthesis: The process by which plants and some other organisms capture the energy in sunlight and use it to make food.",0,89);
  text("Autoroph: An organism that makes it's own food and is independent in living.",0,101);
  text("Heterotroph: An organism that relies and is dependent on other resources to live.",0,113);
  text("Pigments: A colored chemical compound that absorbs light.",0,125);
  text("Cell: The basic unit of structure and funtion in living things.",0,137);
  text("Organelle: A tiny cell structure that carries out a specific function within the cell.",0,149);
  text("Chloroplast: A structure in the cells of plants and some other organisms that captures energy from sunlight and uses it to produce food.",0,161);
  text("Chlorophyll: A green pigment found in the chloroplasts of plants, algae, and some bacteria.", 0, 173);
  text("Stomata: Small openings on the underside of a leaf through which oxygen and carbon dioxide can move.",0,185);
  text("Stoma: Singular stomata.",0,197);
  text("Cytoplasm: The region between the cell membrane and the nucleus; without a nucleus, the region located inside the cell membrane.",0,209);
  text("Cell Membrane: A cell structure that controls which substances can enter or leave the cell.",0,221);
  text("Respiration: The process by which cells break down simple food molecules to release the energy they contain.",0,233);
  text("Glucose: A simple sugar that is an important energy source in living organisms and is a component of many carbohydrates.",0,245);
  text("Mitochondria: Rod-shaped cell structures that convert energy in food molecules to energy the cell can use to carry out it's functions.",0,257);
  text("Mitochondrion: Plural mitochondria.",0,269);
  text("Fermentation: The process by which cells break down molecules to release energy without using oxygen,",0,281);
  text("Photosynthesis Equation:",0,293);
  image(pe, 0, 300,409,24);
  text("Respiration Equation:",0,335);
  image(re, 0,342,474,24);
}

void fun() {
  noStroke();
  fill(35,235,25);
  rect(0,65,800,445);
  fill(0);
  texty = loadFont("NewsGothicMT-12.vlw");
  textFont(texty, 12);
  text("Fermentation:",0,77);
  text("In the respiration process, when there is little or no oxygen, fermentation comes into play to respirate the cell.",0,89);
  text("The amount of energy released from each sugar molecule is lower, and will take more time.",0,101);
  text("There are 2 types of fermentation. Alcoholic & Lactic Acid.",0,113);
  text("In alcohlic fermentation, single-celled organisms much like yeast break down sugars. It's called alcoholic because alcohol is one of it's products.",0,125);
  text("This fermentation is most commonly found in a kitchen or brewery where rising bread dough, beer and sparkling wine are made.",0,137);
  text("Lactic Acid Fermentation occurs in muscle cells when the cells can't make up the oxygen it used, fast enough.",0,149);
  text("The lactic acid fermentation provides the cells with energy, but produces lactic acid, which when builds up, causes a burning sensation.",0,161);
  image(fe,275,168,250,200);
}


class Button {
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  void update() {
    if(over()) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }

  boolean pressed() {
    if(over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }
  }
  boolean over() { 
    return true;
  }
  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class CircleButton extends Button { 
  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight) {
    x = ix;
    y = iy;
    size = isize;
    icolor = 0;
    ihighlight = #FFFFFF;
    basecolor = 0;
  }
  boolean over() {
    if( overCircle(x, y, size) ) {
      over = true;
      return true;
    } 
    else {
      over = false;
      return false;
    }
  }
  void display() {
    stroke(0);
    fill(#00E3FF);
    ellipse(x, y, size, size);
  }
}


