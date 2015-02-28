
//Melissa Clark
//Programming for Interactive Digital Arts, Winter 2014 
//Final Project 3/12/2014

//INSTRUCTIONS:  

//Click on the "Information" icon located in the center of the main menu to get instructions on the program  
//as well as some background information 

//Once back on the main menu, click any of the four images to take you to a corresponding and unique animation.

//To try your hand at coloring, click on the little boy's head on the bottom right of the main menu screen.

//To end the program and to see another visualization, click on the bush plane located in the bottom left
//of the main menu screen.  

//Enjoy!!







//CODE BEGIN

int level = 0; //To determine which level is menu 
import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioPlayer song;
FFT fft;
int nFreqBand = 50;


//Images of the menu
PImage egg;
PImage river;
PImage hut;
PImage man;
PImage head; //to paint 

PImage drawon; //background image

//FORAGING
PImage[] foraging = new PImage[14]; //image array for Foraging sequence, has 12 images
int currentFrame = 0; //displayed frames 
int timer = 5; //number of frames before next

//FISHING 
PImage[] fishing = new PImage[19]; //image array for Foraging sequence, has 12 images
int currentFrame1 = 0; //displayed frames 
int timer1 = 5; //number of frames before next

//LEARNING
PImage[] learning = new PImage[11]; //image array for Foraging sequence, has 12 images
int currentFrame2 = 0; //displayed frames 
int timer2 = 5; //number of frames before next

//SHAMAN
PImage[] shaman = new PImage[17]; //image array for Foraging sequence, has 12 images
int currentFrame3 = 0; //displayed frames 
int timer3 = 5; //number of frames before next

//COLORING
PImage fillin;
int a, b, c, d, e;

//Final
PImage clrmuse;

//IMAGE TO GO TO FINAL 
PImage plane;

//IMAGE TO BACK ARROW
PImage arrow;

//INFORAMTION BUTTON
PImage info;

//Instructions image 
PImage know;


void setup() {
  noStroke();
  size(500, 500);
  smooth(); // improves quality when resizing images
  background(0);
  frameRate(60); 
  //color mode
  colorMode(HSB);

  //Music menu
  //minim = new Minim(this);
  //song = minim.loadFile("Rain.mp3");
  //song.play();

  //music finale
  minim = new Minim(this);
  song = minim.loadFile("Rain.mp3", 512);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  //The 30th band has a center frequency of 2497.8516 Hz
  println(fft.indexToFreq(nFreqBand-1));

  //BEGIN LOADING IMAGES -----------------------------------------------------------------------------------

  //load MENU images 
  egg = loadImage("amazon-.jpg");
  river = loadImage("amazon-1.jpg");
  hut = loadImage("amazon-2.jpg");
  man = loadImage("amazon-3.jpg");
  head = loadImage("boyhead.png");
  
  //load PLANE to lead to final image 
  plane = loadImage("plane.png");

  //load MENU Background image 
  drawon = loadImage("map.png"); 
  //change menu background color
  background(drawon);


  //load VISUALIZATION images 
  for ( int i = 0; i < foraging.length; i ++) {
    foraging[i] = loadImage("Foraging-"+(i+1)+".jpg"); //import image
  }

  for ( int i = 0; i < fishing.length; i ++) {
    fishing[i] = loadImage("Fishing-"+(i+1)+".png"); //import image
  }

  for ( int i = 0; i < learning.length; i ++) {
    learning[i] = loadImage("Learning-"+(i+1)+".jpg"); //import image
  }

  for ( int i = 0; i < shaman.length; i ++) {
    shaman[i] = loadImage("Shaman-"+(i+1)+".jpg"); //import image
  }

  //load COLORING image
  fillin = loadImage("clrmanface.gif");

  //load FINAL image 
  clrmuse = loadImage("ShamanColor.png");
  
  //load back arrow
  arrow = loadImage("arrow.png");
  
  //load information
  info = loadImage("Information.png");
  
  //load instructions image 
  know = loadImage("Know.jpg");
  

  //END LOADING IMAGES  -----------------------------------------------------------------------------

}

void draw() {
  switch (level) {
  case 0: // menu
    drawMenu();
    break;

  case 1:
    drawForaging();
    break;

  case 2:
    drawFishing();
    break;

  case 3:
    drawLearning();
    break;

  case 4:
    drawShaman();
    break;

  case 5:
    drawColoring();
    break;

  case 6:
    drawFinal();
    break;
    
   case 7:
    drawInformation();
    break;

  default:
    break;
  }
}


