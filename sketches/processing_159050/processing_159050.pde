
import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioInput input;
 
 
color rectColor, rectHighlight;
color currentColor;

float[][] rectB = {  {20, 420, 100 , 20},  {20, 450, 100 , 20}, {140, 420, 100 , 20},
                      {140, 450, 100 , 20}, {260, 420, 100 , 20}, {380, 420, 100 , 20}, {380, 450, 100 , 20},
                      {260, 450, 100 , 20}, {500, 420, 100 , 20}, {500, 450, 100 , 20}
                      };

float posX;          // X-axis distance to move
float posY;          // Y-axis distance to move
float startY;          // Y-axis distance to move
float velX;          // X-axis distance to move
float velY;          // Y-axis distance to move

float g;   // Determines the curve

float step = 0.04;    // Size of each step along the path
float t = 0.00;    // Size of each step along the path

PImage record;

int currentsong;

int[][] data = new int[10][100];
float[][] params = new float[10][4];
String[] songnames;

void setup() {
  
  size(640, 480);
  noStroke();
  stroke(0);
  
  
  String[] stuff3 = loadStrings("songnames.csv");
  songnames = split(stuff3[0],',');
  int numsongs=songnames.length;
  
  // Load text file as a string
  String[] stuff = loadStrings("positions.csv");
  // Convert string into an array of integers using ',' as a delimiter
  String[] stuff2 = loadStrings("parameters.csv");
  int cols;
  
  String[] row;
  
  for (int i = 0; i < numsongs; i++) {
         row = split(stuff[i], ",");
         cols = split(stuff[0], ",").length;
         for (int j = 0; j< cols; j++) {
            data[i][j] = int(row[j]);
         }
         row = split(stuff2[i], ",");
         cols = split(stuff2[0], ",").length;
         for (int j = 0; j< cols; j++) {
            params[i][j] = float(row[j]);
         }

  }
        
  currentsong=2;
  
  
  record  = loadImage("Vinyl.png");
  posX=0.0;
  velX=20.0;
  
  rectColor = color(140);
  rectHighlight = color(70);
  
  posY=params[currentsong][0];
  startY=params[currentsong][0];
  velY=params[currentsong][1];
  g=params[currentsong][2];
  
  
  minim = new Minim(this);
  player = minim.loadFile("ShortTakeOn.mp3");
  
  
}

void draw() {
  
  int highup=50;
  
  
  background(255,255,255);
  
  stroke(1);
  textSize(15); 
  
  for (int i = 0; i < songnames.length; i++) {

      if (overRect(rectB[i][0], rectB[i][1], rectB[i][2], rectB[i][3])) {
        fill(rectHighlight);
      } 
      else {
        fill(rectColor);
      } 
    rect(rectB[i][0]+10, rectB[i][1], rectB[i][2], rectB[i][3]);
    fill(255);
    text(songnames[i], rectB[i][0]+13, rectB[i][1]+15);
  }
  t=t+step;
  
  fill(1);
  
  textSize(26); 
  
  int xadjust=220;
  int yadjust=-100;
  
  text("Entry    :", width/2-xadjust, height/2-yadjust);
  text("Velocity :", width/2-xadjust, height/2+30-yadjust);
  text("Gravity  :", width/2-xadjust, height/2+60-yadjust);
      
  
  text(round(100-startY), width/2-xadjust+120, height/2-yadjust);
  text(round(velY), width/2-xadjust+120, height/2+30-yadjust);
  text(g, width/2-xadjust+120, height/2+60-yadjust);
  //text(songnames.length, width-80, 60);
    
  //Positions
  for (int i = 0; i < data[currentsong].length; i++) {
    fill(0);
    
    if (data[currentsong][i]>0) {   
        rect(i*20+2.5,highup+3*data[currentsong][i],5,5);
    }
  }
  
  //Lines
  stroke(255,0,0);
  textSize(15); 
  strokeWeight(1);
  fill(255,0,0);
  text("Number 1",0,highup-2);
  line(0,highup,640,highup);
  line(0,highup+30,640,highup+30);
  text("Top 10",0,highup+30-2);
  line(0,highup+120,640,highup+120);
  text("Top 40",0,highup+120-2);
  stroke(0);
   fill(0,0,0);
  
  //for (int i = 5; i < 40; i=i+5) {
    //    text(i, i*20-10, 440);
      //}

  posX=0;
  posY=startY;
  float posXold=0.0;
  float posYold=startY;
  strokeWeight(4);
  for (float traj = 0.1; traj < t; traj=traj+0.1) {
    posXold=posX;
    posYold=posY;
    posX=velX*traj;
    posY=startY + velY*traj - g*traj*traj;
    line(posXold,highup+3*(100-posYold),posX,highup+3*(100-posY));
  }  
  posX=velX*t;
  posY=startY + velY*t - g*t*t;
  
  //translate(posX, posY);
  //rotate(posX);
  image(record, posX-40, highup+3*(100-posY)-40, 80, 80);
  
}



boolean overRect(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
   for (int i = 0; i < songnames.length; i++) {

      if (overRect(rectB[i][0], rectB[i][1], rectB[i][2], rectB[i][3])) {
        currentsong=i;
          posY=params[currentsong][0];
  startY=params[currentsong][0];
  velY=params[currentsong][1];
  g=params[currentsong][2];
  t=0;
          posX=0.0;
  velX=20.0;
  player.rewind();
  player.play();
      } 
  }
}



