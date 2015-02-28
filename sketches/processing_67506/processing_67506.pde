
import codeanticode.gsvideo.*;

GSMovie movie;
int newFrame = 0;
PFont font;
int t;
float f;
int n;
String s;

void setup() {
  size(800, 600);
  background(0);
  movie = new GSMovie(this, "2.mp4");
  // Pausing the video at the first frame. 
  movie.play();
  movie.goToBeginning();
  movie.pause();
  
  font = loadFont("Serif-48.vlw");
  textFont(font, 16);
  fill(244,255,255);
}

void movieEvent(GSMovie movie) {
  movie.read();
}

void draw() {
  rect(0,0,width,height);
  image (movie, 50, 50, 300, 200);
  
  fill(255, 255, 255);
  
  t = movie.frame();
  text(t + " / " + (movie.length() - 1), 100, 30);
  text("test1:", 50, 300);
  text("test2:", 50, 330);
  text("test3:", 50, 360);
  text("Instruction", 500,180);
  
  text("Control the video with Left and Right arrow", 500,200,100,200);
  fill(0, 0, 0);
  
  
}

void keyPressed() {
  if (movie.isSeeking()) return;
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (0 < newFrame) newFrame--; 
    } else if (keyCode == RIGHT) {
      if (newFrame < movie.length() - 1) newFrame++;
    }
     movie.play();
     movie.jump(newFrame);
     movie.pause();         
  } 
}

void keyReleased(){
   if (key == CODED) {
     if (keyCode == SHIFT){
       n= int(random(1,5));
       s= n+".mp4";
       movie = (new GSMovie(this, s));
       
       
          
    }
   }
}

