
/*****************************************
 * Assignment #4
 * Name:         Xinyin Huang
 * E-mail:       xhuang01@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    23/10/12
 * 
 * This is a project in which you become Nemo and lives under the sea. Nemo moves as you move the mouse and whenever you
   click the mouse, lines of bubbles appear and move upward. When you press 'g', the greenWeed appears and moves left or right. 
***********************************************/

//define two classes waterPlants and Bubble and create two arrays for them. 10 bubbles and 8 waterPlants. 
int MaxBubbles=12;
int MaxGreenWeed=10;
WaterPlants[] greenWeed =new WaterPlants [MaxGreenWeed];
Bubble[] bubbles=new Bubble [MaxBubbles];

//define int for mouseClicked and keyPressed.
int idxBubbles=0;
int idxGreenWeed=0;

//define the image "nemo" and the image "sea".
PImage nemo;
PImage sea;

//set up the background and arrays. Also set up the image "nemo" and the background image "sea".
void setup () {
  size (800, 600);
  smooth ();
  ellipseMode (CENTER);

//create some certain number of greenWeed.  
  for (int i = 0; i<greenWeed. length; i++) {
    greenWeed [i]=new WaterPlants ();
  }
  
//create some certain number of bubbles. 
  for (int i=0; i< bubbles.length; i++) {
    bubbles[i]= new Bubble ();
  }

//define image nemo and sea.   
  nemo=loadImage ("Nemo.jpg");
  sea= loadImage ("sea.jpg");
}

//repeatedly draw greenWeed and bubbles and load the image nemo and sea. 
void draw () {
  background (0);
  image (sea,0,0, 800, 600);
 
 //every greenWeed draws and moves itself. 
  for (int x=0; x<greenWeed. length; x++) {
    if (greenWeed [x] !=null) {
      greenWeed[x]. draw();
      greenWeed[x].update();
     }
  }
  
 //every bubble draws and moves itself. 
 for (int i=0; i< bubbles.length; i++) {
     if (bubbles [i] !=null) {
        bubbles[i].draw ();
        bubbles[i].update ();
     }
 }
 
  image (nemo, mouseX-50, mouseY-50, 100, 100);
}

//once click the mouse, bubbles appear and move upward.  
void mouseClicked () {
  bubbles [idxBubbles]=new Bubble ();
  idxBubbles=(idxBubbles+1)% MaxBubbles;
}

//once press the key "g", greenWeed appear and move left and right. 
void keyPressed () {
  switch (key) {
    case 'g':
      greenWeed [idxGreenWeed]=new WaterPlants ();
      idxGreenWeed= (idxGreenWeed+1) % MaxGreenWeed;
      break;
    case 'n':
      break;
  }
}

//design my first class WaterPlants. 
class WaterPlants {
   
//fields, define variables. 
  float a;
  float b;
  float c;
  float d;
  float e;
  float f;
  float xSpeed;

//constructor, give values to the variables. 
  WaterPlants () {
    a= random (50, 750);
    b= random (400, 600);
    c= a+30;
    d= b-40;
    e= a+60;
    f=b;
    xSpeed=random (-2, 2);
  }

//method draw, create the greenWeed. 
   void draw () {
      fill (46, 139, 87);
      stroke (46, 139, 87);
      ellipse (a, b, 100, 20);
      ellipse (c, d, 20, 100);
      ellipse (e, f, 100, 20);
    }

//method update, let the greenWeed moves left or right.  
    void update () {
      a+=xSpeed;
      c+=xSpeed;
      e+=xSpeed;
    }
  }

//design my second class Bubble. 
class Bubble {
   
//fields, define variables.
    float x1;
    float x2;
    float x3;
    float x4;
    float y1;
    float y2;
    float y3;
    float y4;
    float vy;

//constructor, give values to variables. 
  Bubble () {
      x1=random (75, 100);
      x2=random (250, 275);
      x3=random (450, 475);
      x4=random (650, 675);
      y1=random (350, 400);
      y2=random (175, 200);
      y3=random (300, 350);
      y4=random (400, 425);
      vy=random (-3, -4);
    }

//method update, let the bubbles move upward.
  void update () {
      y1+=vy;
      y2+=vy;
      y3+=vy;
      y4+=vy;
    }

//method draw, create bubbles.
  void draw () {
      fill (255, 250, 240);
      stroke (100, 149, 137);
      ellipse (x1,y1, 50, 50);
      ellipse (x2, y2, 50, 50);
      ellipse (x3, y3, 50, 50);
      ellipse (x4, y4, 50, 50);
    }
   
}


