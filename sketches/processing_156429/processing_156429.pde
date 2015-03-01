
color ballColorBlue;
color ballColorRed;
color ballColorGreen;
float radius   ;
float   fRate;

void setup(){
  smooth();
  fRate = 15;
  size(750, 750);
  frameRate(fRate);
  noStroke();
  background(0);
  
  radius = random(15,150);
  
  ballColorBlue  = color(0, 0, random(100, 255), random(100, 255));

  ballColorRed   = color(random(100, 255), 0, 0, random(100, 255));
  
  ballColorGreen = color(0, random(100, 255), 0, random(100, 255));
  
  textSize(50);
  fill(255,0,0);
  text("Press R for Red"  , width/4, height/7)  ;
  fill(0,0,255);
  text("Press B for Blue" , width/4, height/7*3);
  fill(0,255,0);
  text("Press G for Green", width/4, height/7*2);
  fill(255);
  text("Press S to Clear" , width/4, height/7*4);
  text("Hold D for less"  , width/4, height/7*5);
  text("Hold F for more"  , width/4, height/7*6);
}

void draw(){
 frameRate(fRate);
 
 if (keyPressed == true && key == 's'){
   background(0);
 }
 
 if (keyPressed == true && key == 'b'){
  fill(ballColorBlue);
  ellipse(random(0,750), random(0,750), radius, radius);
  radius = random(75);
  ballColorBlue = color(0, 0, random(100, 255), random(100, 255));
  }
  
 if (keyPressed == true && key == 'r'){
  fill(ballColorRed);
  ellipse(random(0,750), random(0,750), radius, radius);
  radius = random(75);
  ballColorRed = color( random(100, 255), 0, 0, random(100, 255));
  }
  
 if (keyPressed == true && key == 'g'){
  fill(ballColorGreen);
  ellipse(random(0,750), random(0,750), radius, radius);
  radius = random(75);
  ballColorGreen = color(0, random(100, 255), 0, random(100, 255));
  }
  
 if (fRate >= 10 && keyPressed == true && key == 'd'){
   fRate = fRate - 5;
 }
 
 if (fRate <= 55 && keyPressed == true && key == 'f'){
   fRate = fRate + 5;
 }
}
