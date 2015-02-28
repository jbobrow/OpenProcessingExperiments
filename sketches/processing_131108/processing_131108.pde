
//hw03
//copyright Risa Hiyama
//1.16.2014
  float x,y;
  float wd,ht;
  float d;
  
  void setup()
{
  size (1000,1000);
  noCursor();
  smooth();
  frameRate(20);
  
  d = 2;
  x = 100;
  y = 200;
  wd = 250;
  ht = 200;
}

void draw()
{
  //background (5, 186, 250);
  fill (24,79,24, 5);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  //face
  fill(255, random(200), random(200));
  strokeWeight (d*2);
  ellipse(mouseX,mouseY,wd,ht);

  //nose
  noFill();
  strokeWeight (d*2);
  stroke(70);
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
  // how do i erase the ears. make the ears go higher? 
  noFill();
  strokeWeight (d*5);
  stroke(0);
  beginShape();
  vertex(mouseX+wd/4 ,mouseY+ht/60);
  vertex(mouseX+wd/3  ,mouseY+ht/7);
  endShape ();
  beginShape();
  vertex(mouseX+wd/1.7,mouseY+ht/60);
  vertex(mouseX+wd/2 ,mouseY+ht/7);
  endShape ();
   
//mushtash
  stroke(70);
  strokeWeight (d*2);
  fill(70);
  beginShape();
  vertex(mouseX+wd/5*1.6 ,mouseY+ht/4*2.6);
  vertex(mouseX+wd/5*1.5 ,mouseY+ht/4*2.9);
  vertex(mouseX+wd/5*3.2 ,mouseY+ht/4*2.9);
  vertex(mouseX+wd/5*3 ,mouseY+ht/4*2.6);
  vertex(mouseX+wd/5*1.6 ,mouseY+ht/4*2.6);
  endShape ();
   
//cheek
  fill(255, 69, 0);
  strokeWeight (d*0);
  ellipse(mouseX+wd/5*.3 , mouseY+ht/4*1.7, wd/4, ht/5); 
  ellipse(mouseX+wd/5*3, mouseY+ht/4*1.7, wd/4, ht/5);
 
}


