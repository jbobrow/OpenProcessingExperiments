
import ddf.minim.*;

Minim minim;
AudioPlayer player1;

int diameter = 100;



void setup(){
    size(400,400);
     minim = new Minim(this);
     player1 = minim.loadFile("nabucco.mp3");
    
  }
  
  
void draw(){
  
    
  if(mousePressed == true){
    if(mouseX < height){
      fill(216,35,35);
      ellipse(200,200,diameter++,diameter++);

      player1.play();
      
    }
    

 
      
  }
  }



