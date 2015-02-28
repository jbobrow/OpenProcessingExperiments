
int x;
int y;
int a;

int xSpeed;
int ySpeed;
int aSpeed;

PFont codeLight60;
PImage mario;
PImage cloud;
PImage tunnel1;
PImage tunnel2;
PImage mush1;
PImage mon;

void setup() {
  size(800, 300);
  background(50,200,50);
  codeLight60 = loadFont("aa.vlw");
  mario = loadImage("mario.png");
  cloud = loadImage("cloud.png");
  tunnel1= loadImage("tunnel1.png");
  tunnel2= loadImage("tunnel2.png");
  mush1= loadImage("mush.png");
  mon= loadImage("mon.png");
  xSpeed=0;
  ySpeed=0;
  aSpeed=1;
  y=1;
  x=1;

}

void draw() {

  noStroke();
  background(224, 255, 255);
  x=x+xSpeed;
  y=y+ySpeed; 
  a=a+aSpeed;



  fill(23, 255, 25);
  rect(0, height-20, width, height);

//  //bottom
//
//  if (y>=0) { 
//    ySpeed=ySpeed*-1;
//  }
//
//  //top
//
//  if (y<=200) {
//    ySpeed=ySpeed*-1;
//  }  

  //MUSH

  if (100<x && x<200 && y>200 ) {
    y=1;
    x=500;

    background(255, 255, 57);
  }
  if (x>=(3*width/4)-10  && x<=(3*width/4)+10) {
    ySpeed=-1*ySpeed;
    background(0, 0, 255);  
    textFont(codeLight60);
    text("MAGIC MUSHROOM", width/3, height/2);
  }

  if (x>=width+100) {
    y=1;
    x=-50;


  }

  if (a>=width+100) {

    a=0;
    
    
  if(x>=width-a-10 && x<=width-a+60 
  && y>=180 && y<=290){
    background(0, 0, 255);  
    textFont(codeLight60);
    text("BAD MUSHROOM", width/3, height/2); 
  }
  }

  image(mon, width-a, 240, 50, 50);
  image(mario, x, y, 90, 110);
  image(cloud, 100, 50, 100, 50);
  image(cloud, 400, 50, 100, 75);
  image(cloud, 410, 40, 50, 30);
  image(tunnel1, 145, 240, 110, 100);
  image(tunnel2, 500, -5, 100, 100);
  image(mush1, 3*width/4, 230, 75, 75);
   if (y>=height-120) {
        y=height-120;
      }
      
      if (y<=0) {
        y=0;
      }
          if (x<=0) {
        x=0;
      }


}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
   
  
        y = y-50;
      
    } 
    else if (keyCode == DOWN) {
     
  
        y=y+ 50;
    } 
    else if (keyCode==RIGHT) {
  

        x =x+50;
    
    }
  }
}





