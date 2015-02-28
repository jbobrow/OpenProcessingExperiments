
//Richard May rwmay@andrew.cmu.edu
//hw#3
//Copyright September 2012

// Clicking the Right, LEFT and CENTER buttons on the mouse produce different effects 
//as well as  pressing the "b" and "c" keys. Try multiple calls in combination to produce
//different effects.

float x, y, wd, ht,opacity,gen,randX,randY;
int sizeX,sizeY;
void setup()
{
  size( 1080,640);
  smooth();
  //sizeX=400;
  //sizeY=400;
  noCursor();
}

void draw()
{
  //sizeX=sizeX+1;
  //sizeY=sizeY+1;
  //size(sizeX,sizeY);
  randX= random (0,width);
  randY= random (0,height);
  gen=frameCount%225;
  //background determined red count
  opacity = frameCount % 225;
  fill(frameCount % 225,mouseX,mouseY, 50);
  //background(frameCount % 225,mouseX,mouseY);
  rect(mouseX, mouseY, mouseX, mouseY);
  if (mousePressed == true) {
    opacity = 0;
  } else {
    opacity = 225;
  }
  
  if (mousePressed && (mouseButton == LEFT)) {
    fill(0,0,0,0);
    noStroke();
  } else if (mousePressed && (mouseButton == RIGHT)) {
    
    line(width, height, mouseX,mouseY);
    line(0, height, mouseX, mouseY);
    line(width, 0, mouseX,mouseY);
    line(0, 0, mouseX, mouseY);
    fill(255,255,255);
    textSize (36);
    text (frameCount/60 + "S", mouseX-20, mouseY+20);
    
  } else if (mousePressed && (mouseButton == CENTER)) {
    
    stroke(random (0,225), random(0,225), random (0,225),75);
    line(randX, randY, 1.5*mouseX, 1.5*mouseY);
    line(randX, randY, .5*mouseX, 1.5*mouseY);
    line(randX, randY, 1.5*mouseX,.5*mouseY);
    line(randX, randY, .5*mouseX, .5*mouseY);
    
    
     } else {
    fill(255);
    stroke(255,255,255,100);
  }
  rectMode(CENTER);
  //background(255,255,255,5);
  //rect(mouseX, mouseY, 10,10);
  //text(mouseX, mouseY, "Text");
  
  
  if (keyPressed) {
      if (key == 'b'){   
         fill(0,0,0, random (5,20));
         rect(random (0,width), random(0,width), random (0,width), random (0,width)) ;
      } 
  else if (key == 'c') {  
    noStroke();
    fill(255,255,255,5);
    //rectMode(CORNER);
    rect (.5*width,.5*height,width,height);
    }
//takes picture of screen when key p is pressed
//  else if (key == 'p'){
//    save ("hw3.jpeg");
//  }
}


}




