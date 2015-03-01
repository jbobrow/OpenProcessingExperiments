
import ddf.minim.*;
import netscope.javascript.*;
  

Minim minim;
AudioPlayer song;
AudioPlayer player;

int suffle = 1;
int x=0;
int pause=1;
String[] audio = new String[4];


void setup(){
  
  audio[0] = "ff6 boss theme.mp3";
  audio[1] = "ff6 battle theme.mp3";
  audio[2] = "ff13 battle theme.mp3";
  audio[3] = "ff14 FATE boss battle.mp3";
  
  
  size(400,300);
  
  if(suffle != 1){
  
    song.close();
  
  }
  
  
 if(pause==1){
  
  if(x>0 || x<0){
  song.close();
  }
   
  if(x>3){
  
    x=0;
  
  }
  
  if(x<0){
  
    x=3;
    
  }
  
  
  
  minim = new Minim(this);
  song = minim.loadFile(audio[x]);
  song.play();
  println(audio[x]);
 }
 
 else{
   
   song.close();
   
 }
 

}


void next(){


//  song.close();

minim = new Minim(this);
  
  song = minim.loadFile(audio[x]);
  song.play();
  if (key == CODED) {
    if (keyCode == RIGHT) {

     return;
    
  
}
  }

}

void draw(){

  background(10);
  stroke(80,250,70);
  textSize(18);
  fill(50,250,80);

for(int i = 0; i < song.bufferSize() - 1; i++)
  {
    line(i, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }


  text("Now Playing:  "+audio[x],20,220);
  
  if(suffle == 1){
    stroke(250,50,80);
    text("Suffle", 20,260);
    fill(0,0,0,0);
    rect(15,238,60,30);

  }
  
  else{
  
    stroke(50,250,70);
    text("Suffle", 20,260);
    fill(0,0,0,0);
    rect(15,238,60,30);
  
  }
  

}

void keyPressed() {
  
  
  if (key == CODED) {
    if (keyCode == RIGHT) {
      
      
    x=x+1;
    println(x);
    setup();
  
}

  if (keyCode == LEFT) {
     
   if(suffle == 1){ 
      
    x=x-1;
    println(x);
    setup();
  
  if (x==0){
  
      song.close();
  
  }
   }
   
   else{
   
     x = int(random(3));
     println(x);
     setup();
     
     if (x==0){
  
      song.close();
  
  }
   
   }
  
  
}

 if (keyCode == UP) {
      
      
    if(pause==1){
    
      pause=pause*-1;
      setup();
    
    }
    
    else{
    
      pause=pause*-1;
      setup();
    
    }
  
  println(pause);
}

 if (keyCode == DOWN) {
      
     if(suffle == 1){
     
       suffle = suffle*-1;
       setup();
       
     } 
     
     else{
     
       suffle = suffle*-1;
       setup();
     }
     
  println("suffle", suffle);
  
  }
  
  
}

  }





