
int positieX;
int positieY;

void setup () {
  size(200,200);
  positieX=100;
  positieY=100;
}

void draw () {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(0);
  positieY = positieY -1;
    
  fill(250,2,2);
  noStroke();
  ellipse(mouseX,positieY,115,140);    // Rode lichaam positieX=100 - positieY = 70
  
  fill(255);
  ellipse(mouseX,positieY-30,55,60);     // Witte oog
  
  fill(0);
  noStroke();
  ellipse(mouseX,positieY-25,30,30);     // Zwarte pupil
  
  fill(255);
  noStroke();
  ellipse(mouseX,positieY-25,10,10);     // Wit oog in pupil
  
  fill(255);
  stroke(0);
  rect(mouseX, positieY+30, 40, 20, 50); // Mond
  
  fill(255,2,2);
  stroke(255,0,0);
  rect(mouseX-50,positieY+40,40,10,50);   // Links bovenbeen
  rect(mouseX+50,positieY+40,40,10,50);   // Rechts bovenbeen
  rect(mouseX-70,positieY+55,10,60,50);   // Links onderbeen
  rect(mouseX+70,positieY+55,10,60,50);   // Rechts onderbeen
  
  fill(0);
  stroke(0);
  triangle(mouseX+10, positieY-70, mouseX+20, positieY-80, mouseX+30, positieY-60); // rechte driehoek
  triangle(mouseX-30, positieY-60, mouseX-20, positieY-80, mouseX-10, positieY-70); // linkse driehoek
  
  line(mouseX-10, positieY+20, mouseX-10, positieY+40);         // linkse tand
  line(mouseX, positieY+20, mouseX, positieY+40);               // Middelste tand
  line(mouseX+10, positieY+20, mouseX+10, positieY+40);         // Rechtse tand
  line(mouseX-20, positieY+30, mouseX+20, positieY+30);
}
