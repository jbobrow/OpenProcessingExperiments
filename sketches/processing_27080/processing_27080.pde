
import ddf.minim.*;
Minim minim;
AudioPlayer song;



float angle = 0.0;
float speed = .17;
int time1 = 4000;
int time2 = 9000;
int time3 = 12800;
int time4 = 14000;
int time5 = 17400;

void reset_sketch()
{
  background(0);
}


void setup() {
  minim = new Minim (this);
  song = minim.loadFile("alicesong.mp3");
  song.play();
  size(500,500);
  smooth();
  background(0);
}

void draw() {
  int currentTime=millis();
  translate (mouseX, mouseY);
  rotate(angle);
  strokeWeight(2);
  rect(-15,-15,70,70);
  angle += speed;
  
  if (currentTime>time1) {
    fill(57, 237,226);
  }
  if (currentTime>time2) {
    fill(176, 5, 229);
     
  
}
  
  if (currentTime>time3) {
    fill(181,237,14);}
    
  if (currentTime>time4) {
   fill (14, 90, 5);}
   
   if (currentTime>time5) {
     fill(47,7,216);}
  
  if(mousePressed){ fill(255);}
  //if (mouseButton == LEFT){
  //fill(57, 237,226);}
  //if (mouseButton == RIGHT){
    //fill(176, 5, 229);}}
//else{  fill(255);}
}

 
void keyReleased(){
 if( key == 'r' ){
  reset_sketch();
 } 
}

void stop()
{
song. close();
minim.stop();
super.stop();
}



