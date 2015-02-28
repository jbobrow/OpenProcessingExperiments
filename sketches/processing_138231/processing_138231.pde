

//This is an image of fallen sakura blossoms.
//Every time you click on the mouse you fell this.

//Import audio lib
import ddf.minim.*;

//Variables
Minim minim;
AudioPlayer audio;
AudioSample chimes;
PImage trees;
int count = 0;
float rx;
float ry;
color blue = #C0C0FF;

//Color Pallette
color[] palette={#FFFFFF,#F652FF,#FF76DF,#FF1755};
//color[] palette={#FFFFFF,#FFBBD8,#F7A9FF,#FF6AE1};

//Setup Block
void setup() {
size(1200,800);
trees = loadImage("trees.jpg");

//Sound effects optional**, 'couse may be errors
  minim = new Minim(this);
  audio = minim.loadFile("samurai.mp3");
  audio.play();
  chimes = minim.loadSample("chimes.wav");
//Sound effects optional**

//A blank canvas until it receives user input
background(blue);
textFont(createFont("Arial",14,true));
text ("Click on the left mouse button to start; Press 'Delete' to clear canvas, 's' or 'S' to save a screenshot.",10,20);
//noLoop();
}

//Draw Block
void draw() {

 //Mouse Input
 if(mousePressed){
   image(trees,0,0);
   //Sound effects optional**
     chimes.trigger();
   //Sound effects optional**
   
  //While Loop 
 while(count < 21) {    
   //Variables
  int size = 50;
  int r = int(random(2,7));
  //Random size of Blossoms
  size+= r;
  //Random for coordinates
  rx =  random(1200);
  ry =  random(800);
  //Drawing Blossoms
  noStroke();  
  fill(palette[int(random(3))],97);
  ellipse(rx+size, ry+size, size, size);
  ellipse(rx+size+size*0.4, ry+size+size*0.3, size, size);
  ellipse(rx+size+size*0.25, ry+size+size*0.75, size, size);
  ellipse(rx+size-size*0.25, ry+size+size*0.75, size, size);
  ellipse(rx+size-size*0.4, ry+size+size*0.3, size, size);
  //Central part of Blossoms
  strokeWeight(r);
  stroke(#FFF303,97);
  point(rx+size-1, ry+size+size*0.4);
  point(rx+size+1, ry+size+size*0.4+1);
  point(rx+size-1, ry+size+size*0.4+2);
  //Counter increase
  count++;
 }
 count = 0;
 }
}

//Keyboard Input
void keyReleased(){
  //A blank canvas
  if (key == DELETE || key == BACKSPACE){
    background(blue);
    fill(#FFFFFF);
    textFont(createFont("Arial",14,true));
    text ("Click on the left mouse button to start; Press 'Delete' to clear canvas, 's' or 'S' to save a screenshot.",10,20);
  }
  //Screenshot Saving Capability
  if (key=='s' || key=='S')  saveFrame("sakura.jpg");
}


