
/*****************************************
 * Assignment 04
 * Name:         Jiayi Wang
 * E-mail:      jwang04@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    02/28
 * 
 * When you click on the sketch a zombie would jump
 out. The zombies would keep jumping to the right
 until they quickly run away when they hit the wall
 of magic protection.
 
 ***********************************************/

PImage zombiei;
PImage fu;
PImage daoshi;
PImage background4;

//max number of zombies

int index=0;
int s=4;//scale of the zombie

int maxz = 5; 

Zombie [] zombies = new Zombie[maxz];  


void setup () {
  size (750, 600);
  imageMode(CENTER);
  background4 = loadImage("background4.jpg");
  image(background4, width/2, height/2, width, height);
}

void draw() {
  //position of daoshi
  float dx=width-width/(s*2);
  float dy=height-width/(2*s);

  imageMode(CENTER);
  background4 = loadImage("background4.jpg");
  image(background4, width/2, height/2, width, height);
  daoshi=loadImage("daoshi.png");
  image(daoshi, dx, dy, width/s, width/s);
  
  //flying signs
  float fy;
  float fx;
  for (int j=0;j<10;j++) {
    fy=height*j/10;
    fx=width*0.75+random(10);
    fu=loadImage("fu.png");
    image(fu, fx, fy, width/s, width/s);
  }

  for (int i=0; i<zombies.length; i++) {
    if (zombies[i] != null) {
      zombies[i].jump();
    }
    else {
      continue;
    }
  }
}

void mousePressed() {

  // create the zombie where the mouse is pressed

  zombies[index] = new Zombie();
  zombies[index].display();
  index = (index+1) % maxz;
}


