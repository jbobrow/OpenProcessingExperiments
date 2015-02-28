
/*import ddf.minim.*;*/


int groesse = 10;
float bloed = random (100);
color fillVal = color(126);
int zahl = -1;
/*Minim minim;
AudioPlayer player;*/


void setup () 
{
  size (1200, 640) ;
  background(255);
  colorMode(HSB, 100);
  frameRate(40);
  rectMode(CENTER);
 /* minim = new Minim (this);
  player = minim.loadFile("Recognizer.mp3");
  player.play();*/
}
void draw () 
{
  fill(100, 10);
  noStroke();
  rect(width/2, height/2, width, height);


  strokeWeight(5);
  stroke(bloed, 200, 100);
  rect(mouseX, mouseY, 0, 0);
  bloed=(bloed + 1) 0;

  if (groesse<0 || groesse > 1000){
    zahl = -zahl;
  }


  if (mousePressed) {
    ellipse(mouseX, mouseY, groesse, groesse);
    groesse = groesse+zahl;
  }
  else {
    rect(mouseX, mouseY, groesse, groesse);
    groesse=groesse-zahl;
  }
  if (keyPressed) {
    rect(mouseX, mouseY, pmouseX, pmouseY);
   /* player.pause();*/
  }
  else{
    
  }
}
