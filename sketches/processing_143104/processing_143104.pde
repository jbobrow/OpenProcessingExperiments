
/**

You are looking at a prototype, which might not do much!

This ultimately will be a simulation of a childhood game played. 

It was a two man game with a rotating starship with shields, lazers, asteriods

Can't find anything out there like it, so will make a prototype, and then a Unity3D or PlayN version

plus, every good programmer needs to make at least 1 good game in their lifetime...
*/

/*

For onscreen controls, would like to use ControlP5, but that is implemented in Java...

Need a box background, where the ship re-appears
Rotate, velocity, accelleration (don't use Physics library, as need to control)
Shoot, shields, move forward
Create object with PShape

Steps: 
Create sprite; done
accelatation; done
key movements; done
rotation; done
movement in direction facing; done
actual key buttons; done
onscreen controls; done
actual object
collision detection
shooting
shields
asteriods


*/

Ship shipA; 
int controls = 100; 
int verticalBound; 
color buttoncolor = color(204);
color highlight = color(153);
RectButton btnAShoot; 
RectButton btnAThruster; 
RectButton btnALeft; 
RectButton btnARight; 
RectButton btnAShield; 
boolean mouseDown = false; 
/** to simplify updates and display */
ArrayList<Button> buttons; 


void setup(){
  size(640, 360); 
  verticalBound = height - controls; 
  shipA = new Ship(100, 100); 
  buttons = new ArrayList<Button>(); 
  
  btnAShoot = new RectButton(40, verticalBound +10, 20, buttoncolor, highlight); 
  btnALeft = new RectButton(20, verticalBound +30, 20, buttoncolor, highlight); 
  btnAShield = new RectButton(40, verticalBound +30, 20, buttoncolor, highlight); 
  btnARight = new RectButton(60, verticalBound +30, 20, buttoncolor, highlight); 
  btnAThruster = new RectButton(40, verticalBound +50, 20, buttoncolor, highlight);   
 
  buttons.add(btnAShield); 
  buttons.add(btnAShoot); 
  buttons.add(btnALeft); 
  buttons.add(btnARight); 
  buttons.add(btnAThruster); 
  
}

void draw(){
  background(255); 
  // world boundary
  rect(0, 0, width-1, verticalBound); 
  if (frameCount%8==0) { // need a way to reset the acceleration after a timer, or reduce first
    shipA.halfAccelerate(); 
    
  } 
 shipA.update(); 
 shipA.display(); 
 handleControls(); 

  
 
  
}

void handleControls(){
  for(int x = 0; x < buttons.size(); x++){
    buttons.get(x).update(); 
    buttons.get(x).display();  
  }
 
  // additional trigger for mouse controls
  if (mouseDown ){
    if (frameCount%2==0){
     if(btnAThruster.pressed()){
       shipA.thruster(-0.0125);
     } 
    }
    if (frameCount%2==0){ // slightly faster
     if(btnALeft.pressed()){
     shipA.increaseRotation(-0.07); 
   } 
   if(btnARight.pressed()){
     shipA.increaseRotation(0.07); 
   } 
    }
  }
   
   
  
}

void mouseReleased(){
 mouseDown = false;   
}

void mousePressed(){
 mouseDown = true;   
}

void keyPressed(){
  
  if (key == 'a'){
   shipA.increaseRotation(-0.15);  
  } if (key == 'd'){
   shipA.increaseRotation(0.15);  
  } if (key == 'x') {
    shipA.thruster(-0.05); 
  }
  
    
}

  

/**
From http://processingjs.org/learning/topic/buttons/

Changes: popstyle, over as boolean

TODO: perhaps integrate with GUIDO event management for GUI
*/
class Button

{

  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean overBoolean = false;
  boolean pressed = false;   
  boolean locked = false; 

  void update() 
  {
     if(over()) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }



  boolean pressed() 

  {

    if(overBoolean) {

      locked = true;

      return true;

    } 

    else {

      locked = false;

      return false;

    }    

  }



  boolean over() 

  { 

    return overBoolean; 

  }



  boolean overRect(int x, int y, int width, int height) 

  {

    if (mouseX >= x && mouseX <= x+width && 

      mouseY >= y && mouseY <= y+height) {

      return true;

    } 

    else {

      return false;

    }

  }



