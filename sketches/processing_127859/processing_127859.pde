
int positieX;
int positieY;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  for (int i = 0; i < 10; i = i + 1){
    teken (50+(i*155),150);
  }
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(0);
}

void teken (int positieX, int positieY){
  fill(0);
  stroke(0);
  triangle(positieX+10, 120, positieX+20, 110, positieX+30, 130); // rechte driehoek
  triangle(positieX-30, 130, positieX-20, 110, positieX-10, 120); // linkse driehoek
  
  fill(255,2,2);
  noStroke();
  ellipse(positieX,190,115,140);                    // Rode lichaam
  rect(positieX-50,230,40,10,50);                   // Links bovenbeen
  rect(positieX+50,230,40,10,50);                   // Rechts bovenbeen
  rect(positieX-70,245,10,60,50);                   // Links onderbeen
  rect(positieX+70,245,10,60,50);                   // Rechts onderbeen
    
  fill(255);
  ellipse(positieX,160,55,60);                      // Witte oog
  
  fill(0);
  noStroke();
  ellipse(positieX,165,30,30);                      // Zwarte pupil
  
  fill(255);
  noStroke();
  ellipse(positieX,165,10,10);                      // Wit oog in pupil
  
  stroke(0);
  rect(positieX, 220, 40, 20, 50);                  // Mond
  line(positieX-10, 210, positieX-10, 230);         // linkse tand
  line(positieX, 210, positieX, 230);               // Middelste tand
  line(positieX+10, 210, positieX+10, 230);         // Rechtse tand
  line(positieX-20, 220, positieX+20, 220);         // Horizontale lijn
}
