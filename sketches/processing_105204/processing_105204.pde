
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//import guru.ttslib.*;
//TTS tts;
Minim minim;
AudioPlayer player;*/
void setup(){
  size(1920,1036);
  //tts = new TTS();
  //minim = new Minim(this);
  //player = minim.loadFile("Water-Lisa_Redfern-1888623835.mp3");
  
}
void draw(){
  //player.play();
  if(mousePressed == true){
    if(mouseButton == LEFT){
      background(0);
      lines();
    }
    else if(mouseButton == RIGHT){
      background(255);
      arcs();
    }
  }
  else if(keyPressed == true && mousePressed == false){
    //background(255);
    if(key == CODED){
      background(255);
      lines();
    }
    else{
      background(0);
      arcs();
    }
  }
  /*else if(keyPressed == true && mousePressed == true){
    if(key == CODED){
      lines();
    }
    else{
      arcs();
    }
  }*/
  //println(mouseX);
  //println(mouseY);
}
void lines(){
  for(int i = 0; i<100; i++){
    stroke(random(255),random(255),random(255));
    strokeWeight(random(5));
    line(mouseX,mouseY,random(-500,2420),random(-500,1536));
  }
}
void arcs(){
  for(int i = 0; i<150; i++){
    stroke(random(255),random(255),random(255));
    strokeWeight(random(5));
    noFill();
    arc(mouseX,mouseY,random(100,1920),random(100,1036),random(7),random(7));
  }
}


