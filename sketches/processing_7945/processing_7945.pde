

float alphag = 255;
int f=0;



void setup(){  
  size(1265,400);
  smooth();
  background(7,10,47);
 frameRate(30);
}

void draw() {
  
  //variables had to be inside the draw to create the pseudo animation

float rectx = random(0,screen.width-100);
float recty = random(0,screen.height-100);
float greys = random(10,60);
float reds = random(greys/2);


  //rectangles
  if (frameCount == 10+f) {
  fill(255,alphag);
  stroke(0);
  rectMode(CENTER);
    rect(rectx,recty,greys,greys);
  fill(232,38,38,alphag);
  stroke(0);
  rectMode(CENTER);
    rect(rectx,recty,reds,reds);
    
     f = f+5;
  }
  else {
    rectMode(CENTER);
    fill(7,10,47,50);
  rect(width/2,height/2,width,height);
  }
  
  /*
     if (frameCount > 30){
     frameCount = 0 ;
     }
  else {
  frameCount = frameCount ;
  }
  */

  
  //trace framecount
  println(frameCount);
  
}


