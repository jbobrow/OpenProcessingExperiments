
import processing.video.*;
Movie Monsters;
PImage TV;


void setup(){
  size(600,600);
  smooth();
  TV = loadImage("TV.png");  
  image(TV,0,0);
  Monsters = new Movie(this,"monsters.mov");
 
}

void draw() {
  text("on",80,390,40);    
}   

void movieEvent(Movie Monsters) {
  Monsters.read();
   
}

  void mousePressed(){
   if(dist(80,390,mouseX,mouseY) < 15){
      image(Monsters,190,100,240,180);
      Monsters.play();
   }  else {
      Monsters.stop();

}
}  
  



