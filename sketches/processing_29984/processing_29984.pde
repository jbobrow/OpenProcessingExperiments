
/** @peep sketchcode */
 
//adapted from Rob's Harmony forum post
ArrayList lions;
ArrayList currentLine;
ArrayList styles;
float targetX, targetY; //for tracking the location of the mouse, but could track some other factor.
float penX, penY; // the pen approximating the path of the mouse
float ppenX, ppenY; // the position of the pen last frame.
Brush brush; //object for storing a single instance of the class brush.
 
void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
  brush = new Brush();
  lions = new ArrayList(); //an arraylist to store every line drawn. //adapted from Rob's Harmony forum post
  currentLine = new ArrayList(); //arraylist counting the points in the current line being drawn.
  styles = new ArrayList(); //Keeping track of which lines are drawn in which brushes.
}
 
void draw() {}
 
void mouseDragged() {
 
  brush.fadeTheBackground();
  //colours to change every frame
  //brush.chooseTheColors(); 
  //Easing the pen towards the mouse. 
  brush.easeThePen();
  brush.drawTheLine();
 
  // Update the point count and store the current mouse position //adapted from Rob's Harmony post
  currentLine.add(new PVector(penX, penY));
}
 
 
void mousePressed(){
  //code borrowed from Rob's pen easing sketch
  targetX = mouseX;
  targetY = mouseY;
  penX = targetX;
  penY = targetY;
  ppenX = penX;
  ppenY = penY;
  currentLine = new ArrayList();
  styles.add(brush);
}
 
void mouseReleased() {
  lions.add(new ArrayList(currentLine)); // stash the current line in the main arraylist
  currentLine.clear(); // then clear it
}
 
class Brush {
  float hue;
  float sat;
  float bri;
  float alfa;
 
  Brush(){}
 
  void fadeTheBackground() {
    noStroke();
    fill (0, 0, 100, 10);
    rect (0, 0, width, height);
  }
 
  void chooseTheColors() {
    hue = random(360);
    sat = random(80);
    bri = random(50, 80);
    alfa = random(80);
    stroke(hue, sat, bri, alfa);
    strokeWeight(1);
  }
 
  void drawTheLine(){
    moveThePts(currentLine);
    for (int j = 0; j < lions.size(); j++) {
      ArrayList lion = (ArrayList) lions.get(j);
      moveThePts(lion);
    }
  }
  
  void moveThePts(ArrayList arraylistname) {
   int i;
   int r = 5;
   int a = 2;
   
   chooseTheColors();
   for (i = 0; i < arraylistname.size(); i++) {
      PVector p = (PVector) arraylistname.get(i);
      PVector morph = new PVector(cos(a)*r, sin(a)*r); //could be new PVector (frameCount, frameCount);
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
     
    chooseTheColors();
    for (i = 0; i < arraylistname.size(); i++) {
      PVector p = (PVector) arraylistname.get(i);
      PVector morph = new PVector(cos(a)*r, sin(a)*r); //could be new PVector (frameCount, frameCount);
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
     
    chooseTheColors();
    for (i = 0; i < arraylistname.size(); i++) {
      PVector p = (PVector) arraylistname.get(i);
      PVector morph = new PVector(cos(a)*r, sin(a)*r); //could be new PVector (frameCount, frameCount);
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
}
                
                
