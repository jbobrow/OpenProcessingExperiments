
/* @pjs font="text.ttf","text2.ttf"; */

int myState = 0 ;
int x = 0 ;
int y = 0;
int z = 0;
int myCtr ;
PImage present;
PImage monster;
PFont myFont;
PFont scary ;
float x2;


void setup() {
  size(500,500);
  frameRate(24);
  
 
  present = loadImage("present.png");
  monster = loadImage("monster.png");
  myFont = createFont("text.ttf", 32);
  scary = createFont("text2.ttf", 30);
  textFont(myFont, 32);
  textAlign(CENTER, CENTER);
  z = width;
  
  myCtr = 2*24 ;
  
  
}



void draw() {
  
  switch(myState) {
    
    case 0:
    println("DONT CLICK IT!");
    background(#FFFFFF);
    image(present, 0, 0, 350, 550);
    fill(#0F0F0F);
    text("Click to Open", 250, 50);
    fill(#0F0F0F);
    text("...If you dare", 400, 400);
      break;
      
      case 1:
      println("DONT DO IT!");
      background(#080707) ;
      fill(#FFFFFF);
      text("Are you sure?", y, height/2);
      y = y+8;
      if (y > 250) {
    y = 250;
}
      break;
      
      case 2:
      println("SERIOUSLY!");
      background(#080707);
      fill(#FFFFFF);
      text("Okay", width/2, height/2);
      break ;
      
      case 3:
      println("NOOOOOOOO!");
      background(#080707);
      fill(#FFFFFF);
      text("You asked for it", z, height/2);
      z = z -10;
      if (z < 250) {
      z = 250;
     }
     break;
  
     case 4:
     println("NOOOOOOOOOOO!");
     background(#FFFFFF);
     image(monster, x, random(6), 500, 500);
     x = x + 1;
     if (x > 10) {
       x = 1;
     }
    
     textFont(scary, 30);
     fill(#D80000);
     text("DO THE HARLEM SHAKE!", 250, 50);
     break ;
  }


}
void mousePressed() {
  myState = myState + 1 ;
  if (myState > 4) 
    myState = 4 ;
     
   if (myCtr < 0)
      myState = 1 ; 
      
  }
