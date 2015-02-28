
/*
Processing Matrix
by James Patrick Gordon
Inspired by ToneMatrix by Andre' Michelle
Special thanks to Zach Breman for his expertise.

This work is released under a GNU General Public License. For more information, go to: http://www.gnu.org/licenses/gpl.html
*/
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;

//Used to set how many buttons in each row and column.
final static int X = 24, Y = 22;

//This is creating an instance of a grid of 10 X 10 buttons
button[][] b = new button[Y][X];

//Creates a stepX and time var so that we can step based on time.
int stepX = 0;
long time = 0;
AudioSample[] sounds;
Runnable rn;
Thread thr1;
void setup() {
  size(850,780);
  smooth();
  frameRate(8);
  rectMode(CENTER);
  minim = new Minim(this);
  String[] filenames = { 
    "C1.mp3", "D1.mp3", "E1.mp3", "F1.mp3", "G1.mp3", "A1.mp3", "B1.mp3", "C2.mp3", "D2.mp3", "E2.mp3", "F2.mp3", "G2.mp3", "A2.mp3", "B2.mp3", "C3.mp3", "D3.mp3", "E3.mp3", "F3.mp3", "G3.mp3", "A3.mp3", "B3.mp3", "C4.mp3"   };
  //ZB: This initiates each of the buttons in the grid.
  for(int y = 0; y < Y; y++){
    for(int x = 0; x < X; x++){
      b[y][x] = new button(22 + (x*35), 22 + (y*35), 25, 25);
    }
  }
  sounds = new AudioSample[filenames.length]; 
  for(int i = 0; i < filenames.length; i++){ 
    sounds[i] = minim.loadSample(filenames[i], 1024);
  }
  
  stepX = 0;
  //Sets the step time to current time to play the first column at start.
  time = System.currentTimeMillis();
  rn = new Runnable(){
    public void run(){
      while (true){
        //This checks to see if the current time is greater then the time set last time the step played.
        if(System.currentTimeMillis() > time){
	//Play through the sounds of the on buttons in the column
	for(int i = 0; i < Y; i++){
		if(b[i][stepX].isChecked){
                        b[i][stepX].isHit = true;
			sounds[i].trigger();
                        
                }
                //System.out.println(stepX + " " + i); 
     	}
	//Step the column by one then set it back to 0 when it gets to the end.
	if(++stepX == X) stepX = 0;
	time = System.currentTimeMillis() + 100;
  }
      }
    }
  };
  thr1 = new Thread(rn);
  thr1.start();
}

void draw() {
  //This draws and updates each of the buttons in the grid
  for(int y = 0; y < Y; y++){
    for(int x = 0; x < X; x++){
      b[y][x].draw();
      b[y][x].update();
    }
  }

  
  
}

class button {
  //This sets the color for each button
  color c;
  int x, y, w, h;
  boolean isChecked;
  boolean isHit;
  button(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void draw(){
    strokeWeight(5);
    fill(c);
    rect(x,y,w,h);
  }

  void update(){  
    if(mousePressed == true && mouseX <= x + w/2 && mouseX >= x - w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
      isChecked = !isChecked;
      c = (isChecked) ? 255 : (isChecked && isHit) ? 128 : 0;
    }
    
  }
}

void stop()
{
  // always close Minim audio classes when you finish with them
  for(int i = 0; i < sounds.length; i++){
  sounds[i].close();
  }
  minim.stop();
 
  super.stop();
}

