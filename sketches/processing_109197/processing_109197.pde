

/* @pjs preload="half_rink.jpg"; */
/* @pjs preload="puck.png"; */

int btnX, btnY;
int btnW, btnH;
int sliderX, sliderY;
int sliderW, sliderH;
int puckX, puckY;
int puckW, puckH;
float puckSpeed;
float sliderValue;

int homeScore = 0;
int awayScore = 0;

String sliderLabel;
String chant;

PImage rink;
PImage puck;
Slider slider;
RadioButton radio;

boolean goal;
boolean move;

void setup() {
  size(550, 475);
  rink = loadImage("half_rink.jpg");
  puck = loadImage("puck.png");
  puckW = puck.width;
  puckH = puck.height;
  sliderX = 110;
  sliderY = 100;
  sliderW = 150;
  sliderH = 35;
  sliderLabel = "Puck Speed";
  radio = new RadioButton(45, 135, "Home/Away");
  slider = new Slider(sliderX, sliderY, sliderW, sliderH, sliderLabel);
  slider.setValue(0.5);
  sliderValue = slider.getValue();
  puckSpeed = 6 * sliderValue;
  chant = "GOAL!";
  btnX = 85;
  btnY = 50;
  btnW = 100;
  btnH = 55;
  goal = false;
  move = false;
}

void draw() {
  
  background(rink);
  imageMode(CENTER);
  drawButton();

  if (move == true) {
    movePuck();
    drawPuck();
  } else {
     setPuckHome(); 
  }

  if (goal == true) {
      drawGoalText();
  }
  
  slider.display();
  radio.display();
  
  //drawStatusBar();
  
}

void drawButton() {

  fill(0, 0, 200);
  strokeWeight(2);
  stroke(255, 0, 0);
  rectMode(CENTER);
  rect(btnX, btnY, btnW, btnH);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("SHOOT", btnX, btnY);
}

void drawGoalText() {
  
  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(50);
  text(chant, 450, 75);
  
}

void setPuckHome() {

  image(puck, width/2, puckH/2);
}

void drawPuck(){
  
   image(puck, width/2, puckY);
  
}


void movePuck() {
  
  if ( height > (puckY) ) {
      puckY += puckSpeed;
  } else {
      move = false;
      goal = true;
      puckY = puckH/2;
      
      if (radio.isSelected() == true) {
       
       homeScore++; 
        
      } else {
        
       awayScore++; 
        
      }
      
  }
}


void drawStatusBar(){
  
 fill(0); 
 rect(0,height-5, 455, 35);
 fill(255);
 text("Home: " + homeScore + "   Away: " + awayScore, 5, height-5); 
  
  
}


void mouseReleased() {

  if ( (mouseX >= btnX-btnW/2) && (mouseX <= btnX+btnW/2) && 
    (mouseY >= btnY-btnH/2) && (mouseY <= btnY+btnH/2) 
    ) {
    move = true;
    
    if ( goal == true ){
      
      goal = false;
      
    }
    
  }
  
  if (slider.isUpdating()) slider.update = false;
  
  puckSpeed = 6 * sliderValue;
  
  if (radio.contains(mouseX, mouseY) ) {
   
    
     if ( radio.isSelected() == true ){
           radio.setSelected(false); 
     } else {
           radio.setSelected(true);
     }   
     
    
  }
  
}

void mousePressed(){
  
 if (slider.contains(mouseX, mouseY)) {
    slider.update = true;
  }
  
}

void mouseDragged() {
  
 if (slider.isUpdating()) {
    slider.setValue(slider.interp(mouseX, mouseY));
    sliderValue = slider.getValue();
    
  } 
  
}



class RadioButton {
  
  private int x, y;
  private int w = 15;
  private int h = 15;
  private String label;
  private boolean selected = false;
 
 public RadioButton(int _x, int _y, String _label) {
  
   x = _x;
   y = _y;
   label = _label;
 } 
 
 
 void display(){
   
  rectMode(CENTER);
  stroke(0);
  getStatus();
  ellipse(x,y,w,h);
  textSize(18);
  
  fill(0);
  textAlign(LEFT);
  text(label, x+w, y+h/2);
  
 }
 
 public boolean isSelected() {
   
   return selected;
   
 }
 
 public void setSelected(boolean tof) {
   
   this.selected = tof;
   
 }
 
 private void getStatus(){
  
    if ( selected == true ){
     
      fill(0);
     
    } else {
     
      fill(255); 
      
    }
   
 }
 
 boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) && (_x<=x+w/2) && (_y>=y-h/2) && (_y<=y+h/2) ) ? true : false;
 }
  
  
  
  
}
class Slider {
  
 //location
 int x;
 int y;
 int w;
 int h;
 
 float value;
 
 String label; 
 
 private boolean update = false;
 
  
 public Slider(int x, int y, int w, int h, String label){
  
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.label = label;
    
 } 
  
 void setValue(float f) {
  
   this.value = f;
  
 } 
 
 
 float getValue(){
  
  return this.value; 
   
 }
 
 void display() {
   
   fill(0);
   textAlign(CENTER, CENTER);
   textSize(20);
   text(label, x, y);
   
   // draw under box
   fill(15,32);
   rectMode(CENTER);
   rect(x,y,w,h);
   
   // draw box that controls value
   rectMode(CORNER);
   stroke(0, 5);
   fill(0, 150);
   rect(x-w/2, y-h/2, w*value, h);
   
 }
 
boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) && (_x<=x+w/2) && (_y>=y-h/2) && (_y<=y+h/2) ) ? true : false;
 }
 
 float interp(int _x, int _y) {
   float d = _x - (x-w/2);
   float nw = norm (d, x-w/2, x+w/2); 
   nw = min(1.0, nw);
   nw = max(0.0, nw);
   return nw;
  }
  
  boolean isUpdating() {
    return update;
  }
 
}


