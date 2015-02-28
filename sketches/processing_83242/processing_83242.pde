
//Lillie Ferris
//liferris
//October 2012

PImage background;
PImage img;
PFont din, dinlight, dinbold;

float x, y, wd, ht, wdht, gamestate, fill; 
//int value = 225;
int counter;
int bottleIndex = 0;
String [] number = {"1", "2", "3","4","5","6","7","8"};
int [] bottleToDisplay = {
  2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,
  2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,0,5,5,6,6,6,6,6,6,7,7,7,7,7,
  2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,
  1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,
  1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,
  1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,
  1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,
  1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,
  0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,
  0,0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,
  0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6, 
  0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,
  0,0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,
  0,0,0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,
  0,0,0,0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5, 
  0,0,0,0,0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,  
};

PImage [] bottles;

void setup (){
  size (1200, 700); 
  background(255);
  smooth();
  din = loadFont("din.vlw");
  dinlight = loadFont("dinlight.vlw");
  dinbold = loadFont("dinbold.vlw");
  wdht = 25;
  wd = width;
  ht = height;
  noStroke();
  //rectMode(CENTER);
  img = loadImage("back.png");
    bottles = new PImage [8];
    bottles[0] = loadImage("0.png");
    bottles[1] = loadImage("1.png");
    bottles[2] = loadImage("2.png");
    bottles[3] = loadImage("3.png");
    bottles[4] = loadImage("4.png");
    bottles[5] = loadImage("5.png");
    bottles[6] = loadImage("6.png");
    bottles[7] = loadImage("7.png");
  //fill(0);

}

void draw (){
  prepWindow();
  drawBoxes();
  //drawLines();
  showBottle();
  
}

void showBottle() {
   println(bottleIndex); 
   //if i'm in the grid do this... 
   if(mouseX >= 76 & mouseX <= width-330 && mouseY >= 185 & mouseY <= height-75){
   image(bottles[bottleToDisplay[bottleIndex]],0,0);
   }else{
     img = loadImage("back.png");
}}

void prepWindow(){
  background (img);
  textFont(dinbold, 40);
  textAlign(LEFT);
  fill(10, 50);
  //text("CHOOSING YOUR BETTER BOTTLE", width/22.5 + 2, height/10);
}


void drawBoxes (){
 // background(255);
 counter = 0;
 
    y = 185;        //starts grid
   
    while (y < height-75){   //height from bottom
       x = 76;          
  
        while(x < width-330){  //moves right edge to left
      if (dist(x, y, mouseX, mouseY) < wdht*.65){
        fill(255, 150);
        bottleIndex = counter;
        //text("1");
        //diam = 50;
        
      }else { 
        fill(255,40);
        //diam = 30;
      }
    
     rect(x, y, wdht, wdht);
     counter++;
     fill(0);
     x += wdht+3;      //spacing up and down
    }
    y+= wdht+3;         //spacing side to side
  }
} //ending draw



