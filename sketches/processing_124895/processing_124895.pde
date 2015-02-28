
//This is a classic experiment about automata: the Game of Life. Invented by John Conway and developed 
//by Steven Wolfram in about 1970s.

import ddf.minim.*;
//Global Variables
Minim minim;
AudioPlayer bgmusic;
AudioSample create;
//Define the grids to enable animation
int[][] grid,futureGrid;
//set the clor paelette
color[] palette={#FF0000,#F52828,#F26767,#36FF00,#5EF236,#A0F236,#1800FC,#5747EA,#69B5F2};
color[] bg={#404243};
PImage img;   //Title image and a blank background image
PImage bgm;
float r=10;   //set the radius of the pixels
float r2=6;
int keyis = 0; //used to save independent screenshoot

void setup(){
  //set background music
  minim=new Minim(this);
  bgmusic=minim.loadFile("bgm.mp3");
  bgmusic.play();
  create=minim.loadSample("create.mp3");
  
  //set frame
  size(1200,600);
  frameRate(40);
  grid=new int[2*width][2*height];
  futureGrid=new int[2*width][2*height];
  
  //Initialize
  float density=0.3*width*height;  
  for (int i=0;i<density;i++){       
    grid[int(random(width))][int(random(height))]=1;
  }
  background(bg[0]);
  //Load Image
  img=loadImage("title1.png");
  bgm=loadImage("background.png");
}

void draw(){
  if(frameCount<120){       //The headline picture
    image(img,0,0);
  }
  if(frameCount>=120 && frameCount<130){    //erase the headline
     image(bgm,0,0);
  }   
  
  if(frameCount>130){      //enter the game
    for(int x=1;x<width-20;x=x+20){
      for(int y=1;y<height-20;y=y+20){
        //check the number of nearby pixels
        int nb= neighbors(x,y);
        if ((grid[x][y]==1)&&(nb<2)){
          futureGrid[x][y]=0;  //die for loneliness
          noStroke();
          fill(bg[0]);
          rect(x,y,20,20);
        }
        else if ((grid[x][y]==1)&&(nb>3)){
          futureGrid[x][y]=0;  //die for overpopulation
          noStroke();
          fill(bg[0]);
          rect(x,y,20,20);
        }
        else if ((grid[x][y]==0)&&(nb==3)){
          futureGrid[x][y]=1;  // born
          stroke(palette[floor(random(9))]);
          strokeWeight(random(7));
          fill(bg[0]);
          ellipse(x+10,y+10,r,r);
          ellipse(x+10,y+10,r2,r2);
        }      
        else{
          futureGrid[x][y]=grid[x][y]; // keep alive
        }
      }
    }
    //swap current and future grid
    int[][] temp=grid;
    grid=futureGrid;
    futureGrid=temp;
  }    
}

//count the neighbors
int neighbors(int x, int y){
  int north=(y+height-20)%height;
  int south=(y+20)%height;
  int east=(x+20)%width;
  int west=(x+width-20)%width;
  return grid[x][north]+
         grid[east][north]+
         grid[east][south]+
         grid[east][y]+
         grid[x][south]+
         grid[west][south]+
         grid[west][y]+
         grid[west][north];
      }
      
void mouseDragged(){    //Enable mouse input
  if(frameCount>130){
    if (mouseX<width-20 && mouseX>20 && mouseY<height-20 && mouseY>20){
         grid[int(mouseX/20)*20+1][int(mouseY/20)*20+1]=1;  //create new life
         grid[int(mouseX/20)*20+21][int(mouseY/20)*20+21]=1;  //create new life    
         grid[int(mouseX/20)*20+41][int(mouseY/20)*20+41]=1;  //create new life
    }
  }
}
void mouseReleased(){
  if(frameCount>130){
      create.trigger();}
}
void keyReleased(){     //Enable screen shoot
  keyis = keyis  + 1;//counting key presses.
  if (key == 's' || key == 'S') {
    saveFrame("Screenshot"+keyis+".png");//key press count helps to make independent images.
  }
}

  

