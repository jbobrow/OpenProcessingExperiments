
import ddf.minim.*;

Minim minim;
AudioPlayer player1;
;

int diameter = 10;
int positionX = 0;
int Switch = 0; 



void setup(){
    size(700,200);
     minim = new Minim(this);
     player1 = minim.loadFile("mogwai.mp3");
   
  
  }
  
  
void draw(){
  
  background(194,194,194);
    
    if(positionX >= width-diameter/2){
    Switch = 1;
    
    }
    if(positionX == diameter/2){
      Switch = 0;
    }
    
    if(Switch == 0){
      fill(194,194,194);
    positionX++;
     player1.play();
     
      
    }else{
      fill(255);
      noFill();
  stroke(50);
  strokeWeight(random(2, 8));
  line(0, random(height), width, random(height));
      positionX--;
      player1.pause();
     
    
   }
   
    noStroke();
    fill(255,255,255);
    ellipse(positionX,100,diameter,diameter);
  
    

  
}


