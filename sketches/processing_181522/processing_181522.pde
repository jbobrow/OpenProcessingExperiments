
int millisecs;
int seconds;
int minutes;
boolean start = false;
boolean starter;
void setup(){
}
void draw(){
  background(0);
  if(start){
  if (int(millis()/100)  % 10 != millisecs){
    millisecs++;
    
  }
  if (millisecs >= 10){
    millisecs -= 10;
    seconds++;
  }
  if (seconds >= 60){
    seconds -= 60;
    minutes++;
  }
  }
  //view
  textAlign(CENTER);
  fill(255);
  textSize(15);
  text(nf(minutes, 2) + ":" + nf(seconds, 2) + "." + nf(millisecs, 1) , width/2, height/2);
}
void mouseClicked(){
    if(start == false){
      starter = true;
    }
    if(start == true){
      starter = false;
    }
  start = starter;
}
void keyPressed(){
  if(key == ' '){
    millisecs = 0;
    seconds = 0;
    minutes = 0;
  }
}