void mousePressed()
{
  //I THINK I NEED A STATEMNT SAYING IF ON LEVEL ONE AND MOUSE PRESSED!! NOT SURE

  if (level==0) {

    if (mouseX>100 && mouseX<200 && mouseY>100 && mouseY<200) { //If mouse clicked in first picture
      level = 1; //bring to first animation "Foraging"
    } 
    else if (mouseX>300 && mouseX<400 && mouseY>100 && mouseY<200) { //If mouse clicked in second picture
      level = 2; //bring into second animation "Fishing
    } 
    else if (mouseX>100 && mouseX<200 && mouseY>300 && mouseY<400) { //If mouse clicked in third picture
      level = 3; //bring into third animation "Learning
    } 
    else if (mouseX>300 && mouseX<400 && mouseY>300 && mouseY<400) { //If mouse clicked in forth picture
      level = 4; //bring into forth and final animation "Shaman"
    } 
    else if (mouseX>350 && mouseX<500 && mouseY>375 && mouseY<500) { //If mouse clicked on the boy's head
      background(fillin);
      level = 5; //bring to coloring visualization
    }
    else if (mouseX>0 && mouseX<140 && mouseY>445 && mouseY<500) { //If mouse clicked in the plane 
      level = 6; //bring to Final visualization 
    }
    
     else if (mouseX>50 && mouseX<450 && mouseY>185 && mouseY<335) { //If mouse clicked on "Information" text
      level = 7; //bring to information/instructions 
    }
    
    
  } 
    if (level==5){
      
    if (mouseX>430 && mouseX<500 && mouseY>460 && mouseY<500) {
      level = 0; //bring back to home page from coloring book
      background(drawon); //BUG HERE
   }
 }
 
 if (level==1){
      
    if (mouseX>5 && mouseX<75 && mouseY>5 && mouseY<45) {
      level = 0; //bring back to home page from FORAGING 
      background(drawon); 
   }
 }
 
  if (level==2){
      
    if (mouseX>430 && mouseX<500 && mouseY>5 && mouseY<45) {
      level = 0; //bring back to home page from FISHING
      background(drawon); 
   }
 }
 
   if (level==3){
      
    if (mouseX>430 && mouseX<500 && mouseY>5 && mouseY<45) {
      level = 0; //bring back to home page from LEARNING
      background(drawon); 
   }
 }
 
   if (level==4){
      
    if (mouseX>430 && mouseX<500 && mouseY>5 && mouseY<45) {
      level = 0; //bring back to home page from SHAMAN
      background(drawon); 
   }
 }
 
   if (level==6){
      
    if (mouseX>430 && mouseX<500 && mouseY>5 && mouseY<45) {
      level = 0; //bring back to home page from Information page
      background(drawon); 
   }
 }
    if (level==7){
      
    if (mouseX>430 && mouseX<500 && mouseY>5 && mouseY<45) {
      level = 0; //bring back to home page from Information page
      background(drawon); 
   }
 }
}




