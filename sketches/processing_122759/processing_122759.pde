
import ddf.minim.*;
 
Minim minim;
AudioSnippet player;

int flag = 0;
int c= 0; 
void setup()
{
  size(600, 600);
  colorMode(HSB,360);
  background(359);
  frameRate(10);
  minim = new Minim(this);
  //player = minim.loadSnippet("kouka.mp3");//narasuoto

}
 
void draw(){
  //background(359);
  stroke(c,360,360);
  noFill();
  smooth();
  if(mousePressed){
  ellipse(mouseX,mouseY,pmouseX,pmouseY);//mousenoenn
}
if(c >=359){
  c = 0;
}
c = c + 3;
  /*
  if(mouseX > width-5 || mouseX < 5|| mouseY > height-5 || mouseY < 5){
    if(!player.isPlaying()){
      player.rewind();
    }
    if(flag == 0){
    player.play();
    flag = 1;
    }
  }else if(mouseX <= width-5 || mouseX >= 5 || mouseY <= height-5 || mouseY >= 5){
    flag = 0;
  }//narasuiti
  
  println(mouseX);
}
 
void stop()
{
  player.close(); 
  minim.stop();
  super.stop();
}
*/
}
void keyPressed(){
  
  
  
 switch(key) {
    case 'b':
      background(255);
      println("a");
      break;
    case 'g':
      background(0,0,0);  
      println("A");
      break;
      case 'h':
      background(0);
      println("a");
      break;
    case 'y':
      background(0,0,255);  
      println("A");
      break;
  }
}


