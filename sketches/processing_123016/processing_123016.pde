
int positieX;
int richting;
int score;
boolean test;

void setup () {
  size(500,500);
  positieX = 100;
  richting = 5;
  score = 0;
  test = false;
}

void draw () {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(0);
  
  positieX = positieX + richting;
  
  if(positieX > 500 || positieX < 0){
  richting = -richting;
  score = score +1;
  println(score);
}

  if(score == 10){
  score = 0;
  test = !test;
}
  
  fill(0);
  stroke(0);
  triangle(positieX+10, 120, positieX+20, 110, positieX+30, 130); // rechte driehoek
  triangle(positieX-30, 130, positieX-20, 110, positieX-10, 120); // linkse driehoek
  
  noStroke();
  if(test == true){
  fill(550,255,0);
  ellipse(positieX,190,115,140);    // Geel lichaam
  rect(positieX-50,230,40,10,50);   // Links bovenbeen
  rect(positieX+50,230,40,10,50);   // Rechts bovenbeen
  rect(positieX-70,245,10,60,50);   // Links onderbeen
  rect(positieX+70,245,10,60,50);   // Rechts onderbeen
}
  if(test == false){
  fill(255,2,2);
  ellipse(positieX,190,115,140);    // Rode lichaam
  rect(positieX-50,230,40,10,50);   // Links bovenbeen
  rect(positieX+50,230,40,10,50);   // Rechts bovenbeen
  rect(positieX-70,245,10,60,50);   // Links onderbeen
  rect(positieX+70,245,10,60,50);   // Rechts onderbeen
}
  
  fill(255);
  ellipse(positieX,160,55,60);     // Witte oog
  
  fill(0);
  noStroke();
  ellipse(positieX,165,30,30);     // Zwarte pupil
  
  fill(255);
  noStroke();
  ellipse(positieX,165,10,10);     // Wit oog in pupil  
  
  stroke(0);
  rect(positieX, 220, 40, 20, 50); // Mond
  
  stroke(0);
  line(positieX-10, 210, positieX-10, 230);         // linkse tand
  line(positieX, 210, positieX, 230);               // Middelste tand
  line(positieX+10, 210, positieX+10, 230);         // Rechtse tand
  line(positieX-20, 220, positieX+20, 220);
  

}
