
/*
 * Creative Coding
 * Week 6, Generative Postcard - Greetings From Co. Clare
 * Based on w6_01
 * by Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch demonstrates a recursive function to draw circles within circles.
 *
 * This shows  6 scenes from Co. Clare, Ireland revolvingaround a central image.
 * By clicking the mouse a larger version of each image is displayed in the centre,
 * each click of the mouse causes the next image to be displayed.
 *
 */





float ratio = 3;  // size ratio of circles
int division = 6; // number of circles inside each circle
PImage bg2Img;
PImage bgImg;
PImage [] pcImg;
PImage [] pctxtImg;
PImage useImg;
PImage centerImg;
int circleInt;
int centerInt;
float centerRad;
boolean doLoop;


void setup() {
  doLoop = true;
  size(750, 750);
  noStroke();
  frameRate = .01;
  circleInt = 1;
  pcImg = new PImage [8];
  pctxtImg = new PImage [7];
  //useImg = new PImage;
  bgImg = loadImage("seasquare.png");
  bg2Img = loadImage("seacirclet.png");
  
  pcImg[0] = loadImage("claret2.png");
  pcImg[1] = loadImage("cliffs.png");
  pcImg[2] = loadImage("festival.png");
  pcImg[3] = loadImage("fuchsias.png");
  pcImg[4] = loadImage("lahinch.png");
  pcImg[5] = loadImage("o_brienss.png");
  pcImg[6] = loadImage("burren.png");
  pcImg[7] = loadImage("seacirclet.png");
  
  pctxtImg[0] = loadImage("blanktxt.png");
  pctxtImg[1] = loadImage("cliffstxt.png");
  pctxtImg[2] = loadImage("lisdoontxt.png");
  pctxtImg[3] = loadImage("fuchsiatxt.png");
  pctxtImg[4] = loadImage("lahinchtxt.png");
  pctxtImg[5] = loadImage("obrientxt.png");
  pctxtImg[6] = loadImage("burrentxt.png");
  
  
  centerInt = 0;
  centerImg = pcImg[centerInt];
  centerRad = height/2*0.67;
  background(bgImg);
  imageMode(CENTER);
  image(bg2Img, width/2 , height/2 , 782, 782);
  
}

void draw() {
  translate(width/2, height/2); // move to the middle of the screen
  

 
 
  drawCircle(height/2, 2); // draw the recursive circle

  noStroke();

  image( centerImg, 0, 0, centerRad, centerRad);
  if (centerInt > 0) {
  fill(#CEFFF2);
  rectMode(CENTER);
  rect(0, -335, 450, 52);
  }
  image( pctxtImg[centerInt], 0, -335, 450, 52);
  rectMode(CORNER);
  fill(#52F777);
  rect(280, -361, 25, 52);
  fill(255);
  rect(305, -361, 25, 52);
  fill(#FFE114);
  rect(330, -361, 26, 52);
  noFill();
}


/*
 * drawCircle
 * recursive function that draws a circle
 * then draws 'division' circles inside that circle
 *
 */
void drawCircle(float radius, int level) {                    

  // draw the circle
  if (level <= 1) {
  imageMode(CENTER);
  image(pcImg[circleInt], 0, 0, radius*0.66, radius*0.66);

  stroke(255);
  noFill();
  ellipse(0, 0, radius*0.66, radius*0.66); 
  }
  else{
        
    level = level - 1;
    useImg = pcImg[6];
 
    for (int i = 1; i < division + 1; ++i) {  
      pushMatrix();
      useImg = pcImg[i];
      circleInt = i;
      float mult = (level % 2 == 1) ? 1 : -1;
      rotate(mult * frameCount / (20.0 * level) + TWO_PI/division * i);
      translate(radius - radius/ratio, 0);
      drawCircle(radius, level);
      popMatrix();
    }
  }
}
 void mouseClicked(){
  background(bgImg);
  imageMode(CENTER);
  image(bg2Img, width/2 , height/2 , 782, 782);
  

   if (centerInt == 6){
     centerInt = 0;
     
     centerRad = height/2*0.67;
      

   }
   else {
     centerInt ++;
     centerRad = height*.75;
   }
   centerImg = pcImg[centerInt];
 }
 
 void keyReleased() {

  if (key == 's') {
 
  String filename = "W6_postcard" + (centerInt) + ".jpg";
 // saveFrame("W6postcard" + centerInt + ".jpg");
  saveFrame(filename);
  println(" saved "  + filename); 
  }
  
}

   