  boolean overCircle(int x, int y, int diameter) 

  {

    float disX = x - mouseX;

    float disY = y - mouseY;

    if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {

      return true;

    } 

    else {

      return false;

    }

  }
  
  void display(){
   // will be overridden 
  }



}



class CircleButton extends Button

{ 

  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight) 

  {

    x = ix;

    y = iy;

    size = isize;

    basecolor = icolor;

    highlightcolor = ihighlight;

    currentcolor = basecolor;

  }



  boolean over() 

  {

    if( overCircle(x, y, size) ) {

      overBoolean = true;

      return true;

    } 

    else {

      overBoolean = false;

      return false;

    }

  }



  void display() 

  {
    pushStyle(); 
    stroke(255);

    fill(currentcolor);

    ellipse(x, y, size, size);
    popStyle(); 
  }

}



class RectButton extends Button

{

  RectButton(int ix, int iy, int isize, color icolor, color ihighlight) 

  {

    x = ix;

    y = iy;

    size = isize;

    basecolor = icolor;

    highlightcolor = ihighlight;

    currentcolor = basecolor;

  }



  boolean over() 

  {

    if( overRect(x, y, size, size) ) {

      overBoolean = true;

      return true;

    } 

    else {

      overBoolean = false;

      return false;

    }

  }



  void display() 

  {
    pushStyle(); 
    stroke(255);

    fill(currentcolor);

    rect(x, y, size, size);
    popStyle(); 
  }

}

class ImageButtons extends Button 

{

  PImage base;

  PImage roll;

  PImage down;

  PImage currentimage;
  
  int x; 
  int y; 
  int w; 
  int h; 



  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 

  {

    x = ix;

    y = iy;

    w = iw;

    h = ih;

    base = ibase;

    roll = iroll;

    down = idown;

    currentimage = base;

  }

  

  void update() 

  {

    over();

    pressed();

    if(pressed) {

      currentimage = down;

    } else if (overBoolean){

      currentimage = roll;

    } else {

      currentimage = base;

    }

  }

  

  boolean over() 

  {

    if( overRect(x, y, w, h) ) {

      return true;

    } else {

      return false;

    }

  }

  

  void display() 

  {

    image(currentimage, x, y);

  }

}
class Ship {
  
  PVector position;
  PVector velocity; 
  PVector acceleration; 
  float rotation; 
  
  public Ship(int x, int y){
   position = new PVector(x, y); 
   velocity = new PVector(); 
   acceleration = new PVector();  
   rotation = 0.0; 
    
  }
  
  public void thruster(float t){
   float f1 = sin(rotation) * t; 
   float f2 = cos(rotation) * t; 
   
   f1 *= -1; // x was always going wrong direction, need to reverse
   acceleration.add(f1, f2, 0); 
  }
  
  public void changeAcceleration(float x, float y){
   
   acceleration.add(x, y, 0);  
   
  }
  
  public void halfAccelerate(){
   if (acceleration.x != 0.0){
      acceleration.x = acceleration.x / 2; 
   } if (acceleration.y != 0.0){
      acceleration.y = acceleration.y / 2; 
   } 
    
  }
  
  public void increaseRotation(float rad){
   rotation += rad;  
   if (rotation > TWO_PI){
      rotation = rotation - TWO_PI; // reset 
   } if (rotation < 0 ){
     rotation = rotation + TWO_PI;  
   }
  }
  
  public void setAcceleration(float x, float y){
   acceleration.set(x,y,0);  
  }
  
  
 void display(){
   //ellipse(position.x, position.y, 5, 5);
  
   pushMatrix();  
   translate(position.x, position.y); // move the origin of the rotation around the point I want
   rotate(rotation);
   //rect(-3, -6, 6, 12); // minus the x and y to rotate around the center
   triangle(-5, 10, 0, -10, 5, 10); // TODO, ultimately need to get the centriod 
   popMatrix(); 
 
 }
 
 void update(){
   // acceleration needs to be applied in the direction of the rotation
   
   velocity.add(acceleration); 
   position.add(velocity);
   
   if (position.x < 0){
      position.x = width;  
   } if (position.x > width){
      position.x = 0;  
   }if (position.y < 0){
      position.y = verticalBound;  
   } if (position.y > verticalBound){
      position.y = 0;  
   }
   
 }
  
}


