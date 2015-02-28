
   /** @peep sketchcode */
 
//adapted from Rob's Harmony forum post
ArrayList lions;
ArrayList currentLine;
float targetX, targetY; //for tracking the location of the mouse, but could track some other factor.
float penX, penY; // the pen approximating the path of the mouse
float ppenX, ppenY; // the position of the pen last frame.
Brush brush; //object for storing a single instance of the class brush.
 
void setup() {
  size(450, 450);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
  lions = new ArrayList(); //an arraylist to store every line drawn. //adapted from Rob's Harmony forum post
  currentLine = new ArrayList(); //arraylist counting the points in the current line being drawn.
  brush = new Brush();
}
 
void draw() {}
 
void mouseDragged() {
 
  brush.fadeTheBackground();
  //colours to change every frame
  brush.chooseTheColors(); 
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
    hue = 20;
    sat = 80;
    bri = 80;
    alfa = 80;
    stroke(hue, sat, bri, alfa);
    strokeWeight(1);
  }
 
  void drawTheLine(){
    int k;
    float a = 2;
    float r = 5;
    
    for (k = 1; k < currentLine.size(); k++) {
      PVector p = (PVector) currentLine.get(k);
      PVector morph = new PVector(cos(a)*r, sin(a)*r); //could be new PVector (frameCount, frameCount);
      p.add(morph);
      if (k > 1) {
        PVector q = (PVector) currentLine.get(k-1);
        line (p.x, p.y, q.x, q.y);
      }
      r++;
      a = a+r;
    }
    
 
    for (int j = 0; j < lions.size(); j++) {
      ArrayList aline = (ArrayList) lions.get(j);
      for (int i = 0; i < aline.size(); i++) {
        PVector p = (PVector) aline.get(i);
        PVector morph = new PVector(cos(a)*r, sin(a)*r); //could be new PVector (frameCount, frameCount);
        p.add(morph);
        if (i > 1) {
          PVector q = (PVector) aline.get(i-1);
          line (p.x, p.y, q.x, q.y);
        }
        if (p.x > width*1.25 || p.x < 0 - width*0.25 || p.y > height*1.25 || p.y < 0 - width*0.25 ) {
          aline.remove(i);
        }
        r = r++;
        a = a+r;
      }
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
                
