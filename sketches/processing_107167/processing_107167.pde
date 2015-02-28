
//@pjs font="Arial"

/** A sketch which implements the Wolfram Cellular Automaton<br />
 * 2011/08/17 by Peter Bosshard Schneider based on the processing-example by Daniel Shiffman<br />
 * 2013/08/15 modified to make compatible with processing.js<br />
 * e.g. no arrayCopy(), no image copy() but pixels[] copying, no variable names which are identical to function names.<br />
 * Inspired by the book "A new kind of science" by Stephen Wolfram.<br />
 * controls:<br />
 * press the play/stop button to toggle generation - the button automatically jumps to pause<br />
 * after the screen is filled.<br />
 * Change the rules by activating the checkboxes.<br />
 * Reset the CA on any keypress with the set number of randomly placed cells.<br />
 * Keys '2' to '0' set a random placement of 2 to 10 cells.<br />
 * Key '1' places 1 cell in the middle.<br />
 */

PFont schrift;                      // font for info
color bg_clr;                       // opaque background color
color fg_clr;                       // opaque background color
int num_nuc = 1;                    // number of dots which are set to 1 inthe first generation of the ca
int cell_size = 4;                  // cell size of the ca
int automaton_height = 512;         // height of the ca
int automaton_width = 512;          // should be the same as width of sketch
int generation = 0;                 // initial generation
int[] curr_ruleset = new int[8];    // currently used ruleset
boolean paused = false;             // is rendering currently paused
ckbox[] ruleswitch = new ckbox[8];  // checkboxes to adjust rules
ppbtn playpause;                    // a play/pause button
CA ca;                              // An instance object to describe the Wolfram basic Cellular Automaton
PImage img, img2;                         // imagebuffer
PGraphics imgtemp;                  // imagebuffer the ca renders in

void setup() {
  size(512, 552, JAVA2D);
  frameRate(30/cell_size);          // slow down to reduce flicker
  schrift = createFont("Arial", 14);
  textFont(schrift);                // font adjustments
  bg_clr=color(0);                  // basic colors
  fg_clr=color(255);
  background(bg_clr);               // clear background

  img = createImage(automaton_width, automaton_height, ARGB);
  clearImage(bg_clr);
  img.updatePixels();
  img2 = createImage(automaton_width, automaton_height, ARGB);
  img2.loadPixels();
  for (int i=0;i<img2.pixels.length;i++) {
    img2.pixels[i] = color(255, 255);
  }
  img2.updatePixels();
  imgtemp = createGraphics(automaton_width, cell_size, JAVA2D);
  imgtemp.beginDraw();
  imgtemp.background(0);
  imgtemp.endDraw();

  // initial ruleset 105
  curr_ruleset[0] = 0;
  curr_ruleset[1] = 1;
  curr_ruleset[2] = 1;
  curr_ruleset[3] = 0;
  curr_ruleset[4] = 1;
  curr_ruleset[5] = 0;
  curr_ruleset[6] = 0;
  curr_ruleset[7] = 1;

  // initialize checkboxes with ruleset
  for (int i=0;i<8;i++) {
    ruleswitch[i] = new ckbox(25+i*17, automaton_height+10, 15, color(204), color(153, 0, 0), i);
    if (curr_ruleset[i]==1) {
      ruleswitch[i].checked=true;
    }
    else {
      ruleswitch[i].checked=false;
    }
  }

  // initialize the play/pause button
  playpause = new ppbtn(162, automaton_height+10, 15, color(204), color(153, 0, 0), 0);

  // Initialize CA
  ca = new CA(automaton_width, automaton_height, curr_ruleset, cell_size, num_nuc);
}

