
import ddf.minim.*;

Minim minim;
AudioPlayer player1;


AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

void setup(){
  size(500,500);
    minim = new Minim(this);
      player1 = minim.loadFile("001.mp3");
      
      player2 = minim.loadFile("001.mp3");
      player3 = minim.loadFile("001.mp3");
      player4 = minim.loadFile("001.mp3");


}

void draw(){
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  
  if(mousePressed == true) {
    if(mouseX < width/2 && mouseY < height/2){
      fill(255);
      rect(0,0,width/2,height/2);
       player1.play();
    }
     else if(mouseX > width/2 && mouseY  <height/2){
      fill(255);
      rect(width/2,0,width/2,height/2);
         player2.play();
     }
      else if(mouseX < width/2 && mouseY >width/2){
      fill(255);
      rect(0,height/2,width/2,height/2);
         player3.play();
     }
     else if(mouseX > width/2 && mouseY  >height/2){
      fill(255);
      rect(width/2,height/2,width/2,height/2);
         player4.play();
     }
     
  }
  else{
      background(192);
      line(width/2,0,width/2,height);
      line(0,height/2,width,height/2);
  }
  }
  

  




