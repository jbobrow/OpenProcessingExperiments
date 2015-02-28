
Flash[] flash;
int n;//score
float x,y;
float speedX, speedY;
float borxMin;       // borders for depth illusion
float borxMax;
float boryMin;
float boryMax;
float clr;                      //color of flashes
float anX, anY;
float anMove;
float anSize;               //size of A.N. picture
int nflashes = 100;                    //max score
Head ahmadinejad;
boolean gameOver;

void setup() {

  size(400,400);
  background(0);
  smooth();
  n = 1;
  anMove = 1;
  anSize = 100;
  flash = new Flash[nflashes];
  speedX = 2;
  speedY = 2;
  ahmadinejad = new Head((2*width-anSize)/4,(2*height-anSize)/4,anSize/2);
  PFont font;
  font = loadFont("myFont.vlw");
  textFont(font);
  gameOver = false;
  //frameRate (30);

  for (int i=0 ; i<nflashes;i++) {
    borxMin = width/2 - 10*i;
    borxMax = width/2 + 10*i;
    boryMin = height/2 - 10*i;
    boryMax = height/2 + 10*i;
    clr = i+100;
    flash[i] = new Flash(random(borxMin,borxMax), random(boryMin,boryMax), random(1,i/4), random(1,i/4), borxMin, borxMax, boryMin, boryMax,clr);
  }
}


void draw() {
  if(gameOver == false){
    ahmadinejad.anUpdate();
    fill(0,25);
    noStroke();
    rect(0,0,width,height);

    fill(0,255,0);
    text("BOO!",mouseX-20,mouseY);

    if(mousePressed && mouseButton == LEFT && dist(mouseX,mouseY,anX+anSize/2,anY+anSize/2) < 2*anSize ) {
      n ++;
      anMove += 0.30;                // level hardness
      anSize --;
      fill(255,0,0);
      text("BOO!",mouseX-20,mouseY);
    }


    if(n < 1) {
      n = 1;
    }
    if(n >= nflashes) {
      gameOver = true;
      n = nflashes;
    }
    for (int i=0 ; i<n;i++) {
      flash[i].update();
    }
    
    text("A.N.'s confidence: "+ (100 - n), width/2 - 80, height-30);
  }

  if (gameOver == true){
    for (int i=0 ; i<n;i++) {
      flash[i].update();
    }
    fill(255,0,0,70);
    text("GAME OVER - Ahmadinejad is a loser again!",30,height/2);
    text("A.N.'s confidence: "+ (100-n), width/2 - 80, height-30);
  }
}



/*
This simple game consists of a target that moves around and a pointer
that has to be pressed on it. It also has some flashes and a text that
display the score. As Ahmadinejad is "boo"ed, his confidence decreases,
he jumps around faster and produces more fake images. As soon as his
confidense reaches zero he becomes a loser and the green flashes cover
the screen.
Speaking of the data structure, it consists of two classes of objects
and some global variables that are updated by mouse interaction. One
class (Head) makes one object (Ahmadinejad) for the target.  Another
class produces the floating green flashes.
As the game starts, in the global area an array of max number of green
flashes are produced, as well as a Head of Ahmadinejad.
In the setup function initial values are given to the speed of the Head
and also the number of flashes to be updated.
In the draw function, as long as the boolean gameOver is false, the
visible objects keep being updated. By clicking the mouse curser on the
Head, the speed variable as well as the number of updated flashes increase.
As the score reaches its limit (100), the Boolean gameOver becomes true and
green flashes continue being updated without being covered by the background color.
*/