void draw() {
  if (!paused) {
    ca.render();    // Draw the CA into the graphics buffer
    ca.generate();  // Generate the next level
    generation++;

    // move image up by cell_size
    img.loadPixels();   
    img2.loadPixels();
    for (int i=automaton_width*cell_size;i<img.pixels.length;i++) {
      img2.pixels[i-automaton_width*cell_size] = img.pixels[i];
    }
    img2.updatePixels();
    img.updatePixels();

    // copy image 2 to image
    img.loadPixels();     // load image pixels
    img2.loadPixels();
    for (int i=0;i<img2.pixels.length;i++) {
      img.pixels[i] = img2.pixels[i];
    }
    img2.updatePixels();
    img.updatePixels();

    imgtemp.loadPixels(); // load buffered pixels
    img.loadPixels();

    for (int i=0;i<imgtemp.pixels.length;i++) {
      img.pixels[img.pixels.length-automaton_width*cell_size+i] = imgtemp.pixels[i];
    }
    img.updatePixels();
    imgtemp.updatePixels();
    image(img, 0, 0);
  }

  // clear info area
  fill(bg_clr);
  rect(0, automaton_height+1, width, height-automaton_height);

  // display checkboxes
  fill(fg_clr);
  for (int i=0;i<8;i++) {
    ruleswitch[i].display();
  }

  // after screen is filled set play/pause button to pause
  if (generation == round(automaton_height/cell_size)) {
    paused = true;
    playpause.checked = false;
  }

  // display play/pause button
  playpause.display();

  // display infos
  fill(fg_clr);
  if (generation > round(automaton_height/cell_size)) {
    int logen = generation - round(automaton_height/cell_size);
    text(ca.getInfo() + " generations: " + logen + " - " + generation, 180, automaton_height+16);
  }
  else {
    text(ca.getInfo() + " generations: 0 - " + generation, 180, automaton_height+16);
  }
  
  // draw current rule
  stroke(bg_clr);
  fill(fg_clr);
  for (int i=0;i<8;i++) {
    // background
    rect(16+(i*60), height-21, 60, 20);

    // neighbours on the left
    if (i<4) {
      fill(bg_clr);
    }
    else {
      fill(fg_clr);
    }
    rect(16+(i*60)+18, height-19, 8, 8);

    // actual cell
    if ((i==0)||(i==1)||(i==4)||(i==5)) {
      fill(bg_clr);
    }
    else {
      fill(fg_clr);
    }
    rect(16+(i*60)+26, height-19, 8, 8);

    //neighbour on the right
    if ((i==0)||(i==2)||(i==4)||(i==6)) {
      fill(bg_clr);
    }
    else {
      fill(fg_clr);
    }
    rect(16+(i*60)+34, height-19, 8, 8);

    // resulting state
    if (ca.ruleset[i] == 1) {
      fill(bg_clr);
    }
    else {
      fill(fg_clr);
    }
    rect(16+(i*60)+26, height-11, 8, 8);

    // reset foreground color
    fill(fg_clr);
  }
}

void mousePressed() {

  // change checkboxes and current ruleset
  for (int i=0;i<8;i++) {
    ruleswitch[i].press(mouseX, mouseY);
    if (ruleswitch[i].checked) {
      curr_ruleset[i] = 1;
    }
    else {
      curr_ruleset[i] = 0;
    }
  }

  // change play/pause button
  playpause.press(mouseX, mouseY);
  if (playpause.checked) {
    paused = false;
  }
  else {
    paused=true;
  }
}

// reset ca on any keypress with the lastly set number of random placed cells
// keys 2 to 0 set a random placement of 2 to 10 cells
// key 1 places 1 cell at the centre
void keyPressed() {
  switch(key) {
  case '0':
    num_nuc = 10;
    break;
  case '9':
    num_nuc = 9;
    break;
  case '8':
    num_nuc = 8;
    break;
  case '7':
    num_nuc = 7;
    break;
  case '6':
    num_nuc = 6;
    break;
  case '5':
    num_nuc = 5;
    break;
  case '4':
    num_nuc = 4;
    break;
  case '3':
    num_nuc = 3;
    break;
  case '2':
    num_nuc = 2;
    break;
  case '1':
    num_nuc = 1;
    break;
  case 's':
    //saveFrame("CA"+ca.getImageInfo()+".jpg");
    break;
  }
  if (key != 's') {
    clearImage(bg_clr);
    ca = new CA(automaton_width, automaton_height, curr_ruleset, cell_size, num_nuc);
    generation = 0;
  }
}

void clearImage(color bg) {
  img.loadPixels();
  for (int i=0;i<img.pixels.length;i++) {
    img.pixels[i] = color(bg);
  }
  img.updatePixels();
  image(img, 0, 0);
}

class CA {
  int ca_width;    // the width
  int ca_height;   // height of the ca
  int[] cells;     // An array of 0s and 1s 
  int position;    // position of the scanline
  int scl;         // How many pixels wide/high is each cell?
  int num_start;   // How many positions are initially set to 1
  int[] ruleset;   // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}

  CA(int caw, int cah, int[] r, int cs, int ns) {
    this.ca_width = caw;
    this.ca_height = cah;
    this.ruleset = r;
    this.scl = cs;
    this.num_start = ns;
    this.cells = new int[ca_width/scl];
    this.position = ca_height-scl;
    restart(num_start);
  }

  // Set the rules of the CA
  void setRules(int[] r) {
    ruleset = r;
  }

  void restart(int num) {
    this.num_start = num;
    // reset cells to 0
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }

