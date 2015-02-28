
/* @pjs  font = "MoonFlower.ttf" ; preload = "silowette.png, cape.png, bolt1.png, bolt2.png, bolt3.png, bolt1black.png, bolt2black.png, bolt3black.png"  ; */

//rain
int x = 0 ; //declaring and initializing a variable.
int y = 0 ;
int x1 = 35 ;
int y1 = 40 ;
int x2 = 73 ;
int y2 = 50 ;
int x3 = 151 ;
int y3 = 100 ;
int x4 = 500 ;
int y4 = 75 ;
int x5 = 398 ;
int y5 = 80 ;
int a = 20 ;
int b = 20 ;
int a1 = 65 ;
int b1 = 70 ;
int a2 = 103 ;
int b2 = 80 ;
int a3 = 191 ;
int b3 = 140 ;
int a4 = 560 ;
int b4 = 135 ;
int a5 = 478 ;
int b5 = 160 ;

//text
int x6 = 1500 ;
int x7 = 600 ;

//cape
float x8 = 255 ;

//bolt
float x9 = 1 ;
float x10 = 111 ;
float x11 = 1111 ;

//darkness
int opa = 0 ;
int opaDelta = 1 ;

PImage cape ;
PImage silo ;
PImage bolt1 ;
PImage bolt2 ;
PImage bolt3 ;
PImage bolt3black ;
PImage bolt2black ;
PImage bolt1black ;
PFont moon ;




void setup(){
  size(600, 400) ;
  background(0) ;
  silo = loadImage("silowette.png") ;
  cape = loadImage("cape.png") ;
  bolt1 = loadImage("bolt1.png") ;
  bolt2 = loadImage("bolt2.png") ;
  bolt3 = loadImage("bolt3.png") ;
  bolt1black = loadImage("bolt1black.png") ;
  bolt2black = loadImage("bolt2black.png") ;
  bolt3black = loadImage("bolt3black.png") ;
  moon = createFont("MoonFlower.ttf", 60) ;
  textFont(moon) ; 

}

void draw() {
  background(0) ;
//text
  
  fill(0) ;
  rect(0, 00, width, 120) ;
  image(silo, 0, 250, 450, 200) ;
  fill(200) ;

 
  text("We're just a million little gods causing rainstorms", x7, 70) ;
  text("Turning every good thing to rust.", x6, 120) ;
  x7 = x7 - 10 ; 
  if (x7 < -1500) {
  x7 = 600 ;
  }
    x6 = x6 - 10 ; 
  if (x6 < -800) {
  x6 = 1300 ;
  }


//RAIN
  fill(150) ;
  ellipse(x, y, 4, 4) ;
  x = x + 7 ; //put if statement to reset
  if (x > width) {
  x = 0 ;
  }
  y = y + 14 ;
  if (y > height) {
  y = 100 ;
}
  ellipse(x1, y1, 3, 3) ;
  x1 = x1 + 10 ; //put if statement to reset
  if (x1 > width) {
  x1 = 0 ;
  }
  y1 = y1 + 20 ;
  if (y1 > height) {
  y1 = -50 ;
}
  ellipse(x2, y2, 5, 5) ;
  x2 = x2 + 10 ; //put if statement to reset
  if (x2 > width) {
  x2 = 0 ;
  }
  y2 = y2 + 20 ;
  if (y2 > height) {
  y2 = -125 ;
}
  ellipse(x3, y3, 5, 5) ;
  x3 = x3 + 10 ; //put if statement to reset
  if (x3 > width) {
  x3 = 0 ;
  }
  y3 = y3 + 20 ;
  if (y3 > height) {
  y3 = -200 ;
}
  ellipse(x4, y4, 3, 3) ;
  x4 = x4 + 10 ; //put if statement to reset
  if (x4 > width) {
  x4 = 0 ;
  }
  y4 = y4 + 20 ;
  if (y4 > height) {
  y4 = 0 ;
}
  ellipse(x5, y5, 3, 3) ;
  x5 = x5 + 10 ; //put if statement to reset
  if (x5 > width) {
  x5 = 0 ;
  }
  y5 = y5 + 20 ;
  if (y5 > height) {
  y5 = 50 ;
}
image(silo, 0, 250, 450, 200) ; 
  //background(100) ; //puting a background color erases past rectangles

tint(255, x8) ;
x8 = random(255) ;
x9 = random(1200) ;
x10 = random(1200) ;
x11 = random(1200) ;

//bolts

  
  image(bolt1, x9, 0, 70, height) ;
  image(bolt2, x10, 0, 70, height) ;
  image(bolt3, x11, 0, 70, height) ;
  tint(0, 255) ;
  image(bolt1black, x9, 0, 72, height) ;
  image(bolt2black, x10, 0, 72, height) ;
  image(bolt3black, x11, 0, 72, height) ;
  
  image(silo, 0, 250, 450, 200) ;
//image

  tint(255, opa) ;
  image(cape, 0, 250, 450, 200) ;



image(silo, 0, 250, 450, 200) ; 
opa = opa + opaDelta ;
if (opa> 100) {
   opaDelta = -3 ;
}
if (opa < 0) {
  opaDelta = 3 ;
}
tint(255, random(100)) ;
image(cape, 0, 250, 450, 200) ;

fill(185);
  ellipse(a, b, 4, 4) ;
  a = a + 7 ; //put if statement to reset
  if (a > width) {
  a = 0 ;
  }
  b = b + 14 ;
  if (b > height) {
  b = 100 ;
}
 ellipse(a1, b1, 3, 3) ;
  a1 = a1 + 7 ; //put if statement to reset
  if (a1 > width) {
  a1 = 0 ;
  }
  b1 = b1 + 15 ;
  if (b1 > height) {
  b1 = -50 ;
}
  ellipse(a2, b2, 5, 5) ;
  a2 = a2 + 8 ; //put if statement to reset
  if (a2 > width) {
  a2 = 0 ;
  }
  b2 = b2 + 17 ;
  if (b2 > height) {
  b2 = -125 ;
}
  ellipse(a3, b3, 5, 5) ;
  a3 = a3 + 6 ; //put if statement to reset
  if (a3 > width) {
  a3 = 0 ;
  }
  b3 = b3 + 12 ;
  if (b3 > height) {
  b3 = -200 ;
}
  ellipse(a4, b4, 3, 3) ;
  a4 = a4 + 12 ; //put if statement to reset
  if (a4 > width) {
  a4 = 0 ;
  }
  b4 = b4 + 24 ;
  if (b4 > height) {
  b4 = 0 ;
}
  ellipse(a5, b5, 3, 3) ;
  a5 = a5 + 9 ; //put if statement to reset
  if (a5 > width) {
  a5 = 0 ;
  }
  b5 = b5 + 18 ;
  if (b5 > height) {
  b5 = 50 ;
}
  


}



