
PFont instruccion;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage foto1;

void setup() {
size(1000, 900);
smooth();
instruccion = loadFont("AppleCasual-60.vlw");
  textFont(instruccion);
  text("Intente colorear sin salirse de los márgenes", 150, 150, 200, 200);
minim = new Minim(this);
  foto1 = loadImage("serpiente.jpg");
background(foto1);
frameRate(63);
player = minim.loadFile("bebe.mp3", 2500);
player.play();
}
void draw(){
stroke(mouseX,0,mouseY);
float distance=dist(pmouseX,pmouseY,mouseX,mouseY);
float maxStroke=15;
strokeWeight(maxStroke-constrain(distance,0,maxStroke));
line(pmouseX,pmouseY,mouseX,mouseY);
}
void mouseClicked(){
ellipseMode(CENTER);
fill(mouseY,229,mouseX);
noStroke();
ellipse(mouseX,mouseY,25,25);
}
void keyPressed(){
background(229,250,73);
}


