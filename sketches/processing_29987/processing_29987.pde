
/** @peep sketchcode */

ArrayList lions;
ArrayList currentLion;
ArrayList styles;
ArrayList colors;
//adapted from Rob's Harmony forum post
float targetX, targetY; //for tracking the location of the mouse, but could track some other factor.
float penX, penY; // the pen approximating the path of the mouse
float ppenX, ppenY; // the position of the pen last frame.
Brush brush; //object for storing a single instance of the class brush.
color lionCol; //to store the color of the present line
 
void setup() {
  size(600, 600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100); //white
  brush = new Brush(); //start with the default brush
  lions = new ArrayList(); //an arraylist to store every line drawn. //adapted from Rob's Harmony forum post
  currentLion = new ArrayList(); //arraylist counting the points in the current line being drawn.
  styles = new ArrayList(); //Keeping track of which lines are drawn in which brushes.
  colors = new ArrayList(); //Keeping track of which lines are which colours.
}
 
void draw() {}
 
void mouseDragged() {
  brush.fadeTheBackground();
  //Easing the pen towards the mouse. 
  brush.easeThePen();
  brush.drawTheLine();
  // Update the point count and store the current mouse position //adapted from Rob's Harmony post
  currentLion.add(new PVector(penX, penY));
}
 
 
void mousePressed(){ //starts a line
  //code borrowed from Rob's pen easing sketch
  targetX = mouseX;
  targetY = mouseY;
  penX = targetX;
  penY = targetY;
  ppenX = penX;
  ppenY = penY;
  currentLion = new ArrayList(); //create a fresh array list when a line is started
  brush.chooseTheColors(); //pick a color when a line is started
}
 
void mouseReleased() {
  lions.add(new ArrayList(currentLion)); // get the current line, throw it to the lions.
  currentLion.clear(); // then clear it out of the temp arraylist
  styles.add(brush); //record the brush class used
  colors.add(lionCol); //record the colour used
}
 
class Brush {
  float hue;
  float sat;
  float bri;
  float alfa;
 
  Brush(){}
 
  void fadeTheBackground() {
    //noStroke(); // can't figure out how to make this work without wiping out my lines totally.
    fill (0, 0, 100, 10);
    rect (-1, -1, width+1, height+1); //because I can't kill the outline I'll just draw it outside the window
  }
 
  void chooseTheColors() {
    hue = random(360);
    sat = random(50, 100);
    bri = random (90, 100);
    alfa = random(100);
    stroke(hue, sat, bri, alfa);
    strokeWeight(1);
    lionCol = color(hue, sat, bri, alfa); //store each color to put in colors arraylist
  }
 
  void drawTheLine(){
    //draw the current line
    stroke(lionCol);
    moveThePts(currentLion);
    
    //draw all the previous lines, with the right colours and brush-styles.
    Brush style;
    color thisLionColor;
    for (int j = 0; j < lions.size(); j++) { //go through all the lines
      ArrayList lion = (ArrayList) lions.get(j); //grab number j
      thisLionColor = (color)(Integer) colors.get(j); //grab the color that corresponds to this line //got the knowledge for using "Integer" here from http://processing.org/discourse/yabb2/YaBB.pl?num=1235485744
      stroke(thisLionColor); //color the line
      style = (Brush) styles.get(j); //grab the brushstyle that belongs to this line
      style.moveThePts(lion); //move the points according to that brushstyle's rules
    }
  }
  
  void moveThePts(ArrayList arraylistname) { //rules for how the line behaves once drawn
   int i;
   float r = 5;
   float a = 2;
   
   for (i = 0; i < arraylistname.size(); i++) {
      PVector p = (PVector) arraylistname.get(i); //location of a point
      PVector morph = new PVector(cos(a)*r, sin(a)*r); //how much to move the point
      p.add(morph); //add the two
      if (i > 1) {
        PVector q = (PVector) arraylistname.get(i-1); //grab the previous point
        line (p.x, p.y, q.x, q.y); //draw a line between the two
      }
      if (p.x > width*1.25 || p.x < 0 - width*0.25 || p.y > height*1.25 || p.y < 0 - width*0.25 ) {
        arraylistname.remove(i); //if it goes too far outside the window delete the point
      }
      r = r++;
      a = a+r;
    }
  }
  
 
  //code borrowed from Rob's pen easing sketch
  void easeThePen(){
    //storing the mouse position into the target //code adapted from Rob's pen easing sketch
    targetX = mouseX;
    targetY = mouseY;
 
    if (penX != targetX || penY != targetY) { //checks if the mouse has moved away from the line
      ppenX = penX; //store the just drawn positions into previous variables
      ppenY = penY;
      penX = penX + 0.7505 * (targetX - penX); // move the pen by a percentage of the difference between its current position and the mouse position.
      penY = penY + 0.7505 * (targetY - penY);
    }
  }
}


class Walker extends Brush {
  
  Walker(){}
  
  void moveThePts(ArrayList arraylistname) {
    int i;
    int r = 5;
    int a = 2;
     
    
    for (i = 0; i < arraylistname.size(); i++) {
      PVector p = (PVector) arraylistname.get(i);
      PVector morph = new PVector(1, 1);
      p.add(morph);
      if (i > 1) {
        PVector q = (PVector) arraylistname.get(i-1);
        line (p.x, p.y, q.x, q.y);
      }
      if (p.x > width*1.25 || p.x < 0 - width*0.25 || p.y > height*1.25 || p.y < 0 - width*0.25 ) {
        arraylistname.remove(i);
      }
      r = r++;
      a = a+r;
    }
  } 
}

class Branch extends Brush {
  
  Branch(){}
  
  void moveThePts(ArrayList arraylistname) {
    int i;
    int r = 5;
    int a = 2;
     
    for (i = 0; i < arraylistname.size(); i++) {
      PVector p = (PVector) arraylistname.get(i);
      PVector morph = new PVector(random(-10, 10), sin(a)*r);
      p.add(morph);
      if (i > 1) {
        PVector q = (PVector) arraylistname.get(i-1);
        line (p.x, p.y, q.x, q.y);
      }
      if (p.x > width*1.25 || p.x < 0 - width*0.25 || p.y > height*1.25 || p.y < 0 - width*0.25 ) {
        arraylistname.remove(i);
      }
      r = r++;
      a = a+r;
    }
  } 
}

class Wave extends Brush {
 
  Wave() {}
  
  void moveThePts(ArrayList arraylistname) {
    int i;
    float r = 5;
    float a = 2;
     
    for (i = 0; i < arraylistname.size(); i++) {
      PVector p = (PVector) arraylistname.get(i);
      PVector morph = new PVector(cos(a)*r, sin(a)*r); 
      p.add(morph);
      if (i > 1) {
        PVector q = (PVector) arraylistname.get(i-1);
        line (p.x, p.y, q.x, q.y);
      }
      if (p.x > width*1.25 || p.x < 0 - width*0.25 || p.y > height*1.25 || p.y < 0 - width*0.25 ) {
        arraylistname.remove(i);
      }
      r = r++;
      a = a++;
    }
  }
}

void keyPressed() {
  //chooses the brush style (subclass) based on key input.
  //code influenced by Ryan Gavan's assignment three posts.
  if(key == '1' || key == '!'){
    brush = new Brush();
  }
  if(key == '2' || key == '@'){
    brush = new Walker();
  }
  if(key == '3' || key == '#'){
    brush = new Branch();
  } 
  if(key == '4' || key == '$'){
    brush = new Wave();
  }
}
