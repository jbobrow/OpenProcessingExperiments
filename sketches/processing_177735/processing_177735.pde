
//Library
import ddf.minim.*;

//Global
Minim minim;
AudioPlayer soundfireworks;
color[] palette =
{#FFFFFF, #FCD361, #F511DF, #2623FA, #FABD23, #FC2E2E, #FCFC61};
float x;
float y;

//Declare background image
PImage fireworks;

//Setup fireworks background

void setup(){
  minim = new Minim(this);
  soundfireworks = minim.loadFile("soundfireworks.mp3");
  soundfireworks.play();
  size(835, 720);
  fireworks = loadImage("fireworks.jpg");
}

//Draw image
void draw(){
  image(fireworks, 0, 0);
  println("start boxes");
  frameRate(60);
  if (keyPressed == true){
    x+=50;
    y+=10;
    float z = random(7);
    pushMatrix();
    rotate(radians(random(20)));
    stroke(palette[int (z)]);
    fill(palette[int (z)]);
    rect(random(x), random(y), 50, 50);
    strokeWeight(20);
    point(random(x), random(y));
  //  ellipse(random(x), random(y), random(100), random(10));
    strokeWeight(5);
    line(random(x), random(y), random(x), random(y));
    noFill();
    strokeWeight(5);
    arc(random(x), random(y), random(200), random(50), 3.14, random(6.0));
    x = constrain(x, y, width);
    y = constrain(x, y, height);
    popMatrix();
  }
}

//Save screenshot. place code in void keyReleased
//void keyReleased(){
//  if (key == 's' || key == 'S') saveFrame("screenshot1.png");



