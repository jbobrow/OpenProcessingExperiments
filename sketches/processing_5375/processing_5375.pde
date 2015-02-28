

int posx = 160;
int posy = 240;
int rad = 30;
int distent = 55;
int spacetent = 18;
float angle = 0.1;
float speed = 0.1;
PImage img;
PImage imghead;
boolean imageMode = false;

int hl = 55;
int hh = 34;

float mx;
float my;

Octomonster mSx;
Octomonster mDx;



//-----------setup

void setup() {
 size(320, 480);
 smooth();
 img = loadImage("skin.png"); // <-- put image in foler
 imghead = loadImage("head.png"); 
 
 mSx = new Octomonster(50, 120, 135, 140, 182, 140, 135, 140, 182, 140, 255, 120, 0, 2., "a");
 mDx = new Octomonster(280, 20, 135, 140, 182, 140, 135, 140, 182, 140, 255, 120, 0, 2., "b");
 
  //Octomonster(float xpos_head, float ypos_head, float xpos_eyeSX, float ypos_eyeSX, 
  //float xpos_eyeDX, float ypos_eyeDX, float xpos_pupilSX, float ypos_pupilSX,
  //float xpos_pupilDX, float ypos_pupilDX, int colorhead, int coloreye, int colorpupil, 
  //float tentangle

}




//------------ draw

void draw() {
  background(0);
  angle = angle + speed;
  my = map(mouseY, 0, height, 0, 10);
  
  
  //------------sfondo

float radius = 6;

float my = map(mouseY, 0, height, 0, 16);

noFill(); 
for (int c = 0; c < 100; c += 2) {
    stroke(0, mouseY+10, 255);
    strokeWeight(my);
    ellipse(160, 200, radius, radius);
    radius = radius += 30;
}

//----------------end sfondo
  
  
  mSx.display();
  mDx.display();
  mSx.move();
  mDx.move();



}


void keyPressed () {
  imageMode = !imageMode; 
}

