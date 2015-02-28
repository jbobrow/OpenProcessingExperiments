
import processing.video.*;
//////video////////
Capture capture;
PImage bg;
PImage shadow;
PImage dots;

//////life_game///////
int cellSize = 50;
int[][] nextCell;
int[][] temp;
color cellColor;
int d = 5;
PImage lg;

int capWidth = d * cellSize;
int capHeight = d * cellSize;

void setup(){
  //background(255);
  size(2*d*cellSize,2*d*cellSize);
  colorMode(HSB,360, 255, 255);
  smooth();
  noStroke();
  
  temp = new int[cellSize][cellSize];
  for(int i=0; i<cellSize ; i++){
    for(int j=0; j<cellSize ; j++){
      //cell[i][j]=0;
      temp[i][j]=0;
    }
  }
  frameRate(5);
//////////////capture////////////////////
  capture  = new Capture(this,capWidth,capHeight);
  bg = new PImage(capWidth,capHeight);
  shadow = new PImage(capWidth,capHeight);
  dots = new PImage(capWidth,capHeight);
  lg = new PImage(capWidth,capHeight);
}

void draw(){
/////////////////////life_game////////////////
  nextCell = new int[cellSize][cellSize];
  
  fill(255,0,255,150);
  rect(width/2,height/2,capWidth,capHeight);
  
  for(int i=1; i<cellSize-1; i++){
    for(int j=1; j<cellSize-1; j++){
      int sum = temp[i-1][j-1]+temp[i][j-1]+temp[i+1][j-1]+temp[i-1][j]+temp[i+1][j]+temp[i-1][j+1]+temp[i][j+1]+temp[i+1][j+1];
      
      if(temp[i][j]==1){
        if((sum == 3)||(sum == 2)){
          nextCell[i][j]=1;
        }
        if(sum > 3){
          nextCell[i][j]=0;
        }
        if(sum < 2){
          nextCell[i][j]=0;
        }
      }
      if(temp[i][j]==0){
        if(sum==3){
          nextCell[i][j]=1;
        }
        if(sum>3){
          nextCell[i][j]=0;
        }
        if(sum<2){
          nextCell[i][j]=0;
        }
      }
      
    }
  }

/////////////////////picture//////////////////
  if((keyPressed == true)&&(key == 'a')){
    capture.read();
    PImage bg = (PImage)capture;
    image(bg,width/2,0);
    bg.loadPixels();
  }
  
  if((keyPressed == true)&&(key == ' ')){
    capture.read();
    PImage shadow = (PImage)capture;
    image(shadow,0,0);
    shadow.loadPixels();
    dots.loadPixels();

    for(int y=0;y<capHeight;y+=5){
      for(int x=0;x<capWidth;x+=5){
        int pos=(y*capWidth)+x;
        float difRed = abs(red(bg.pixels[pos])-red(shadow.pixels[pos]));
        float difGreen = abs(green(bg.pixels[pos])-green(shadow.pixels[pos]));
        float difBlue = abs(blue(bg.pixels[pos])-blue(shadow.pixels[pos]));

        if((difRed > 120)||(difGreen > 120)||(difBlue > 120)){
          dots.pixels[pos]=color(0);
          nextCell[x/5][y/5]=0;
        }else{
          dots.pixels[pos]=color(255);
          nextCell[x/5][y/5]=1;
        }
      }
    }
    dots.updatePixels();
    image(dots,0,height/2);
    
  }
  for(int i=1; i<cellSize-1; i++){
    for(int j=1; j<cellSize-1; j++){
      if(nextCell[i][j] == 1){
        fill(random(0,360),200,255);
        ellipse(capWidth + d * i, capHeight + d * j, d, d-2);
      }
    }
  }
  temp = nextCell;
    
}



