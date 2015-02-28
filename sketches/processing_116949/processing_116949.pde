
//d=purple
//p=pink
//y=yellow
//b=blue
//o=orange

/* @pjs font="Eater-Regular.ttf"; */
/* @pjs font="AmaticSC-Regular.ttf"; */

int myState = 0 ;
PImage yellow ;
PImage blue ;
PImage orange ;
PImage pink ;
PImage purple ;
PFont myFont ;
//PFont myfont ;


void setup () {
  size(1200, 800);
  
  yellow = loadImage("yellow.jpg");
  blue = loadImage("blue.jpg");
  orange = loadImage("orange.jpg");
  pink = loadImage("pink.jpg");
  purple = loadImage("purple.jpg");
  
  myFont = createFont("Eater-Regular.ttf", 400);
  //myfont = createFont("AmaticSC-Regular.ttf", 400);
  
}


void keyPressed() {
  println(keyCode) ;
}



void draw () {
  background(#FFFFFF);
  
  textFont(myFont, 100);
  
  fill(#000000);
  text("Color Your FLower",80,200);
  
  //textFont(myfont, 50);
    fill(#000000);
    textSize(30);
  text("Press different keys for different colors", 200, 300);
  text("Y for Yellow", 480, 420);
  text("O for Orange",480, 460);
  text("B for Blue",480,500);
  text("P for Pink",480,540);
  text("D for Purple",480,580);
  
  switch(keyCode) {
    case 89:
    image(yellow, 0, 0);
    println("yellow") ; 
    break; 
    
    case 66: 
    println("blue") ;
image(blue, 0, 0);
    break ;
    
    case 79:
    println("orange") ;
image(orange, 0, 0); 
    break; 
    
    case 80:
    println("pink") ; 
image(pink, 0, 0);
    break ;
    
        case 68:
    println("purple") ; 
image(purple, 0, 0);
    break ;
  }
  
}




