
// This is adapted the brilliant work from Raven Kwok titled "NoiseTurbulence". 
// sourced via OpenProcessing.org
// 17 September 2014 by Marlen Promann

// DECLARE ELEMENTS:
  
  // IMPORTING UI CONTROLS LIBRARY
  import controlP5.*; // to import the control elements from the "ControlP5" library
  ControlP5 cp5; // define the control as 'cp5'
  ColorPicker cp; // defining the RGB slider
   
  // UI ELEMENTS
  int myColor = color(255,255,255);
  int Particles = 50;
  int BackgroundColor = 200;
  int ParticleColor = 245;
  int ParticleOrientation = 360;
  int ParticleLenght = 200;
  int ColorSlide = 255;
  //int canvas;
  
  //VISUALIZATION ELEMENTS
  ArrayList<Particle> pts; // an array list filled with particles (since its a 'list', we will later define the, with pts.size())
  boolean onPressed, showInstruction; // a
  PFont myfont; // create a font to use it in Processing

// SET UP THE DOCUMENT's MODE OF OPERATION
void setup() {
  size(850, 700, P2D); //
  smooth(); // anti-alias edges 
  frameRate(30); // speed at which the code get animated 
  colorMode(RGB); // color mode based on RGB not (Hue, Saturation and Brightness)
  rectMode(CENTER); // drawing the rectangle from the center (rather than top left corner)
  pts = new ArrayList<Particle>(); // defining and activating 'pts' 
  showInstruction = true; // help the user know how to navigate
  myfont = createFont("Calibri", 24); // creating a font style & size to feed into 'textFont'

//DARW A DRAWING CANVAS.... (to be continued shortly)

// CREATE THE SLIDES
    cp5 = new ControlP5(this);
    //cp5.printPublicMethodsFor(Matrix.class);
    cp5.addSlider("Particles") // slider controls the number of particles a mouse clicks ignites
         .setPosition(300,600) // location of the slider
         .setSize(150,10) // slider size
         .setRange(0,50) // value range the slider allows to control
         .setValue(10); // value the initial launch starts at
    cp5.addSlider("BackgroundColor") // slider controls the background color
         .setPosition(50,600) // location of the slider
         .setSize(150,10) // slider size
         .setRange(10,200) // value range the slider allows to control
         .setValue(150); // value the initial launch starts at
    cp5.addSlider("ParticleLenght") // slider controls the lenght of the drawing lines
         .setPosition(300,620) // location of the slider
         .setSize(150,10) // slider size
         .setRange(20, 200) // value range the slider allows to control
         .setValue(100); // value the initial launch starts at
    cp5.addSlider("ParticleOrientation") // slider controls the orientation of the shrinking ellipses
         .setPosition(300,640) // location of the slider
         .setSize(150,10) // slider size
         .setRange(10,360) // value range the slider allows to control
         .setValue(100); // value the initial launch starts at
    cp = cp5.addColorPicker("ColorSlide") // this is a color picker that allows to edit R, G, B individually
          .setPosition(550, 600)
          .setSize(255,10) // slider size
          .setColorValue(color(128, 128, 128, 128))
          ;}

// DRAW ONTO THE CANVAS
void draw() {
  if (showInstruction) {
    background(255); // starting background is white (for instructions)
    textAlign(CENTER, CENTER); //  note's position on the screen
    textFont(myfont); // font was defined above in 'setup'
    textLeading(36); // pixels of spacing between lines of text 
    //fill(0, 102, 153);
    text("USER GUIDE:" + "\n" + "Press&Drag: Draw." + "\n" + "'C': Clear the canvas." + "\n" + "Sliders: Control Output" + "\n", width/2, height/2);
    } // Defining the text and locating it in the center of the canvas.

   
  if (onPressed) { // Drawign particles upon mouse being pressed // '&& mouseY < 400'
    for (int i=0; i<Particles; i++) {  
        Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size()); // we draw the particle defined by mouse location and the size of its initial shape
        pts.add(newP); 
        }
        fill(75); //dark gray
        noStroke ();
        rect(425, 625, width, 150); //(BackgroundColor);
     }
    for (int i=0; i<pts.size(); i++) { // continue to add atop the first particles drawn
      Particle p = pts.get(i); 
      p.update();
      p.display();
      fill(75); //dark gray
      noStroke ();
      rect(425, 625, width, 150); //(BackgroundColor);
      }
    for (int i=pts.size()-1; i>-1; i--) { //scale the particles down as they come to their end
      Particle p = pts.get(i);
      if (p.dead) { // tried: '|| mouseY >= 400'
        pts.remove(i); // stop drawing the particle 
      fill(75); //dark gray
      noStroke ();
      rect(425, 625, width, 150); //(BackgroundColor);
         }
       }
   }
public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if(c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    int a = int(c.getArrayValue(3));
    color col = color(r,g,b,a);
    println("event\talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
  }
}

// color information from ColorPicker 'picker' are forwarded to the picker(int) function
void picker(int col) {
  println("picker\talpha:"+alpha(col)+"\tred:"+red(col)+"\tgreen:"+green(col)+"\tblue:"+blue(col)+"\tcol"+col);
}



// DEFINE INTERACTIONS
void mousePressed() {
    onPressed = true; // if mouse is pressed background will color over the first instructions
    if (showInstruction) {
      background(BackgroundColor); // color is controlled via the slider
      showInstruction = false;
      }
    }
void mouseReleased() { // if mouse is released then stop drawing
  onPressed = false;
  }
void keyPressed() { // if C letter key is pressed, it will clear the drawing...
  if (key == 'c') {
    for (int i=pts.size()-1; i>-1; i--) {
      Particle p = pts.get(i);
      pts.remove(i);
  }
     background(BackgroundColor);
    }
  }

class Particle{ // Defining the particle parameters
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;
  color myColor;
  
  Particle(float x, float y, float xOffset, float yOffset){ // setting the flow of particles off throughout their lifetime
    loc = new PVector(x,y);    
    float randDegrees = (ParticleOrientation);
      vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
      //vel.mult(ParticleOrientation);   
        acc = new PVector(0,0);
        lifeSpan = int(ParticleLenght); // determined by the slider ParticleLenght
        decay = random(0.75, 0.9); // random dying speed
        weightRange = random(3,50);   // random starting size for particles 
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }
  
  void update(){
    if(passedLife>=lifeSpan){
      dead = true;
      }else{
        passedLife++;
        }  
    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;   
    acc.set(0,0);   
    float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
    float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
    PVector dir = new PVector(cos(rn),sin(rn));
      acc.add(dir);
      acc.mult(mag);   
    float randDegrees = ParticleOrientation; //random(360);
    PVector randV = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
      randV.mult(0.5);
      acc.add(randV);   
      vel.add(acc);
      vel.mult(decay);
      vel.limit(3);
      loc.add(vel);
    }
  
  void display(){
    strokeWeight(weight+1.5);
    stroke(0, alpha);
    point(loc.x, loc.y);
    strokeWeight(weight);
    stroke(cp.getColorValue());
    point(loc.x, loc.y);
  }
}


