
float posX; // position variables
float posY;
   
float speedX; // speed variables
float speedY;
  
Maxim maxim;
AudioPlayer[] players = new AudioPlayer[6];

  
void setup(){
  size(400,600);
  background(255,255,255);
  colorMode(HSB, 100);
  maxim = new Maxim(this);
  
  for (int i = 0; i < 6; i++) {
     players[i] = maxim.loadFile("piano" + (i + 1) + ".m4a");
     players[i].setLooping(false);
     players[i].volume(0.25);
     
  }

  posX = width / 2;
  posY = width / 2;
  speedX = 0;
  speedY = 0;
}
  
   
int toPlay = 0;
boolean bounce = false;
int h = 0;
  
void draw(){
  if (mousePressed) {
    if ((mouseX > (posX - 20) && mouseX < (posX + 20)) &&
        (mouseY > (posY - 20) && mouseY < (posY + 20))) {
      speedX = mouseX - pmouseX;
      speedY = mouseY - pmouseY;
    }
    return;
  }
  
  
 // Calculate the new position
  posX = posX + speedX;
  posY = posY + speedY;
  
  bounce = false;
   
  // If the position is outside of the window: bounce
  if (posX > width - 30 || posX <= 30) {
    bounce = true;
    if (posX <= 30) {
      if (posY < height / 2) {
        toPlay = 0;
      } else {
        toPlay = 1;
      }
    } else {
      if (posY < height / 2) {
        toPlay = 2;
      } else {
        toPlay = 3;
      }
    }
    speedX = -speedX;
  }
  if (posY > height - 30 || posY <= 30) {
    bounce = true;
    if (posY <= 30) {
      toPlay = 4;
    } else {
      toPlay = 5;
    }
    speedY = -speedY;
  }
  
  if (bounce) {
    players[toPlay].stop();
    players[toPlay].play();
  }
  
       
  //background(255);
  stroke(h++ % 100, 50, 100);
  fill(h++ % 100,50,100);
  ellipse(posX, posY,60,60);
  
}