void drawColoring() {
  //background(fillin);
  imageMode(CORNER);
  strokeWeight(0);
  a = width-50;
  b = height-height/10;
  c = height/10;
  d = width-width/10;
  fill(#0000FF);
  rect(width-50, 0, 50, 40);
  fill(#FF0000);
  rect(width-50, c, 50, 40);
  fill(#00FF00);
  rect(width-50, 2*c, 50, 40);
  fill(#FF00FF);
  rect(width-50, 3*c, 50, 40);
  fill(#FFFF00);
  rect(width-50, 4*c, 50, 40);
  fill(#00FFFF);
  rect(width-50, 5*c, 50, 40);
  fill(0);
  rect(width-50, 6*c, 50, 40);
  fill(255);
  rect(width-50, 7*c, 50, 40);
  fill(255);
  image(fillin, a, b);
  fill(0);
  if (mousePressed == true) {
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
    if (mouseX>a && mouseX<width && mouseY>0 && mouseY<c) {
      stroke(#0000FF);
    }
    if (mouseX>a && mouseX<width && mouseY>c && mouseY<c*2) {
      stroke(#FF0000);
    }
    if (mouseX>a && mouseX<width && mouseY>c*2 && mouseY<c*3) {
      stroke(#00FF00);
    }
    if (mouseX>a && mouseX<width && mouseY>c*3 && mouseY<c*4) {
      stroke(#FF00FF);
    }
    if (mouseX>a && mouseX<width && mouseY>c*4 && mouseY<c*5) {
      stroke(#FFFF00);
    }
    if (mouseX>a && mouseX<width && mouseY>c*5 && mouseY<c*6) {
      stroke(#00FFFF);
    }
    if (mouseX>a && mouseX<width && mouseY>c*6 && mouseY<c*7) {
      stroke(0, 0, 0);
    }
    if (mouseX>a && mouseX<width && mouseY>c*7 && mouseY<c*8) {
      stroke(255, 255, 255);
    }
    
    
  }
  
   //back arrow lower right 
  imageMode(CENTER);
  image(arrow, 465, 480, 70, 40);
}

void drawFinal() {
  imageMode(CORNER);
  background(clrmuse);
  fill(0, 30);
  rect(0, 0, width, height);
  fft.forward(song.mix);
  for(int i = 0; i < nFreqBand; i++)
  {
    fill(i*255/nFreqBand, 255, 255);
    rect(i*width/nFreqBand*2.5, height, width/nFreqBand*5, height - fft.getBand(i)*30);
  }
  
  //back arrow upper right 
  imageMode(CENTER);
  image(arrow, 465, 25, 70, 40);
  
}
void drawFishing() {
  imageMode(CORNER);
  image(fishing[currentFrame1], 0, 0);
  // scrubbing ala iMovie
  if (mousePressed) {
    currentFrame1 = constrain((fishing.length*mouseX)/width, 0, fishing.length-1);
    timer1 = 5;
  } 
  else {
    // advance if the timer is done, or decrese the timer
    if (timer1 == 0) {
      currentFrame1 = (currentFrame1+1)%fishing.length;
      timer1 = 5;
    }
    else timer1--;
  }
  
    //back arrow upper right 
  imageMode(CENTER);
  image(arrow, 465, 25, 70, 40);
}
void drawForaging() {
  imageMode(CORNER);
  image(foraging[currentFrame], 0, 0);
  // scrubbing ala iMovie
  if (mousePressed) {
    currentFrame = constrain((foraging.length*mouseX)/width, 0, foraging.length-1);
    timer = 5;
  } 
  else {
    // advance if the timer is done, or decrese the timer
    if (timer == 0) {
      currentFrame = (currentFrame+1)%foraging.length;
      timer = 5;
    }
    else timer--;
  }
  
  //back arrow upper right 
  imageMode(CENTER);
  image(arrow, 40, 25, 70, 40);
}

void drawInformation() {
  imageMode(CORNER);
  background(know);
  
    //back arrow upper right 
  imageMode(CENTER);
  image(arrow, 465, 25, 70, 40);
}
void drawLearning() {
  imageMode(CORNER);
  image(learning[currentFrame2],0,0);
  // scrubbing ala iMovie
  if(mousePressed) {
    currentFrame2 = constrain((learning.length*mouseX)/width,0,learning.length-1);
    timer2 = 10; 
  } else {
    // advance if the timer is done, or decrese the timer
    if(timer2 == 0)  {
      currentFrame2 = (currentFrame2+1)%learning.length;
      timer2 = 5;
    }
    else timer2--;
  }
  //back arrow upper right 
  imageMode(CENTER);
  image(arrow, 465, 25, 70, 40);
}
void drawMenu() {
  //OPENING MENU
  
  //paint egg
  fill(255);
  rect(94, 94, 110, 110);
  imageMode(CENTER);
  image(egg, 150, 150, 100, 100);


  //paint river
  fill(255);
  rect(294, 94, 110, 110);
  imageMode(CENTER);
  image(river, 350, 150, 100, 100);



  //paint hut
  fill(255);
  rect(94, 294, 110, 110);
  imageMode(CENTER);
  image(hut, 150, 350, 100, 100);
  fill(255);


  //paint man 
  fill(255);
  rect(294, 294, 110, 110);
  imageMode(CENTER);
  image(man, 350, 350, 100, 100);
  fill(255);

  //paint boyhead bottom right of screen  
  imageMode(CENTER);
  image(head, 425, 450, 150, 100);
  fill(255);
  
  
  //paint plane bottom left 
  imageMode(CENTER);
  image(plane, 70, 470, 140, 50);
  
  //paint info button center
  imageMode(CENTER);
  image(info, 250, 260, 400, 150);





  //color spit out by mouse into circles
  fill(mouseX/3, 255, 255, 80);
  //size of dots
  ellipse(mouseX, mouseY, 50, 50);
  ellipse(mouseY, mouseX, 35, 35);
  ellipse(height-mouseY, width-mouseX, 30, 30);
  ellipse(width-mouseX, height-mouseY, 25, 25);
  ellipse(height-mouseY, mouseX, 15, 15);
  ellipse(mouseX, height-mouseY, 10, 10);
  ellipse(mouseY, width-mouseX, 20, 20);
  ellipse(width-mouseX, mouseY, 45, 45);
}

void drawShaman() {
  imageMode(CORNER);
  image(shaman[currentFrame3], 0, 0);
  // scrubbing ala iMovie
  if (mousePressed) {
    currentFrame3 = constrain((shaman.length*mouseX)/width, 0, shaman.length-1);
    timer3 = 5;
  } 
  else {
    // advance if the timer is done, or decrese the timer
    if (timer3 == 0) {
      currentFrame3 = (currentFrame3+1)%shaman.length;
      timer3 = 5;
    }
    else timer3--;
  }
  //back arrow upper right 
  imageMode(CENTER);
  image(arrow, 465, 25, 70, 40);
}


