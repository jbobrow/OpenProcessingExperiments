
import ddf.minim.*;

Minim minim;
AudioPlayer player1;

AudioPlayer player2;

int diameter = 100;
int positionX = 50;
int Switch = 0; 



void setup(){
    size(500,500);
     minim = new Minim(this);
     player1 = minim.loadFile("haiti.mp3");
     player2 = minim.loadFile("laika.mp3");
  
  }
  
  
void draw(){
  
  background(242,143,17);
    
    if(positionX >= width-diameter/2){
    Switch = 1;
    
    }
    if(positionX == diameter/2){
      Switch = 0;
    }
    
    if(Switch == 0){
      fill(5,143,175);
    positionX++;
     player1.play();
     player2.pause();
      
    }else{
      fill(255);
      positionX--;
      player2.play();
      player1.pause();
     
    
   }
   
    noStroke();
    ellipse(positionX,250,diameter,diameter);
  
    

  
}


