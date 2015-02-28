
PImage Carter;
PImage bloodymary;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
int first30 = 30;
int sec30 = 30;
boolean state = false;
boolean gameStart = false;
int mouse1= 0;
void setup() {
  //background size
  size(1000, 800);
  Carter = loadImage("Car.png");
  bloodymary = loadImage("bloodymary.jpg");
}
void draw() {
  if (gameStart == false && state == false) {
    // before game display
    background(0, 0, 0);
    fill(255, 255, 255);
    textSize(20);
    text("Please, do not cheat by not going full round.", 50, 350);
    text("(such as moving your mouse between the goal line)", 50, 380);
    text("Turn on Volume and adjust the right size of your windows compare to this game is nesscary.", 80, 200 ); 
    text("Left click the box above to begin.", 320, 150);

    fill(45, 80, 60);
    text("Start!", 390, 0);
    fill(255, 255, 255);
    rect(415, 0, 100, 100);
    fill(255, 255, 255);
    if (mouseX > 415 && mouseX < 515 && mouseY > 0 && mouseY < 100) { 
      if (mousePressed && mouseButton == LEFT ) {
        gameStart = true;
      }
    }
  }
  else if (gameStart = true && state == false) {

    //backgound color of the track.
    background(10);
    //big rect
    rect(100, 0, 800, 800);  
    color i = color(255, 255, 255); 
    fill(i);
    smooth();
    //small rect
    rect(200, 100, 600, 600);


    color r = color(128, 128, 128); 
    fill(r);
    float redValue = red(r);  
    fill(redValue, 0, 0);
    // the red thing...goal line
    rect(395, 0, 20, 100);  
    fill(209);
    //race car
    image(Carter, mouseX-40/2, mouseY-30/2, first30, sec30);

    //size increase as car reach goal line
    while (mouseX > 390 && mouseX<400 && mouseY > 0 && mouseY < 100) {
      first30 += 10;
      sec30+=10;
      Carter.resize(first30, sec30);
      mouse1+= 10;
      println(mouse1);
      break;
      
    }
    println(mouseX + " , "  + mouseY);   //out of track, terrible thing shows up.
    if (mouseX < 120|| mouseX+mouse1 > 900 || mouseX+mouse1 > 200 && mouseX < 820 && mouseY+mouse1 > 80 && mouseY+12 < 700) {
      
      minim = new Minim(this);
      player = minim.loadFile("screaming.mp3", 2048);
      player.play();
      frameRate(60);
       image(bloodymary, 0, 0, 1000, 800);
      state = false;
     super.stop();
    }
  }
}


