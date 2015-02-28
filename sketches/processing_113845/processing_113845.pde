
import ddf.minim.*;

Minim minim;
AudioSample laser;
AudioPlayer gundam0083;
PImage bg,gp01;
void setup(){
  size(960,600);
  bg=loadImage("space.jpg");
  bg.resize(960,600);
  gp01=loadImage("gp01.gif");//set up the background image and the image
    minim = new Minim(this);
    laser = minim.loadSample("laser.wav");
  gundam0083 = minim.loadFile("gundam0083.mp3");
  gundam0083.loop();//set up the sound effect and the background music
}

void draw(){
  if (mousePressed)
  laser.trigger();//when mouse pressed sound effect will play
  background(bg);
  frameRate(6);
  stroke(254,10,114);
  strokeWeight(1);
  line(random(1000),random(800),random(1000),random(800));
  stroke(66,225,26);
  line(random(1000),random(800),random(1000),random(800));
  stroke(254,10,114);
  line(random(1000),random(800),random(1000),random(800));
  stroke(66,225,26);
  line(random(1000),random(800),random(1000),random(800));//random line(laser) will be shown
  imageMode(CENTER);
  image(gp01,mouseX,mouseY,150,150);//image will follow the mouse
}
void mousePressed(){
  frameRate(5);
  stroke(28,82,190);
  strokeWeight(5);
  line(mouseX-78,mouseY-65,mouseX-778,mouseY-600);//when mouse press,line(laser)will be shoot
}
void mouseDragged(){
  frameRate(5);
  stroke(28,82,190);
  strokeWeight(5);
  line(mouseX-78,mouseY-65,mouseX-778,mouseY-600);//when mouse drag,line(laser)will also be shoot
}

