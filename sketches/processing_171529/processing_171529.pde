
import arb.soundcipher.*;

SoundCipher sc;
boolean[] keysNotePlay;
int[] keysNoteMap;

void setup(){
  sc = new SoundCipher(this);
  keysNotePlay = new boolean[127];
  keysNoteMap = new int[127];
  keysNoteMap['a'] = 59;
  keysNoteMap['s'] = 61;
  keysNoteMap['d'] = 63;
  keysNoteMap['f'] = 64;
  keysNoteMap['g'] = 66;
  keysNoteMap['h'] = 68;
  keysNoteMap['j'] = 70;
  keysNoteMap['k'] = 71;
  size (400,150);
}

void keyReleased(){
  keysNotePlay[key] = false;
}


void draw() {
  background(255);
  strokeWeight(1);
  line(20,110,380,110);
  line(20,90,380,90);
  line(20,70,380,70);
  line(20,50,380,50);
  line(20,30,380,30);
 
  

  if( keyPressed && keysNotePlay['a'] == true){
   fill(0);
    ellipse(60, 130, 25, 20);
    line(45,130,75,130);
    
  } 

    if( keyPressed && keysNotePlay['s'] == true){
    fill(0);ellipse(90, 120, 25, 20);
  }

    if( keyPressed && keysNotePlay['d'] == true){
    fill(0); ellipse (120, 110, 25, 20);
  }
 
    if( keyPressed && keysNotePlay['f'] == true){
    fill(0);ellipse (150, 100, 25, 20);
  }
 
    if( keyPressed && keysNotePlay['g'] == true){
    fill(0);ellipse (180, 90, 25, 20);
  }
  
    if( keyPressed && keysNotePlay['h'] == true){
    fill(0);ellipse (210, 80, 25, 20);
  }
 
    fill(255);
    if( keyPressed && keysNotePlay['j'] == true){
    fill(0);ellipse (240, 70, 25, 20);
  }
  
    fill(255);
    if( keyPressed && keysNotePlay['k'] == true){
    fill(0);   ellipse (270, 60, 25, 20);
  }
    
 
 

  if( keyPressed && keysNotePlay[key] == false){
    
    sc.playNote(keysNoteMap[key], 100, 1);
    keysNotePlay[key] = true; 
  }

}


