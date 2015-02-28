
int x = 100;
int y = 100;
PImage gst;
PFont font;


void setup () {
   font = loadFont("Serif-48.vlw"); 
  textFont(font, 36); 
//text("word", 15, 50);
  size (400, 400);
  gst = loadImage("gst.jpg");
  smooth();
  strokeWeight(.5);
 
}

void draw () {

  
  

  background(25);
  image(gst,0,0);
  text("Looking for the Westside", 5, 50);
  x = mouseX;
  y = mouseY;
  

  
 

  if (mousePressed) {
  //colour
  fill(800, 100, 0);
  } else {
    fill(0, 100, 0);
  }
  
  //arms
  rect(x-60, y-10, 120, 20);
  //body
  rect(x-10, y-60, 20, 130);

  //colour
  fill(0, 100, 0);
  //backhead
  ellipse(x, y-60, random(x), 40);

  //colour
   if (mousePressed) {
  //colour
  fill(800, 100, 0);
  } else {
     fill(5, 50, 0);
  }
  
 
  //innerhead
  ellipse(x, y-60, 90, random(y));

  //colour
  fill(255, 255, 0);
  //eye
  ellipse(x, y-60, 30, 30);

  //colour
  fill(0, 255, 255);
  //eye pupil
  ellipse(x, y-60, 10, 10);

  //colour
  fill(255, 255, 0);
  //ellipse(x, y, x-90, y+60);
  ellipse(x, y, 60, 60);
  ellipse(x, y, 50, 50);
  ellipse(x, y, 40, 40);
  ellipse(x, y, 30, 30);
  
  
    if (mousePressed) {
  //colour
  fill(800, 100, 0);
  } else {
    fill(0, 100, 0);
  }
  
  ellipse(x, y, 20, 20);

  //colour
  fill(255, 255, 0);

  //left hand

  arc(x-70, y, 50, random(50), PI, TWO_PI+HALF_PI);
  
  //right hand
  
  arc(x+70, y,  50, random(50), 0, PI+HALF_PI);

  //colour
  fill(0, 100, 0);
  //left
  rect(x-40, y+60, 30, 10);
  //right
  rect(x+10, y+60, 30, 10);


  // bottom circles

  //colour
  fill(0, 255, 255);
  // middle 
  ellipse(x, random(y+75), 10, 10);


  //colour
  fill(255, 255, 0);
  // left
  ellipse(x-40, y+80, random(20), 20);
  // right
  ellipse(x+40, y+80, random(20), 20);
}


