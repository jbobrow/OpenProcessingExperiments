
/* Conor Russomanno
HW 8/4 - Moving Font over Rectangle Tiles*/

PFont myFont; //create PFont Variable
int fontX = -1;
float fontY = random(30, 110); //set random font y-value but make sure it's within display

void setup () {
  size(150, 119);
  background(#87d612);
  smooth();
  myFont = loadFont("LucidaHandwriting-Italic-40.vlw"); //call font
  textFont(myFont, 20);
  frameRate(60);
  textAlign(RIGHT);  // to set right side of font to start at x = -1  
}

void draw() {
  //no stroke
  background(#87d612);
  
  noStroke();
  
  //change color and draw rectangle
  fill(#b8e73d);
  rect(0,101,37,19);
  
  //change color and draw rectangle (kermit colored)
  fill(#4fc215);
  rect(0,0,70,55);

  //change color and draw rectangle (kermit colored)
  fill(#b8e749);
  rect(86,70,31,43);  
  
  //change color and draw rectangle
  fill(#42955e);
  rect(58,22,57,51);
  
  //change color and draw rectangle
  fill(#41975e);
  rect(0,0,37,101);
  
  //change color and draw rectangle
  fill(#44945e);
  rect(0,0,160,10);
  
  //change color and draw rectangle
  fill(#347257);
  rect(4,5,101,20);
  
  //change color and draw rectangle
  fill(#35a264);
  rect(107,0,53,29);
  
  //change color and draw rectangle
  fill(#639a7c);
  rect(115,29,45,28);  

  //change color and draw rectangle
  fill(#9fe953);
  rect(116,57,44,55);
  
  //change color and draw rectangle
  fill(#3c4443);
  rect(85,112,75,8);
  
  //change color and draw rectangle
  fill(#649c7d);
  rect(135,102,25,18);
  
  //change color and draw rectangle
  fill(#347257);
  rect(4,5,101,20);
  
  //change color and draw rectangle
  fill(#37875b);
  rect(111, 56, 12, 57);
  
  //change color and draw rectangle
  fill(#377a61);
  rect(81, 0, 44, 33);
  
  //change color and draw rectangle
  fill(#487251);
  rect(0,0,7,15);
  
  //MOVING TEXT (left to right)
  fill(255);
  
  if(fontX <= 300) {  //so it comes back to the beginning once it's gone too far
    text("Moving Text!", fontX, fontY);
    fontX = fontX + 1;
  }
  
  else{  //to reset the x-value back to 0 and give a new random y-value for the next cycle
    fontX = -1;
    fontY = random(30, 110);
  }
}


