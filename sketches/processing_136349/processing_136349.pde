
/* @pjs  font = "Garamond-80.vlw, rainBold.ttf, birthmark.ttf" ; preload = "ghosttrees.png, shark50.png, oceanparticles.png, clouds.png, clouds2.png, clouds3.png, angelCursor72.png, chains400.png, nogod400.png, orb40.png, orb50.png"  ; */


int myState = 0 ;
int myCounter = 100 ;
int myCounter2 = 50 ;
int x = 510 ;
int x1 = 0 ;
int xDelta = -1 ;
int x2 = -200 ;
int x2Delta = 1 ;
int y = 412 ;
int y2 = 445 ;
int y3 = 0 ;
float y4 = 100 ;
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

float rectOpac = 255 ;
float redValue = 0 ;
float greenValue = 255 ;
float blueValue = 0 ;
 
PImage myCursor ;
PImage chains ;
PImage nogod ;
PImage orb40 ;
PImage orb50 ;
PImage ghosttrees ;
PImage shark50 ;
PImage oceanparticles ;
PImage clouds ;
PImage clouds2 ;
PImage clouds3 ;

PFont gara ;
PFont rain ;
PFont birthmark ;


void setup() {
  size(500, 500) ;
  
  myCursor = loadImage("angelCursor72.png") ;
  chains = loadImage("chains400.png") ;
  nogod = loadImage("nogod400.png") ;
  orb40 = loadImage("orb40.png") ;
  orb50 = loadImage("orb50.png") ; 
  ghosttrees = loadImage("ghosttrees.png") ;
  shark50 = loadImage("shark50.png") ; 
  oceanparticles = loadImage("oceanparticles.png") ; 
  clouds = loadImage("clouds.png") ; 
  clouds2 = loadImage("clouds2.png") ; 
  clouds3 = loadImage("clouds3.png") ;  
  
  rain = createFont("rainBold.ttf", 40) ;
  gara = createFont("Garamond-80.vlw", 22) ;
  birthmark = createFont("birthmark.ttf", 72) ;

}

