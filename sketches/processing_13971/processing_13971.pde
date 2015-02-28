
PImage bg1;
PImage bg2;
PImage bg3;
PImage tri;
PImage circ;
PImage mist1;
PImage mist2;
PImage mist3;
PImage fg1;
PImage fg2;
PImage fg3;
PImage tree;
PImage drop;
PImage rain;
PImage cact;
PFont font; 

float r;
float x,y;
float s;




void setup() {
  size(1280,720);
  smooth();
  background(255);
  font = loadFont("AncientGeek-48.vlw");
  textFont(font, 14);
  noLoop();
  //frameRate(.5);

  bg1 = loadImage("BG1.JPG");
  bg2 = loadImage("BG2.JPG");
  bg3 = loadImage("BG1.JPG");
  mist1 = loadImage("MIST1.PNG");
  mist2 = loadImage("MIST2.PNG");
  fg1 = loadImage("FG1.PNG");
  fg2 = loadImage("FG2.PNG");
  tri = loadImage("TRIANGLE.PNG");
  circ = loadImage("CIRCLE.PNG");
  drop = loadImage("DROP.PNG");
  rain = loadImage("RAIN.JPG");
  tree = loadImage("TREE.PNG");
  cact = loadImage("CACTUS.PNG");
}

void draw() {
  background(255);

  //RANDOM NUMBER GENERATOR
  r = int(random(0, 2));

  //BG RANDOM
  println(r);
  { 
    r = int(random(0, 2));
    if (r == 0) {
      image(bg1, 0, 0);
    }
    else if (r == 1) {
      image(bg2, 0, 0);
    }
  }  

  //MIST RANDOM
  { 
    r = int(random(0, 2));
    if (r == 0) {
      image(mist1, 0, 0);
    }
    else if (r == 1) {
      image(mist2, 0, 0);
    }
  }  

  //TRIANGLE
  image(tri, 0,0);
  
  //CIRLCE
  blend(circ, 0, 0, width, height, 0, 0, width, height, SOFT_LIGHT);



  
  //TREES
  { 
    r = int(random(0, 3));
  if (r == 0){ 
    float treer = int(random(1, 7));
    for (int count = 0; count < treer; count += 1) {

      float r = random(.6, 1);
            
      float rx = random(0, 1280);
      if (r <= .8){
        float ry = random (300, 500);
      }else{
      float ry = random(126, 500);
      
      
      pushMatrix();
      translate(rx,ry);
      pushMatrix();
      scale(r);
      image(tree, 0, 0);
      popMatrix();
      popMatrix();
      }

    }
  } 
  
  else if (r == 1){ 
    float cactr = int(random(1, 4));
    for (int count = 0; count < cactr; count += 1) {

      float r = random(.9, 1.5);
            
      float rx = random(0, 1280);
      if (r <= .8){
        float ry = random (120, 300);
      }else{
      float ry = random(90, 300);
      
      
      pushMatrix();
      translate(rx,ry);
      pushMatrix();
      scale(r);
      image(cact, 0, 0);
      popMatrix();
      popMatrix();
      }

    }
  } 

}


  //FG RANDOM
  { 
    r = int(random(0, 2));
    if (r == 0) {
      image(fg1, 0, 0);
    }
    else if (r == 1) {
      image(fg2, 0, 0);
    }
  }  
  


//RAIN
  { 
    r = int(random(0, 2));
    if (r == 0) {
      blend(rain, 0, 0, width, height, 0, 0, width, height, SCREEN);
    }

  }  


    //DROPS
  { 
    for (int count = 0; count < 12; count += 1) {
      float rx = random(0, 1280);
      float ry = random(0, 720);
      float r = random(.1, .75);
      pushMatrix();
      translate(rx,ry);
      pushMatrix();
      scale(r);
      image(drop, rx, ry);
      popMatrix();
      popMatrix();
      

    }
  } 


//TEXT
{

  
int r = int(random(0,5));

  fill(255);
  textAlign(CENTER);
if (r == 0) {

  text ("A garden must combine the poetic and he mysterious with a feeling of serenity and joy.", width/2, height/2);
} else if (r == 1) {
  text ("Extremes in nature equal ends produce; In man they join to some mysterious use.", width/2, height/2);
} else if (r == 2) {
  text ("The streets were dark with something more than night.", width/2, height/2);
} else if (r == 3) {
  text ("Lost in the confines of my own mind, blinded by chains. It's the fading line, fragments of faith.", width/2, height/2);
} else if (r == 4) {
  text ("No one sees me, for I live in the shadows.", width/2, height/2);
}

}

}



void mousePressed() {
  redraw();
}


