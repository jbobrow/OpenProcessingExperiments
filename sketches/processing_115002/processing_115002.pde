
//Set the background music and clicking sound
import ddf.minim.*;
Minim minim;
AudioSample ding;
AudioPlayer bgmusic;

PFont font;

int[][] position;
int dx=65, dy=65;


void setup() {
  size(650, 650);
  background(255);
  noStroke();
  
font = loadFont("AbadiMT-CondensedExtraBold-48.vlw");
textFont(font);
  
  minim= new Minim(this);
  ding = minim.loadSample("elevator_bell.mp3");
  bgmusic = minim.loadFile("patriarch.mp3");
  bgmusic.loop();
  
  int[] nums = new int[100];
  
  for (int i = 0; i < 100; i++) {
     nums[i] = i+1;
  }
  
  // Random the numbers
  for (int i=0; i<1000; i++) {
    int randA = floor(random(100));
    int randB = floor(random(100));
    int temp = 0;
    
    temp = nums[randA];
    nums[randA] = nums[randB];
    nums[randB] = temp;
  }
  
  position = new int[10][10];
  //Initialize values of 2D array 
  int curPos = 0;
  for (int i=0; i<10; i++)
    for (int j=0; j<10; j++) {
        position[i][j] = nums[curPos];
        
      //draw and fill the circles  
        fill(random(255), random(255), random(200, 200));
        ellipse(i*dx+(dx/2), j*dy+(dy/2), dx, dy);

        //draw the number
        textSize(25);
        fill(50);
        if (position[i][j] <10) {
          text(position[i][j], i*dx+(dx/4)+7, j*dy+42); 
        } else if (position[i][j] == 100) {
          text(position[i][j], i*dx+(dx/4)-7, j*dy+42); 
        } else {
          text(position[i][j], i*dx+(dx/4), j*dy+42); 
        }
        
        ++curPos;
    }
}



int value=0;
int curNum = 0;

void draw(){
  
 //Set the mousePressed and the condition of clicking
 if (mousePressed && curNum < 100) {
   int xPos = floor(mouseX/dx);
   int yPos = floor(mouseY/dy);
   if (xPos >= 0 && xPos <= 9 && yPos >= 0 && yPos <= 9) {
     
      //check the number 
      println("X " + mouseX + " Y " + mouseY);
      println("xPos " + xPos + " yPos " + yPos);
      println("curNum " + position[xPos][yPos]);
      
      //Set the position is  in chronological sequence
     //it will turn white after it clicked 
      if (position[xPos][yPos] == curNum+1) {
        fill(255);
        ellipse(xPos*dx+(dx/2), (yPos*dy)+(dy/2), dx, dy);
        ++curNum;
      }
   }
   }
  
  //Set the clicking sound
  if (mousePressed)
   ding.trigger();

}


