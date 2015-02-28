
/* @pjs preload="lilbsleep.png", "heaven.jpeg" ; font = "Neou-Thin.ttf"; */

PImage lilbsleep ;
PImage heaven ;
PFont Neou ;
int x = 0 ;
int x1 = 0 ;
int x3 = 0 ;
int x2 = 0 ;
int x4 = 0 ;
int x5 = 0 ;
int x6 = 0 ;
int x7 = 0 ;
void setup() {
  
  size(600,600) ;
  
  lilb = loadImage("lilbsleep.png") ;
  heaven = loadImage("heaven.jpeg") ;
  Neou = createFont("Neou-Thin.ttf") ;
  
}

void draw() {

//background image
  image(heaven, -600, -200) ;
 
//seizure inducing colors
noStroke() ;
  fill(random(#000000), 80) ;
  ellipse(300, 300, random(900), random(900)) ;
  
  noStroke() ;
  fill(random(#000000), 80) ;
  rect(0, 300, random(900), random(900)) ;
  
   noStroke() ;
  fill(random(#000000), 80) ;
  rect(300, 300, random(900), random(900)) ;
  
  noStroke() ;
  fill(random(#000000), 80) ;
  rect(0, 0, random(900), random(900)) ;
  
  noStroke() ;
  fill(random(#000000), 80) ;
  rect(300, 0, random(900), random(900)) ;


//lil b resting
  image(lilb, 0, 400) ;
  
//thought bubbles  
  noStroke() ;
  fill(#FFFFFF) ;
  ellipse(355, 480, 15, 10) ;
  
  noStroke() ;
  fill(#FFFFFF) ;
  ellipse(350, 460, 20, 15) ;
  
  noStroke() ;
  fill(#FFFFFF) ;
  ellipse(345, 435, 25, 20) ;
  
  
  //DREAMCLOUD containing "swag"
  fill(#FFFFFF) ;
  ellipse(x1, 180, 350, 180) ;
  x1 = x1 - 1 ;
  if (x1 < -200) {
    x1 = width +350 ;
  }
  
  //swag text
  fill(random(#000000)) ;
  textFont(Neou, 90) ;
  textAlign(CENTER, CENTER) ;
  text("'SWAG!'", x + 5, 180) ;
  x = x - 1 ;
  if (x < -200) {
    x = width +350 ;
  }
//DREAMCLOUD containing "based"
 fill(#FFFFFF) ;
  ellipse(x3 + 50, 50, 250, 80) ;
  x3 = x3 - 1.5 ;
  if (x3 < -200) {
    x3 = width +350 ;
  }
//text "based"
fill(random(#000000)) ;
  textFont(Neou, 60) ;
  textAlign(CENTER, CENTER) ;
  text("'BASED!'", x2 + 55 , 50) ;
  x2 = x2 - 1.5 ;
  if (x2 < -200) {
    x2 = width +350 ;
  }
//Dreamcloud containing "WHOOP!"
 noStroke() ;
  fill(#FFFFFF) ;
  ellipse(x4, 310, 100, 50) ;
  x4 = x4 + 2 ;
  if (x4 > 700) {
    x4 = width - 700 ;
    
  }
  
//text "WHOOP!"
fill(random(#000000)) ;
  textFont(Neou, 20) ;
  textAlign(CENTER, CENTER) ;
  text("'WHOOP!'", x5, 310) ;
  x5 = x5 + 2;
  if (x5 >700) {
    x5 = width - 700 ;
  } 
  
  //Dreamcloud containing "#rare!"
 noStroke() ;
  fill(#FFFFFF) ;
  ellipse(x6, 375, 180, 80) ;
  x6 = x6 + .9 ;
  if (x6 > 700) {
    x6 = width - 650 ;
    
  }
  
//text "#rare!"
fill(random(#000000)) ;
  textFont(Neou, 45) ;
  textAlign(CENTER, CENTER) ;
  text("'#RARE!'", x7 + 2, 375) ;
  x7 = x7 + .9;
  if (x7 >700) {
    x7 = width - 650 ;
  } 
 
  
  }



