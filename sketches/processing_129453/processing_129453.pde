
import ddf.minim.*;

Minim minim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;

PImage img;
PImage img2;
PImage img3;
PImage img4;
float tint;
float gain = map(mouseY, 0, height, 1, 20);

int sauron;

int counter;

void setup()
{
  size(900, 600);
  img = loadImage("mueb1.jpg");
  img2 = loadImage("muebmordor.jpg");
  img3 = loadImage("nazgul.png");
  img4 = loadImage ("flieger.png");
  

  minim = new Minim(this);
  player1 = minim.loadFile("sound.wav");
  player2 = minim.loadFile ("mordorsound.mp3");
  player3 = minim.loadFile ("bell_01.mp3");
  player4 = minim.loadFile ("flieger.wav");
  player5 = minim.loadFile ("nazgul.mp3");
  player1.loop();
}

void draw()
{
  background(0);
  imageMode(CORNER);
  image(img, 0, 0);
  noTint();
  
  //Flieger
  if (mouseX > 700 && mouseX < 900 && mouseY > 0 && mouseY < 230) {
   pushMatrix();
    translate(900-counter,50);
    counter = counter+4;
    image(img4,0,0);
    player4.play(); 
    popMatrix();
   
}



  //Kirchturm
  
    if (mouseX > 200 && mouseX < 240 && mouseY > 250 && mouseY < 360 == true) {
      cursor(HAND);
      player3.play();
      player3.rewind();
      counter = 0;
    }
    else
    cursor(ARROW);

  //Mordor
  if (mousePressed == true) {
    tint(255, tint);
    image(img2, 0, 0);
    noTint();
    tint = tint+1;

    //minim = new Minim(this);
    //player2 = minim.loadFile("mordorsound.mp3");
    player2.play();
    player1.pause();
    player4.pause();
  } 

  else
  {
    player2.pause();
    player1.play();
    sauron = 0;
  }
  
  //Nazgul
  if (mouseX > 0 && mouseX < 300 && mouseY > 0 && mouseY < 230 && mousePressed == true) {
    cursor(HAND);
    pushMatrix();
    translate(0+counter,150);
    counter = counter+3;
    image(img3,0,0);
    player5.play();
    popMatrix();
  }
    else
    {
    cursor(ARROW);
    }
    
    // Das Auge Saurons
    if (mouseX > 180 && mouseX < 200 && mouseY > 130 && mouseY < 150) {
      sauron = 1;
    }
    
    if(sauron == 1) {
      cursor(HAND);
      noStroke();
      fill (252, 126, 41, 100);
      triangle(190,135,mouseX-20,mouseY,mouseX+20,mouseY);
    }
   
  }




