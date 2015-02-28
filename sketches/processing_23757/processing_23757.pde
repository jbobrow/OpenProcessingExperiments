
int changecolour = 0;


void setup(){
  size(550,500);
  
  //setting up the background image
  PImage bg;
  bg = loadImage("decoratingcookies.jpg");
  background(bg);
  
  //setting the cursor
  PImage bag;
  bag = loadImage("pipingbag.png");
  cursor(bag);
  
  //setting up the text instructions
  fill(0);
  PFont font;
  font = loadFont("AmericanTypewriter-Light-12.vlw");
  textFont(font, 12);
  text("Press 'x' to reset,", 425, 80);
  text("and 's' to save", 441, 95);
  
}


void draw(){
  frameRate(100);
  smooth();
  fill(changecolour);
  noStroke();
  if (mousePressed == true){
  ellipse(mouseX-105, mouseY+105, 7, 7);
}

  if(keyPressed){
  if (key == 'r' || key == 'R'){
    changecolour = #FA2D2D;//red
  }
  
  if (key == 'o' || key == 'O'){
  changecolour = #ff9900;//orange
  }
  
  if (key == 'y' || key == 'Y'){
    changecolour = #ffff66;//yellow
  }
  
  if (key == 'g' || key == 'G'){
    changecolour = #99ff99;//green
  }
  
  if (key == 'b' || key == 'B'){
    changecolour = #6699ff;//blue
  }
  
  if (key == 'k' || key == 'K'){
    changecolour = 0;//black
  }
  
  if (key == 'w' || key == 'W'){
    changecolour = 255;//white
  }
  
  //reset the background
  if (key == 'x' || key =='X'){
    PImage bg;
    bg = loadImage("decoratingcookies.jpg");
    background(bg);
    fill(0);
   
    PFont font;
    font = loadFont("AmericanTypewriter-Light-12.vlw");
    textFont(font, 12);
    text("Press 'x' to reset", 425, 80);
      text("and 's' to save", 441, 95);
    }
    
    if (key == 's' || key == 'S'){
      save("mycookie.jpg");
      println("^_^ Your cookie is saved! Check it out in the sketch folder.");
    }
  
  }
}