    // if only 1 position is set to 1 place it at half width of ca else distribute randomly
    if (num == 1) {
      cells[cells.length/2] = 1;
    }
    else {
      int cnt=0;
      while (cnt<num) {
        int prop =  floor(random(cells.length));
        if (cells[prop] == 0) {
          cells[prop] = 1;
          cnt++;
        }
      }
    }
  }

  // The process of creating the new generation
  void generate() {
    // First we create an empty array for the new values
    int[] nextgen = new int[cells.length];
    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];               // Left neighbor state
      int me = cells[i];                   // Current state
      int right = cells[i+1];              // Right neighbor state
      nextgen[i] = rules(left, me, right); // Compute next generation state based on ruleset
    }
    
    // Copy the array into current value
    for (int i = 0; i < nextgen.length; i++) {
      cells[i] = nextgen[i];
    }
  }

  // Draw the cells, fill 255 for '1', fill 0 for '0'
  void render() {
    imgtemp.beginDraw();
    imgtemp.background(0);
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) imgtemp.fill(255,255); //white
      else               imgtemp.fill(0,255);   //black
      imgtemp.noStroke();
      imgtemp.rect(i*scl, 0, scl, scl); //position changed to 0
    }
    imgtemp.endDraw();
  }

  // Implementing the Wolfram rules
  int rules (int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) return ruleset[0];
    if (a == 1 && b == 1 && c == 0) return ruleset[1];
    if (a == 1 && b == 0 && c == 1) return ruleset[2];
    if (a == 1 && b == 0 && c == 0) return ruleset[3];
    if (a == 0 && b == 1 && c == 1) return ruleset[4];
    if (a == 0 && b == 1 && c == 0) return ruleset[5];
    if (a == 0 && b == 0 && c == 1) return ruleset[6];
    if (a == 0 && b == 0 && c == 0) return ruleset[7];
    return 0;
  }

  // print current ruleset as decimal number
  String getInfo() {
    String info="";
    for (int i=0;i<ca.ruleset.length;i++) {
      info+= str(ca.ruleset[i]);
    }
    return ("rule " + unbinary(info) + " initial cells: " + num_start);
  }
  
  // print current ruleset as decimal number
  String getImageInfo() {
    String info="";
    for (int i=0;i<ca.ruleset.length;i++) {
      info+= str(ca.ruleset[i]);
    }
    return ("_R" + unbinary(info) + "_I" + num_start);
  }
}

class ckbox {
  int x, y;                 // The x- and y-coordinates of the rect
  int size, crossSize;      // Dimension of square, cross
  color baseGray, dotGray;  // Circle gray value, inner gray value
  boolean checked = false;  // True when the button is selected
  int me;                   // ID number for this CheckBox object


  ckbox(int xp, int yp, int s, color b, color d, int m) {
    x = xp;
    y = yp;
    size = s;
    crossSize = size - size / 3;
    baseGray = b;
    dotGray = d;
    this.checked = false;
    me = m;
  }

  // Updates the boolean value press, returns true or false
  boolean press(float mx, float my) {
    if ((dist(x, y, mx, my) < size / 2)) {
      if(checked==false){
        checked = true;
      } 
      else {
        checked = false;
      }
    }
    return checked;
  }

  // Draws the element to the display window
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(baseGray);
    stroke(dotGray);
    if (checked == true) {
      rect(x, y, size, size);
      line(x-crossSize/2, y-crossSize/2, x+crossSize/2, y+crossSize/2);
      line(x+crossSize/2, y-crossSize/2, x-crossSize/2, y+crossSize/2);
    }else{
      rect(x, y, size, size);
    }
    rectMode(CORNER);
    noStroke();
    noFill();
  }
}


class ppbtn {
  int x, y;                 // The x- and y-coordinates of the rect
  int size;                 // Dimension of button
  color baseGray, dotGray;  // Circle gray value, inner gray value
  boolean checked = true;   // True when the button shows pause sign (it is playing)
  int me;                   // ID number for this button object


  ppbtn(int xp, int yp, int s, color b, color d, int m) {
    x = xp;
    y = yp;
    size = s;
    baseGray = b;
    dotGray = d;
    me = m;
  }

  // Updates the boolean value press, returns true or false
  boolean press(float mx, float my) {
    if ((dist(x, y, mx, my) < size / 2)) {
      if(checked==false){
        checked = true;
      } 
      else {
        checked = false;
      }
    }
    return checked;
  }

  // Draws the element to the display window
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(baseGray);
    stroke(dotGray);
    if (checked == true) {
      rect(x, y, size, size);
      // pause icon
      fill(dotGray);
      rect(x-(size/5),y,size/5,size/3*2);
      rect(x+(size/5),y,size/5,size/3*2);
    }else{
      // play icon
      fill(baseGray);
      rect(x, y, size, size);
      stroke(dotGray);
      line(x-(size/3),y-(size/3),x-(size/3),y+(size/3));
      line(x-(size/3),y-(size/3),x+(size/3),y);
      line(x-(size/3),y+(size/3),x+(size/3),y);
    }
    rectMode(CORNER);
    noStroke();
    noFill();
  }
}