void draw() {
  

  
switch(myState) {
  case 0:
    background(0);
    
   redValue = 255;
   greenValue = 255;
   blueValue = 255;
  
   rectOpac = map(mouseY, 0, width, 0, 255);
   
   blueValue = map(mouseX, 0, height, 0, 255);
   greenValue = map(mouseX, 0, height, 0, 255); 
   redValue = map(mouseX, 0, height, 0, 255);
   
   fill(redValue, greenValue, blueValue, rectOpac);
   ellipse(100, 445, 42, 42);
 
    fill(255);
    
  ellipse(a, b, 4, 4) ;
  a = a + 4 ; //put if statement to reset
  if (a > width) {
  a = 0 ;
  }
  b = b + 4 ;
  if (b > height) {
  b = 100 ;
}
 ellipse(a1, b1, 3, 3) ;
  a1 = a1 + 3 ; //put if statement to reset
  if (a1 > width) {
  a1 = 0 ;
  }
  b1 = b1 + 3 ;
  if (b1 > height) {
  b1 = -50 ;
}
  ellipse(a2, b2, 5, 5) ;
  a2 = a2 + 6 ; //put if statement to reset
  if (a2 > width) {
  a2 = 0 ;
  }
  b2 = b2 + 6 ;
  if (b2 > height) {
  b2 = -125 ;
}
  ellipse(a3, b3, 5, 5) ;
  a3 = a3 + 2 ; //put if statement to reset
  if (a3 > width) {
  a3 = 0 ;
  }
  b3 = b3 + 2 ;
  if (b3 > height) {
  b3 = -200 ;
}
  ellipse(a4, b4, 3, 3) ;
  a4 = a4 + 3 ; //put if statement to reset
  if (a4 > width) {
  a4 = 0 ;
  }
  b4 = b4 + 3 ;
  if (b4 > height) {
  b4 = 0 ;
}
  ellipse(a5, b5, 3, 3) ;
  a5 = a5 + 1 ; //put if statement to reset
  if (a5 > width) {
  a5 = 0 ;
  }
  b5 = b5 + 1 ;
  if (b5 > height) {
  b5 = 50 ;
}
 
    textFont(rain) ; 
    text("Meet Icarus.", 15, 35);
  
    text("Icarus is on a quest to find god.", 120, 75);


    text("Click the sphere,", 278, 180);
    text("set Icarus free.", 299, 218);
    text("Help him.", 354, 380);
    
    image(chains, 0, 100) ;
    image(orb50, 75, 421) ;
   break ; 
   
  
  
  
 case 1:  //green******
     //the state is 0
   background(255);
   image(ghosttrees, 0, 0) ;
   redValue = 0;
   greenValue = 255;
   blueValue = 0;
   
      
     //mouse controls opacity -- make sure you limit the values to an acceptable RGB range 0-255
   rectOpac = map(mouseY, 0, width, 0, 255);
   
     //mouse controls the green value -- set to the y values and limited to values between 0-255
   greenValue = map(mouseX, 0, height, 0, 255);
     
     
     //set the fill to the new values
   fill(redValue, greenValue, blueValue, rectOpac);
   rect(0, 0, 500, 500);
   noStroke();
   ellipse(385, 26, 42, 42);
   fill(255);
   stroke(1);
   textFont(rain) ; 
   text("He searches the darkest corners", 10, 40) ; 
   text("of the forest...", 305, 80) ;

   image(myCursor, mouseX, mouseY) ;

   image(orb50, 357, 1) ;
  break ; 
  
  
  

  case 2: //blue******
 
   background(255);

   redValue = 0;
   greenValue = 0;
   blueValue = 255;
  
   
   rectOpac = map(mouseY, 0, width, 0, 255);
   
   blueValue = map(mouseX, 0, height, 0, 255);
   
  
   fill(redValue, greenValue, blueValue, rectOpac);
   rect(0, 0, 500, 500);
   noStroke();
   ellipse(74, 443, 42, 42);
   fill(255);
   stroke(1);
   textFont(rain) ; 
   text("and the depths of the ocean...", 10, 40) ; 

   image(oceanparticles, 0, y3) ;
  y3 = y3 - 1 ;
  if (y3 < -1000) {
  y3 = 0 ;
  }
  image(shark50, x, y4);
  x = x - 1 ;
  if (x < -125) {
  x = 510 ;
  y4 = random(500) ;
  }
  
   image(myCursor, mouseX, mouseY) ;
   image(orb50, 47, 418) ;
   
 break ;
   
   
   
   
 case 3: //red******
   
  background(255); 

  image(clouds3, x2, 45) ;
   x2 = x2 + x2Delta ;
if (x2 > -2) {
   x2Delta = -1 ;
}
if (x2 < -198) {
  x2Delta = 1 ;
}


  image(clouds, x1, -45) ;
   x1 = x1 + xDelta ;
if (x1 < -190) {
   xDelta = 1 ;
}
if (x1 > -2) {
  xDelta = -1 ;
}


  
  redValue = 255;
  greenValue = 0;
  blueValue = 0;
 
    //mouse controls opacity -- make sure you limit the values to an acceptable RGB range 0-255
  rectOpac = map(mouseY, 0, width, 0, 255);
   
    //mouse controls the green value -- set to the y values and limited to values between 0-255
  redValue = map(mouseX, 0, height, 0, 255);
   
    //set the fill to the new values
  fill(redValue, greenValue, blueValue, rectOpac);
   rect(0, 0, 500, 500);
   noStroke();
   ellipse(370, 26, 42, 42);
   fill(255);
   stroke(1);
    textFont(rain) ;    
   text("He even searches the heavens...", 10, 430) ;
   image(myCursor, mouseX, mouseY) ;
   image(orb50, 342, 1) ;
   
 break ; 
  
   
  
 
 case 4: //black and white****

   background(255);

   redValue = 255;
   greenValue = 255;
   blueValue = 255;
  
   
  
   rectOpac = map(mouseY, 0, width, 0, 255);
   
   blueValue = map(mouseX, 0, height, 0, 255);
   greenValue = map(mouseX, 0, height, 0, 255); 
   redValue = map(mouseX, 0, height, 0, 255);
  
  
   fill(redValue, greenValue, blueValue, rectOpac);
   rect(0, 0, 500, 500);
   //noStroke();
   //ellipse(250, 465, 150, 150);
   
      
  ellipse(a, b, 4, 4) ;
  a = a + 4 ; //put if statement to reset
  if (a > width) {
  a = 0 ;
  }
  b = b + 4 ;
  if (b > height) {
  b = 100 ;
}
 ellipse(a1, b1, 3, 3) ;
  a1 = a1 + 3 ; //put if statement to reset
  if (a1 > width) {
  a1 = 0 ;
  }
  b1 = b1 + 3 ;
  if (b1 > height) {
  b1 = -50 ;
}
  ellipse(a2, b2, 5, 5) ;
  a2 = a2 + 6 ; //put if statement to reset
  if (a2 > width) {
  a2 = 0 ;
  }
  b2 = b2 + 6 ;
  if (b2 > height) {
  b2 = -125 ;
}
  ellipse(a3, b3, 5, 5) ;
  a3 = a3 + 2 ; //put if statement to reset
  if (a3 > width) {
  a3 = 0 ;
  }
  b3 = b3 + 2 ;
  if (b3 > height) {
  b3 = -200 ;
}
  ellipse(a4, b4, 3, 3) ;
  a4 = a4 + 3 ; //put if statement to reset
  if (a4 > width) {
  a4 = 0 ;
  }
  b4 = b4 + 3 ;
  if (b4 > height) {
  b4 = 0 ;
}
  ellipse(a5, b5, 3, 3) ;
  a5 = a5 + 1 ; //put if statement to reset
  if (a5 > width) {
  a5 = 0 ;
  }
  b5 = b5 + 1 ;
  if (b5 > height) {
  b5 = 50 ;
}
    fill(255);
    textFont(rain) ; 
   text("...in his freedom Icarus doesn't find god.", 10, 30) ;
   text("He finds", 100, 75) ;  
  textFont(birthmark); 
   text("TRUTH", 210, 140) ;
   image(nogod, 57, 128) ; 
   //motes floating
   fill(255, 255, 255, myCounter);
   myCounter = myCounter - 1 ;
   if (myCounter < 1) {
     myCounter = 100 ;
   }
   noStroke();
   ellipse(250, y, 3, 3);
   y = y - 1 ;
   if (y < 292) {
     y = 412 ;
   }
   ellipse(235, y+30, 3, 3);

   ellipse(228, y2+20, 3, 3);
      y2 = y2 - 2 ;
   if (y2 < 292) {
     y2 = 412 ;
   }

   ellipse(267, y+10, 3, 3);

   ellipse(168, y2-5, 3, 3);
   
   ellipse(316, y+10, 3, 3);
   
   ellipse(288, y2+30, 3, 3);

   ellipse(301, y+20, 3, 3);

   fill(255, 255, 255, myCounter2);
   myCounter2 = myCounter2 - 1 ;
   if (myCounter2 < 1) {
     myCounter2 = 100 ;
   }
   
   ellipse(255, y-10, 3, 3);
   
   ellipse(316, y2+10, 3, 3);

   ellipse(210, y-10, 3, 3);
   
   ellipse(195, y2-5, 3, 3);
   
   ellipse(272, y-5, 3, 3);
   
   ellipse(182, y+50, 3, 3);
   
   ellipse(300, y2+50, 3, 3);


   
 break ;

 

  }
}

void mousePressed() {
 //essentially an "interupt"
 //creating a button with a response for state 2..  && (myState == 2)
println(mouseX +","+mouseY);

//home
if ((mouseX > 79) && (mouseX < 129) && (mouseY > 422) && (mouseY < 469) && (myState == 0)) {

  myState = myState + 1 ; 

}

//green

if ((mouseX > 350) && (mouseX < 405) && (mouseY > 4) && (mouseY < 46) && (myState == 1)) {

  myState = myState + 1 ; 

}

//blue

if ((mouseX > 46) && (mouseX < 99) && (mouseY > 420) && (mouseY < 463) && (myState == 2)) {

  myState = myState + 1 ; 

}

//red


if ((mouseX > 350) && (mouseX < 390) && (mouseY > 4) && (mouseY < 46) && (myState == 3)) {

  myState = myState + 1 ; 

}

//end
println(mouseX +","+mouseY);
if ((mouseX > 173) && (mouseX < 323) && (mouseY > 370) && (mouseY < 490) && (myState == 4)) {


  myState = myState + 1 ; 
  if (myState > 4) {
  myState = 0 ;
  
} 
} 
  
}

//  mouse control code shared from 
//  http://www.openprocessing.org/sketch/131842


