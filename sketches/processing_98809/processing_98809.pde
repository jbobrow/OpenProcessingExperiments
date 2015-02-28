
//I used the API library "Apple light Sensor"
//JiYoung Lee
//Final project2
//copyrights @ JIYOUNG LEE

import lmu.*;
int lmu_left;
int lmu_right;
float multi;
int li;
int re;
float[] x = new float[20];
float[] y = new float[20];
float wx,wy,wd, wxSpeed, wySpeed;
PImage bird;
 
void setup()
{
  size(600,600);
  //frameRate(20);
   int[] lmu_start = LmuTracker.getLMUArray();
  lmu_left  = lmu_start[0];
  lmu_right = lmu_start[1];
  multi = 255.0 / (lmu_left);
   wx = 100;
  wy = 50;
  wd = 50;
  wxSpeed = 5;
  
  for(int i = 0; i <x.length; i ++){
   x[i] = random(0, width);
   y[i] = random(0, 150);
  } 
  bird=loadImage("bird.png");
}
void draw()
{

  smooth();
  drawDay(); 
  moveWrap();
  drawLight();
  drawNight();
}

void drawDay()
{
  background(255);
  //noStroke();
  fill(245,236,133);
  ellipse (100,100,100,100);
  image (bird, wx,wy,wd,wd);
 
  //houses
  fill(237,71,45);
  rect(350,370,20,35);
  triangle(300,350,175,450,425,450);
  fill(234,230,206);
  rect(195,450,210,200);
  fill(72,142,37);
  triangle(600,350,475,450,725,450);
  fill(234,230,206);
  rect(500,450,210,200);
  fill(45,52,118);
  rect(50,370,20,35);
  triangle(0,350,-125,450,125,450);
  fill(234,230,206);
  rect(0,450,105,200);
  
  //windows
  strokeWeight(2);
  fill(232,232,138);
  strokeWeight(2);
  stroke(0);
  rect(235,480,40,40);
  stroke(0);
  strokeWeight(2);
  line(255,480,255,520);
  line(235,500,275,500);
  
  
  rect(325,480,40,40);
  line(345,480,345,520);
  line(365,500,325,500);
  
  rect(35,480,40,40);
  line(55,480,55,520);
  line(35,500,75,500);
  rect(535,480,40,40);
  line(555,480,555,520);
  line(535,500,575,500);
}

void drawLight()
{
        // get current sensor values
  int[] vals = LmuTracker.getLMUArray();
  int li = (int)(vals[0] * multi);
  int re = (int)(vals[1] * multi);
 noStroke();
 // left sensor
  fill(li);
  rect(0, 0, width/2, height);
  // right sensor
  fill(re);
  rect(width/2, 0, width/2, height);
}

void drawNight()
{
  for (int i = 0; i <20; i ++){ 
   
     stroke(255,255,255,50);
     strokeWeight(2);
      line(x[i], y[i]-10, x[i], y[i]+10);
     line(x[i]-10, y[i]-10, x[i]+10, y[i]+10);
     line(x[i]+10, y[i]-10, x[i]-10, y[i]+10);
   }
  
  noStroke();
  fill(245,236,133);
  ellipse (100,100,100,100);
  fill(255);
  textSize( 20 );
  text("Press down your mouse to turn off the light!", 100,350 );
  fill(0);
  textSize( 20 );
  text("Go to a darker area to change the day to night!", 80,300 );
 
  //windows
  
  strokeWeight(2);
  fill(232,232,138);
  strokeWeight(2);
  stroke(0);
  rect(235,480,40,40);
  stroke(0);
  strokeWeight(2);
  line(255,480,255,520);
  line(235,500,275,500);
  rect(325,480,40,40);
  line(345,480,345,520);
  line(365,500,325,500);
  rect(35,480,40,40);
  line(55,480,55,520);
  line(35,500,75,500);
  rect(535,480,40,40);
  line(555,480,555,520);
  line(535,500,575,500);
  
  if( mousePressed == true){
  strokeWeight(2);
  fill(0);
  rect(235,480,40,40);
  rect(325,480,40,40);
  rect(35,480,40,40);
  rect(535,480,40,40);

 }
  
}

void moveWrap()
{
 wx=wx+wxSpeed;
if (wx> width)
{wx=-width+wd*.55;}
  
}

 





