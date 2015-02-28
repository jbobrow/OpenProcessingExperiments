
//import processing.video.*;

//Movie myMovie;
float fr = 15;

void setup(){
  size(600, 600);
  smooth();
  
  //myMovie = new Movie(this, "storm.mp4");
  //myMovie.play();
  //myMovie.loop();
  //myMovie.frameRate(30);
  
}
 
void draw(){
  background(20);
  noFill();
  frameRate(fr);
  //image(myMovie, 0, 0);
  
//vertical lines
noFill();
strokeWeight(random(0.01, 1)); //strokeweight is random between 0.01 and 1
rectMode(CENTER);

  stroke(#033639, 150);
  rect(random(width), height, random(250), 600); //boxes extend outside of box, so only lines appear
  stroke(#22A99A, 150);
  rect(random(width), height, random(250), 600);
  stroke(#44BFAB, 150);
  rect(random(width), 0, random(250), 600);
  stroke(255, 150);
  rect(random(width), 0, random(250), 600);
  
  rect(random(width), height, random(250), 600);
  stroke(#22A99A, 150);
  rect(random(width), height, random(250), 600);
  stroke(#44BFAB, 150);
  rect(random(width), 0, random(250), 600);
  stroke(255, 150);
  rect(random(width), 0, random(250), 600);
 
 }
 
 void mousePressed(){
 fr = 5;
 }
 
 void mouseReleased(){
 fr += 15;
 }
 
// void movieEvent(Movie m) { 
//  m.read(); 
//} 

