
// Based on RandomWalkTraditional - The Nature of Code plus Intro to Audio
// Daniel Shiffman
// http://natureofcode.com

// 8-bit Gabber Piece.WAV (by RutgerMuller)
// http://www.freesound.org/people/RutgerMuller/sounds/51241/

Maxim maxim;
AudioPlayer player;
Rgb w;
boolean playit = false;
  

void setup() {
  size(400, 400);
  
  
// codigo copiado de Intro to Audio  
  maxim = new Maxim(this);
  player = maxim.loadFile("8-bit-gabber.wav");
  player.setLooping(true);
  
  // Create a rgb object
  w = new Rgb();
  background(25);
  frameRate(30);
}

void draw() {
  // Run the rgb object
w.step();
w.render();

float ratio = (float) mouseX / (float) width;
ratio *= 2;
player.speed(ratio); 
  
  float vol = (float) mouseY / (float) height;
  vol *=2;
  player.volume(vol); 

}

void mousePressed()
{

// code that happens when the mouse button
// is pressed
  player.cue(0);
  playit = !playit;
  if (playit) {
    player.play();
        background(25);
  }
  else {
    player.stop();
    background(0);
  }
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// http://natureofcode.com/book/introduction/
// Based on a random walker object!

class Rgb {
  int r,g,b,x,y,l;
// El objeto Rgb tiene datos de color(r,g,b) posición (x,y,) y dimensiones (lado por lado)
  Rgb() {
    r = 0;
    g = 0;
    b = 0;
    x = width/2;
    y = height/2;
    l = 20; // lado del cuadro
  }
 //Objects have functions.
  void render() {
   noStroke();
   rect(x,y,l,l);
   fill(r,g,b);
  }
    

void step() {
// Random(6) me da los valores 0, 1, 2, 3, 4 o 5   
    int choice = int(random(6));
    
//The random “choice” determines our step.    
    if (choice == 0) {
      r=0;
    } else if (choice == 1) {
      r=255;
    }else if (choice == 2) {
      g=0;
    }else if (choice == 3) {
      g=255;
    }else if (choice == 4) {
     b=0;
    }else if (choice == 5) {
b=255;
    }
println(choice);
println("color (" + r + "," + g +"," + b + ")");

int pos = int(random(4));
    if (choice == 0) {
      x = x + l; 
    } else if (choice == 1) {
      x = x - l; 
    } else if (choice == 2) {
      y = y + l; 
    } else {
      y = y - l;
    }
    
    x = constrain(x,0,width-l);
    y = constrain(y,0,height-l);
   
}

//corchete final
}


