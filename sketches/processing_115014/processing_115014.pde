
import ddf.minim.*;

Minim minim;
AudioPlayer player1;



void setup(){
    size(500,500);
     minim = new Minim(this);
     player1 = minim.loadFile("bloodbuzzohio.mp3");
    
  }
  
  
void draw(){
  
    
  if(mousePressed == true){
    if(mouseX < width/2 && mouseY < height/2){
      noStroke();
      fill(255,random(0,255),140);
      rect(random(0, 500),random(0, 500),20,20);
    
      player1.play();
      
    }


  

  }else{
      background(192);
      player1.pause();
    
  }
  
}


