

int maxBodys = 115;// how many ellipse are on screen at once

int currW =0;// used for counting purposes

PVector[] pos = new PVector[maxBodys];//an array of positions

void setup() {
  size(600,600);//you should know what this is
  noStroke();//no stroke works in the setup

  for(int i=0; i< maxBodys; i++) {//this is where we creat the positions
    pos[i] = new PVector(300,300);
  }
  //the optional smooth function
 // smooth();
}

void draw() {
  background(0);// black and boring, but it works for me
  
  //and these are the worms
  worm(mouseX, mouseY,20);
  
  worm(sin(radians(frameCount)) * 250 +300,cos(radians(frameCount)) * 150 +300,20);
  
  worm(sin(radians(frameCount+180)) * 250 +300,cos(radians(frameCount+180)) * 150 +300,20);
  
 //    math is used to make them go up and down
  worm(sin(radians(frameCount*10)) * 50 +300,sin(radians(frameCount -90)) * 300 +300,30);
  
  worm(sin(radians(frameCount +185)) * 350 +300,sin(radians(frameCount*10)) * 50 +300,25);
  
  currW =0;// DO NOT REMOVE is  very important
}


void worm(float x, float y, int Wlength) { //the worm fuction
  
  // this keeps the program from crashing if you do something stupid
  if(currW +Wlength > maxBodys) Wlength = maxBodys - currW;

  for(int del=Wlength-1; del>-1; del--) {//now for some more math

    if(del >0) {
      pos[del +currW].x += (pos[del-1 +currW].x-pos[del +currW].x)/(del/Wlength +1);
      pos[del +currW].y += (pos[del-1 +currW].y-pos[del +currW].y)/(del/Wlength +1);
      fill(255,255 - del*10, sin(radians(frameCount)) * 250 - random(255));
      ellipse(pos[del +currW].x,pos[del +currW].y, 50 -del, 50 -del);
    } 
    else {
      pos[del +currW].x += (x-pos[del +currW].x)/(10);
      pos[del +currW].y += (y-pos[del +currW].y)/(10);
    }
  }
  currW += Wlength;// keeps other worms from stealing the same postions
}

// I could have coded this better with a class. But I was too lazy.


