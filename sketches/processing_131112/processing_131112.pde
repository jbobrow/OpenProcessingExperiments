
//hw04
//copyright Risa Hiyama
//1.16.2014

//mousePressed: When pressing mouse, the figure becomes half a size
//keyPressed: When any key is pressed, the figure gets 1.5 times bigger
//mouseWheel: When mouse is scrolled, the background color changes randomly

  //global variables
  float x,y;
  float wd,ht;
  float d;
  PFont f;
  //PFont write the text
  
  //make the movements slow
  float diam, easingCoefficient;
  float dx = mouseX - x;
  float dy = mouseY - y;
  
void setup()
{   
  smooth();  
  //delete cursor 
  noCursor();
  // set canvas
  size (1000, 1000);
  // draw the picture
  //picture = loadImage("quote.png");
  
  frameRate(25);
  
  x = 100;
  y = 200;
  wd = 230;
  ht = 220;
  d = 2;
  diam = width*.15;
  easingCoefficient = 0.1;
  f = createFont("Arial",16,true);
}

void draw()
{
 // draw the text picture
 // image( picture, 30, 0, 250, 150 );
  
 // change x and y by an amount equal to the distance between 
 // the mouse and the circle multiplied by the easingCoefficient  
  x = x + ( dx * easingCoefficient );
  y = y + ( dy * easingCoefficient );
  
  //background;
  fill (250, 20);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  //write text
  textFont(f,20);
  fill(50);
  text("Type in your name if you want to talk to me, click your mouse if you want to catch me!!",100,100);
  
  //face
  fill(random(0,100), 150, random(50,100));
  noStroke();
  stroke(random(30,100), 100, random(50,80));
  strokeWeight (d*2);
  ellipse(mouseX,mouseY,wd,ht);
  
  //nose
  noFill();
  strokeWeight (d*2);
  stroke(60, 30, 10);
  beginShape();
  vertex(mouseX+wd/5*2  ,mouseY+ht/4*1.4);
  vertex(mouseX+wd/5*2  ,mouseY+ht/4*2.4);
  vertex(mouseX+wd/5*2.5,mouseY+ht/4*2.4);
  endShape ();
  
  //R right and left horizontal
  rectMode(CORNERS);  // Set rectMode to CORNERS
  stroke(0);
  fill(250); //color black
  strokeWeight (d*2);
  rect(mouseX+wd/5*.8 , mouseY+ht/4*1.1, mouseX+wd/5*1.7, mouseY+ht/4*1.1 );
  rect(mouseX+wd/5*2.6, mouseY+ht/4*1.1, mouseX+wd/5*3.5  , mouseY+ht/4*1.1 );
   
  //R arc
  fill(0);
  ellipseMode(CORNER);  // Set ellipseMode is CORNER
  strokeWeight (d*2);
  arc(mouseX+wd/5*1.292, mouseY+ht/4*.9 , wd/12, ht/9, 0, PI);
  arc(mouseX+wd/5*2.63 , mouseY+ht/4*.9 , wd/12, ht/9, 0, PI);
   
  //R line
  noFill();
  strokeWeight (d*2);
  beginShape();
  vertex(mouseX+wd/5*1.4, mouseY+ht/4*1.2);
  vertex(mouseX+wd/5    , mouseY+ht/4*1.5);
  endShape();
  beginShape();
  vertex(mouseX+wd/5*2.9, mouseY+ht/4*1.2);
  vertex(mouseX+wd/5*3.3, mouseY+ht/4*1.5);
  endShape();
  
  //ears
  noFill();
  strokeWeight (d*2);
  stroke(50, 20, 5);
  beginShape();
  curveVertex(mouseX-wd*.4+wd/10 ,mouseY-ht*1.18+ht);
  curveVertex(mouseX-wd*.04+wd/5 ,mouseY-ht*1.18+ht);
  curveVertex(mouseX+wd*.04+wd/3.5 ,mouseY-ht*1.09+ht);
  curveVertex(mouseX+wd/3  ,mouseY-ht*.9+ht);
  curveVertex(mouseX+wd/3  ,mouseY-ht*.9+ht);
  endShape ();
  beginShape();
  curveVertex(mouseX-wd*.2+wd/1.2,mouseY-ht*1.18+ht);
  curveVertex(mouseX+wd/1.2,mouseY-ht*1.18+ht);
  curveVertex(mouseX+wd/1.37 ,mouseY-ht*1.09+ht);
  curveVertex(mouseX-wd*.08+wd/1.37 ,mouseY-ht*.9+ht);
  curveVertex(mouseX-wd*.02+wd/1.37 ,mouseY-ht*.9+ht);
  endShape ();
  strokeWeight (d*2);
  stroke(random(30,100), 150, random(50,80));
  fill(random(0,100), 150, random(50,100));
  ellipse(mouseX-wd*.04+wd/6,mouseY-ht*1.13+ht-ht*0.13,wd/8,ht/8);
  ellipse(mouseX+wd/1.3,mouseY-ht*1.13+ht-ht*0.13,wd/8,ht/8);
   
  //mushtash
  stroke(50, 20, 5);
  strokeWeight (d*2);
  fill(60, 30, 10);
  beginShape();
  vertex(mouseX+wd/5*1.6 ,mouseY+ht/4*2.6);
  vertex(mouseX+wd/5*1.5 ,mouseY+ht/4*2.9);
  vertex(mouseX+wd/5*3.2 ,mouseY+ht/4*2.9);
  vertex(mouseX+wd/5*3 ,mouseY+ht/4*2.6);
  vertex(mouseX+wd/5*1.6 ,mouseY+ht/4*2.6);
  endShape ();
   
  //cheek
  fill(255, 114, 86);
  strokeWeight (d*0);
  ellipse(mouseX+wd/5*.3 , mouseY+ht/4*1.7, wd/4, ht/5); 
  ellipse(mouseX+wd/5*3, mouseY+ht/4*1.7, wd/4, ht/5);
 
}

/*Mouse and keyboard action ----------------------------------------
*/ 
  
  int value = 0;


void mousePressed(){
  if (value == 0) {
  wd = wd/2;
  ht = ht/2;
  d = d/2;
  } 
}
  
void keyPressed(){
  if (value == 0) {
  wd = wd*1.5;
  ht = ht*1.5;
  d = d*1.5;
  } 
}


void mouseWheel(MouseEvent event)
{
  stroke(random(255),random(255),random(255));
  strokeWeight(50);
}





