

//*************************************
//********* by Emma Taylor*************
//****based on code by William San*****
//*************************************

//Functions:
// 1: case one, draws with only one character alone the string.
// 2: case two, draws with a word within the string defined.
// left click: firework

//**************************************
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioPlayer rumble;

PImage bg;
PFont font;
int x,y,counter=0,counter1 = 0,loc,s=1,dX,dY,wlength=1,fade=10;
int drawMode = 1;
color c;
boolean showbg = false;
String inputText = "A thought, even a possibility, can shatter and transform us.";
char [] letter = new char [inputText.length()];
String [] word = splitTokens(inputText);
float colorValue;

/** a firework particle */
class Firework {
  public float direction = 0; //direction of head
  int x = 20; //x coordinate
  int y = 20; //y coordinate
  public float velocity = 30; //speed of movement
  public float acc = 0.03; //increase of velocity
  public float directionInc = 0.03; //increase of direction (to right)
  public float energy = 30; //energy of the particle
  public int r = #fd56da; //pink
  public int g = #61c9b2; //green
  public int b = #f6ed4a; //yellow

  /** constructs a new Firework. */
  public Firework(int x, int y, int r, int g, int b) {
    this.x = x;
    this.y = y;
 
    this.r = r;
    this.g = g;
    this.b = b;
  }
  /** draw this particle */
  public void display() {
    //don't draw if this particle is exhausted.
    if (this.energy < 1) {
      return;
    }
    //draw the shape
    fill(this.r, this.g, this.b); //fill with the current color
    ellipse(this.x, this.y, this.energy, this.energy);
    //calculate the new location
    this.energy *= 0.95; //decrease energy
    this.velocity += this.acc; //increase velocity by acceleration
    this.direction += this.directionInc; //increase the direction
 
    //check borders
    if (this.x < 0 || this.y < 0 || this.x > width || this.y > height) {
      //bounce back
      this.direction = -this.direction * 2.1;
      this.directionInc = -this.directionInc;
      this.energy *= 0.8; //bouncing costs some energy
    }
 
    //move forward
    this.x += this.velocity * cos(this.direction);
    this.y += this.velocity * sin(this.direction) + 5 / this.energy; //there is gravity affecting it
 
    //add color value by the increment of color value
   // this.r = constrain(this.r + this.ri, 0, 250125133);
  // this.g = constrain(this.g + this.gi, 0, 152219140);
   // this.b = constrain(this.b + this.bi, 0, 22023590);
  }
}
 
/** a firework, explodes when its energy got exhausted. */
class LaunchFirework {
  public Firework f; //the firework particle
  public boolean exploded = false; //true if it is exploded
  /** constructs a new firework. */
  public LaunchFirework(int x1, int y1, int x2, int y2, int r, int g, int b) {
    f = new Firework(x1, y1, (int) random(58, 255), (int) random(58, 255), (int) random(58, 255));
  
    f.velocity = abs((x2 - x1) + (y2 - y1)) / 15; //calculate speed
    f.direction = atan2(y2 - y1, x2 - x1); //calculate direction
    f.directionInc = random(-0.02, 0.02);
    f.energy = random(17, 23);
    this.f = f;
  }
  /** draw the firework. */
  public void display() {
    if (!this.exploded) {
      if (this.f.energy < 5) {
        //explode it
        this.exploded = true;
        add(this.f.x, this.f.y);
      } else {
        //show that tiny spark
        this.f.display();
      }
    }
  }
}
 
ArrayList particles = new ArrayList(); //all firework particles
//mouse positions...
int oldX = 0;
int oldY = 0;
//make a new LaunchFirework or just Firework particle
boolean explode = true;
 
//creates an explosion
void add(int x, int y) {
  //int r = (int) random(1, 8);
  //random amount of fireworks
   int n = (int) random(6, 24);
    for (int j = 0; j < n; j ++) {
      Firework f = new Firework(x, y, (int) random(0, 255), (int) random(0, 255), (int) random(0, 255));
      //assign them randomly

      f.direction += j * TWO_PI / n;
    //  f.velocity = i;
      //add it
      particles.add(f);
    }
  }
//}
 
//launch a new firework
void launch(int x1, int y1, int x2, int y2) {
  particles.add(new LaunchFirework(x1, y1, x2, y2, (int) random(50, 255), (int) random(50, 255), (int) random(50, 255)));
}
 
void mousePressed() {
  oldX = mouseX;
  oldY = mouseY;
}
 
//decide to launch a new firework
void mouseDragged() {
  explode = false;
}
 
//launch or explode now?
void mouseReleased() {
  if (explode) {
    add(oldX, oldY);
  } else {
    launch(oldX, oldY, mouseX, mouseY);
    explode = true;
     
     //sound when mouseReleased
    minim = new Minim(this);
  song = minim.loadFile("song2.mp3");
  song.play();
  }
}

//**************************************

void setup() {
  size(500,500);
  bg = loadImage("bg.jpg");
  noStroke();
  smooth();
 // frameRate(15);
  add(width / 2, height / 2);
  
     minim = new Minim(this);
  rumble = minim.loadFile("song3.mp3");
  rumble.play();
   rumble.loop();

noCursor();
 
 
  for(int i=0; i<inputText.length()-1;i++){
    letter [i] = inputText.charAt(i);
    

  }
   
}

//**************************************
 
void draw(){
//background(#000000, 80); //this gives a motion blur effect
  for (int i = 0; i < particles.size(); i ++) {
    Object p = particles.get(i); //get this particle
    if (p instanceof Firework) {
      //draw the particle
      ((Firework) p).display();
      if (((Firework) p).energy < 3) {
        particles.remove(i); //remove exhausted particles
      }
    } else if (p instanceof LaunchFirework) {
      //keep launching the firework
      ((LaunchFirework) p).display();
      //remove exploded ones
      if (((LaunchFirework) p).exploded) {
        particles.remove(i);
     particles.remove(i);
      }
    }
  }
}

void mouseMoved(){
  dX=mouseX-pmouseX;
  dY=mouseY-pmouseY;
  s = (int)sqrt(dX*dX+dY*dY);
  PFont font;  
  font = createFont("times-italic",15+s);
  // background(colorValue);
  // colorValue = map(mouseY,0,width,0,255);  
  
    //sound when mouseMoved
    //****INSERT SOUND HERE********
    
    
    //cases the mouse location
    loc = mouseX+mouseY*bg.width;
     
    //finds picture color
    loadPixels();
    float r = red(bg.pixels[loc]);
    float g = green(bg.pixels[loc]);
    float b = blue(bg.pixels[loc]);
     
    //writes out letter
    fill(r,g,b);
    textFont(font);
    x=mouseX;
    y=mouseY;
     
    switch(drawMode) {
    
    case 1:
      // by word
      text(word[counter1], x, y);
      counter1++;
      break;
      
      case 2:
      // by letter
      int i = 0;
      text(letter[counter], x+i*textWidth(letter[counter]), y);
      counter++;
      i++;
      break;
    }
     
    //resets counters
   if(counter>inputText.length()-5) counter =0; 
   if(counter1>word.length-1) counter1 =0; 
   
  if(showbg){
 background(bg);
}else{
fill(0,fade);
rect(0,0,width,height);
} 
   
}
 
void keyPressed(){

   
  if (key == '1'){
    drawMode = 1;
    println("case 1");
  }
  if (key == '2'){
   drawMode = 2;
   println("case 2");
  }
  if (keyCode == UP){
    fade++;
    println("fade: " + fade);
  }
  if (keyCode == DOWN){
    fade--;
    println("fade: " +fade);
  }
}





