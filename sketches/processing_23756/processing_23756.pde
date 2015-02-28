


void setup(){
  frameRate(6);
  size(570,517);
  
  //setting up the background image
  PImage bg;
  bg = loadImage("bakingcookies1.jpg");
  background(bg);
  
  //setting up the text instructions
  fill(0);
  PFont font;
  font = loadFont("AmericanTypewriter-Light-12.vlw");
  textFont(font, 12);
  text("Click to set cookies", 320,115);
  fill(100);
  text("Press 'x' to reset", 320, 130);
}

void draw(){
  
 //sets a cookie wherever you click
 if (mousePressed == true){
  PImage cookie;
  cookie = loadImage("snowmancookie1.png");
  imageMode(CENTER);
  image(cookie,mouseX,mouseY);
  
 } 
 
 //resets the pan
 if(keyPressed){
    if(key == 'x' || key == 'X'){
      PImage bg;
      bg = loadImage("bakingcookies1.jpg");
      background(bg);
       fill(0);
      PFont font;
      font = loadFont("AmericanTypewriter-Light-12.vlw");
      textFont(font, 12);
      text("Click to set cookies", 320,115);
      fill(100);
      text("Press 'x' to reset", 320, 130);
      }
    }
}

  



