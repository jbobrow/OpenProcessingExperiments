
/* @pjs font="sail.ttf"; */
int myState = 0 ;
int x = 0 ;
int y = 0 ;
PFont sail ;
PImage Stars ;
PImage moon ;
PImage wink ;
float y;

void setup() {
  size(500, 500) ;



sail = createFont("sail.ttf", 60);
textFont(sail);
textAlign(CENTER, CENTER);
Stars = loadImage("Stars.jpeg");
moon = loadImage("moon2.png");
wink = loadImage("wink.png");
y = width;


}


void draw() {
  
 switch(myState) {
   
  
   case 0:
   image(Stars, 0, 0, width, height);
   text("Lady in", x, 450, 1000) ;
   x = x + 2;
   if (x > 100) {
    x = 100;

}
    break;
    
    case 1:
    image(Stars, 0, 0, width, height);
     text("Lady in", x, 450, 1000) ;
    fill(255) ;
    textFont(sail, 60) ;
    text("The Moon", y, 510 ,500) ;
y = y-3;
  if (y < 200) {
    y = 200;
}
break;

case 2:
   image(Stars, 0, 0, width, height);
    text("Lady in", x, 450, 1000) ;
     text("The Moon", y, 510 ,500) ;
  image(moon, 217, 1, 300, 300);
  
  break;
  
  case 3:
  image(Stars, 0, 0, width, height);
  textSize(80);
  text("By: Zeta June", 250, 310) ;
   
   break;
  
   
   case 4:
   background(0);
   textSize(45);
   fill(255);
   text("Listen & Enjoy!", 250, 360) ;
     image(wink, CENTER, CENTER);
     
     break;
   


 }
 }
  
  void mousePressed() {
  myState = myState + 1 ;
  if (myState > 4)
    myState = 4 ;
  }

    
   






