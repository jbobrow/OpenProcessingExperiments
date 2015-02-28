
/*
title: A Thread In Time --project 1 of IAT800 Processing Course
 description: More specific introduction is in the PDF file. Please check it:-)  
 created: September 25th,2012
 by: Xiaolan Wang (xiaolanw@sfu.ca)
*/

//import Minim
import ddf.minim.*; 

//set up the sound variables
Minim minim;
AudioPlayer song;

PImage img;

int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

//the x and y coordinate of the point in the img in order to get the point's color  
float cx;
float cy;

//initialize sketch
void setup() {

  //initialize the screen
  size(600, 780);
  background(255);  

  img = loadImage("skyColor.jpg"); 

  //initialize sound
  minim = new Minim(this);
  //this loads bell.mp3 from the data folder
  song = minim.loadFile("bell.mp3");

  int h=hour();
  int s=second();
  int m=minute();

  //draw hours' threads alread passed today 
  for (int y=780,i=1;y>=780-7.5*h;y-=7.5,i++) {
    for (int x=0;x<=600;x+=5) {

      //color the threads with the color got from the img by using map() method
      cx=60;
      cy=map(i, 1, 24, 20, 980);
      color c = img.get(int(cx), int(cy));

      if ((x%10)==0) {
        strokeWeight(2.5);
        curve(x, y, x, y, x+4, y+3, x+4, y+3);
        stroke(c, 200);
      }
      else {
        curve(x, y, x, y, x+4, y-3, x+4, y-3);
      }
    }
  }

  //draw minutes' threads already passed in current hour
  for (float y=780-h*7.5;y>780-h*7.5-(m-1)*10;y-=10) {
    for (int x=0;x<=600;x+=10) {

      //color the threads with the color from the img by using map() method
      cx=map(m, 1, 60, 1, 120);
      cy=map(h, 1, 24, 20, 980);
      color c = img.get(int(cx), int(cy));

      if ((x%20)==0) {
        strokeWeight(4);
        curve(x, y, x, y, x+7, y+7, x+7, y+7);
        stroke(c, 102);
      }
      else {
        curve(x, y, x, y, x+7, y-7, x+7, y-7);
      }
    }
  }

  //draw seconds' threads already passed in current minute 
  for (int x=0;x<s*10;x+=10) {

    //color the threads using the color from the img by using map() method
    cx=map(m, 1, 60, 10, 120);
    cy=map(h, 1, 24, 20, 980);
    color c = img.get(int(cx), int(cy));

    float y=780-h*7.5-(m-1)*10;//the y coordinate of start point of each second short line

    if ((x%20)==0) {
      strokeWeight(4);
      curve(x, y, x, y, x+7, y+7, x+7, y+7);
      stroke(c, 102);
    }
    else {
      curve(x, y, x, y, x+7, y-7, x+7, y-7);
    }
  }
}

void draw() {

  //get the hour, minute and second numbers from OS
  int s=second();
  int m=minute();
  int h=hour();

  //get 24 colors for each hour thread from the img using map() method
  cx=map(m, 1, 60, 1, 12);
  cy=map(h, 1, 24, 20, 980);
  color c = img.get(int(cx), int(cy));

  //caculate the x and y coordinate of start point of each short line
  int px= s*10;
  float py= 780-h*7.5-(m-1)*10;

  //draw a short line every second  
  if (s!=lastSecond) {
    if ((s%2)==0) {
      strokeWeight(4);
      curve(px, py, px, py, px+7, py+7, px+7, py+7);//draw a short line every second
      stroke(c, 102); //color the short line with the color from the img
    }
    else {
      strokeWeight(4);
      curve(px, py, px, py, px+7, py-7, px+7, py-7);
    }
    lastSecond =s;
  }

  //All the minutes' threads(the thick lines) are disappeard when an hour passes
  if (s==59&&m==59) {

    song.play(0);//play sound every 60 minutes pass
    noStroke();
    rect(0, 0, 620, 780-h*7.5); //use a rectangle to 'clear up' the thick threads in the upper part of the window
  }
}



