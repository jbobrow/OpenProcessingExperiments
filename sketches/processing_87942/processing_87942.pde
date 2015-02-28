
PImage img; 
import ddf.minim.*;
Minim minim;
AudioPlayer player;

void setup(){
  size (700, 500);
  img = loadImage ("hand_pic.jpg");
 // noCursor();
  textFont (createFont ("SansSerif", 20));
  minim = new Minim(this);
  player = minim.loadFile ("track_1.wav");
  
}

void draw(){
  background (167, 188, 188);
  noStroke();
  fill (175, 32,44);  // RED
  rect (550, 100, 125, 200); //ticket box
  fill (255, 255, 255); // text colour
  text ("Ticket", 580, 164);
  text ("Dispenser", 565, 185); 
  
 //imageMode (CENTER);
 //image(img, mouseX, mouseY, img.width/2, img.height/2);
  println (mouseX + " " + mouseY);
  
  if (mouseX <= width/2){
  fill (175, 32, 44); // RED
  rect (550, 293, 100, 7);
  
}else { 
  fill(255, 250, 250);
rect (500, 293, 100, 7);  
}

if (mouseX >= 500 && mouseX <= 600 && mouseY >= 293 && mouseY <= 300){
//fill (30, 90, 120);
//rect (500, 293, 100, 7);  //first I tested with a colour change 
player.play();

}

}


