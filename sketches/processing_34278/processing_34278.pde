

// Etching Sound, my Final Code prject
// Juan Pablo Patiño

int resinDensity = 250; //density of AquaTint pattern

Boolean info_switch = true;

PImage artistP; //previous state

PImage toolbar; // Tool bar and instructions

float [] resX = new float[resinDensity];
float [] resY = new float[resinDensity];




void setup() {
  size(600, 400);
  background(255);
  smooth();
  
  toolbar = loadImage("startPage.png");
  
  image(toolbar,0,0);
  
  for(int r = 0; r < resinDensity; r++) {
    resX[r] = random(-75,75); //size of the brush
    resY[r] = random(-75,75); //size of the brush
  }
  
  frameRate(40);

}

void draw() {
    
    if (keyPressed) {
      if(key == 'b')
        burnisher();
    }
    
    if (keyPressed) {
      if(key == 'a')
        aquaT();
    }
    
     if (mousePressed) {
      if(key == 's')
        scribe();
    }
}


void burnisher() {
  if(mousePressed) {
    fill(255,30);
    noStroke();
    ellipse(mouseX, mouseY, 25, 25);
    smooth();
  }
}

void aquaT() {
  if(mousePressed) {
    for(int r = 0; r < resinDensity; r++) {
     fill(0, 60);
     noStroke();
     smooth();
     ellipseMode(CENTER);
     ellipse(mouseX+resX[r], mouseY+resY[r], 1, 1);
    }
  }
} 

void scribe() {
  if(mousePressed) {
    float thickness = dist(pmouseX, pmouseY, mouseX, mouseY);
    
    if( thickness>5){
      thickness=5;
    }
    strokeWeight(6-thickness);
    stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

// This piece of code was from redline.pde, by Kai Tamulonis
// http://www.openprocessing.org/portal/?userID=10780
// I removed to of th key functions and changed the BLUR from 'l' to 'r'.

void keyPressed(){
  if(key == 'i'){
    filter(INVERT); //everything black turns white, and vice versa. Like Invert in Photoshop
  }
  if(key == 'w'){
    filter(BLUR, 1); //blurs all content by 1px. I'm using it to help create texture and depth.
  }
  
  //Saves a JPEG of the sketch onto the Sketch folder. Should be done when you are done with the sketch.
  // Found the saveFrame() from Processing.org
  if(key == 'i'){ 
    saveFrame("etching-####.jpg"); 
}

//START, or back to me again, the RESET
  if(key == ' '){ 
    noStroke();
    rect(0,0,width,height); //back to a blank canvas
  }
  
  
// This is the business right here! Dan Selden showed me how to get the toolbar to show up without losing the work. Thanks!

  if(key == 't') {
    if(info_switch == true) {
      save("artistP.jpg");
      image(toolbar,0,0);
      info_switch = false;
      println(info_switch);
    }
     else if(info_switch == false) {
       artistP = loadImage("artistP.jpg");
       image(artistP,0,0);
       info_switch = true;
       println(info_switch);
     }
  }
  }

    
  

