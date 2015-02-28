
import ddf.minim.*;

Minim minim;
AudioPlayer song;
int spazio = 50;
int value;

void setup(){
size(400,400);
  minim = new Minim(this); 
}

void draw(){
background(0);
stroke(0);
for (int x = 0; x <= width; x = x + spazio ){
  fill(255);
rect(x - 50,0,x,height);
}
fill(0);
rect(35, 0, 30, 250);
rect(85, 0, 30, 250);
rect(185, 0, 30, 250);
rect(235, 0, 30, 250);
rect(285, 0, 30, 250);
rect(385, 0, 30, 250);
}
//do
void mousePressed(){
if (mouseX < 35 && mouseY < 250 || mouseX < 50 && mouseY > 250){
  song = minim.loadFile("Do1.mp3");
  song.play();
  value = 0;
}
//re
if (mouseX > 65 && mouseX < 85 && mouseY < 250){
  song = minim.loadFile("Re1.mp3");
  song.play();
  value = 1;
}
if (mouseY > 250 && mouseX > 50 && mouseX < 100 || value == 1){
  song = minim.loadFile("Re1.mp3");
  song.play();
  value = 0;
}
//mi
if (mouseX > 115 && mouseX < 150 && mouseY < 250){
  song = minim.loadFile("Mi1.mp3");
  song.play();
  value = 2;
}
if ( mouseY > 250 && mouseX > 100 && mouseX < 150 || value == 2){
  song = minim.loadFile("Mi1.mp3");
  song.play();
  value = 0;
} 
//fa
if (mouseX > 150 && mouseX < 185 && mouseY < 250){
  song = minim.loadFile("Fa1.mp3");
  song.play();
  value = 3;
}
if (mouseY > 250 && mouseX > 150 && mouseX < 200 || value == 3){
  song = minim.loadFile("Fa1.mp3");
  song.play();
  value = 0;
}
//sol
if (mouseX > 215 && mouseX < 235 && mouseY < 250){
  song = minim.loadFile("Sol1.mp3");
  song.play();
  value = 4;
}
if (mouseY > 250 && mouseX > 200 && mouseX < 250 || value == 4){
  song = minim.loadFile("Sol1.mp3");
  song.play();
  value = 0;
}

//la
if (mouseX > 265 && mouseX < 285 && mouseY < 250){
  song = minim.loadFile("La1.mp3");
  song.play();
  value = 5;
}
if (mouseY > 250 && mouseX > 250 && mouseX < 300 || value == 5){
  song = minim.loadFile("La1.mp3");
  song.play();
  value = 0;
}


//si 
if (mouseX > 315 && mouseX < 350 && mouseY < 250){
  song = minim.loadFile("Si1.mp3");
  song.play();
  value = 6;
}
if (mouseY > 250 && mouseX > 300 && mouseX < 350 || value == 6){
  song = minim.loadFile("Si1.mp3");
  song.play();
  value = 0;
}

//do2
if (mouseX > 350 && mouseX < 385 && mouseY < 250){
  song = minim.loadFile("Do2.mp3");
  song.play();
  value = 7;
}
if (mouseY > 250 && mouseX > 350 && mouseX < 400 || value == 7){
  song = minim.loadFile("Do2.mp3");
  song.play();
  value = 0;
}

// I bemolli
//do#
if ( mouseX > 35 && mouseX < 65 && mouseY < 250){
  song = minim.loadFile("Do#1.mp3");
  song.play();
}
//re#

if ( mouseX > 85 && mouseX < 115 && mouseY < 250){
  song = minim.loadFile("Re#1.mp3");
  song.play();
}
// fa#
if ( mouseX > 185 && mouseX < 215 && mouseY < 250){
  song = minim.loadFile("Fa#1.mp3");
  song.play();
}
// sol#
if ( mouseX > 235 && mouseX < 265 && mouseY < 250){
  song = minim.loadFile("Sol#1.mp3");
  song.play();
}
//la#
if ( mouseX > 285 && mouseX < 315 && mouseY < 250){
  song = minim.loadFile("La#1.mp3");
  song.play();
}

}


