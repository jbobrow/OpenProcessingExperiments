
int positieX = 200;
int positieY = 200;
int richting = 5;
int score = 0;
boolean test = false;

void setup () {
  size(500,500);
}

void draw () {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(0);
  
 positieY = positieY + richting;
  
if(positieY > 500 || positieY < 0){
  richting = -richting;
  score = score +1;
}
if(score == 10){
  score = 0;
  test = !test;
}

  
  fill(0);
  stroke(0);
  triangle(positieX+10, positieY-80, positieX+20, positieY-90, positieX+30, positieY-70); // rechte driehoek
  triangle(positieX-30, positieY-70, positieX-20, positieY-90, positieX-10, positieY-80); // linkse driehoek
  
noStroke();
if(test == true){
  fill(550,255,0);
  ellipse(positieX,positieY-10,115,140);    // Geel lichaam
  rect(positieX-50,positieY+30,40,10,50);   // Links bovenbeen
  rect(positieX+50,positieY+30,40,10,50);   // Rechts bovenbeen
  rect(positieX-70,positieY+45,10,60,50);   // Links onderbeen
  rect(positieX+70,positieY+45,10,60,50);   // Rechts onderbeen
}
if(test == false){
  fill(255,2,2);
  ellipse(positieX,positieY-10,115,140);    // Rode lichaam
  rect(positieX-50,positieY+30,40,10,50);   // Links bovenbeen
  rect(positieX+50,positieY+30,40,10,50);   // Rechts bovenbeen
  rect(positieX-70,positieY+45,10,60,50);   // Links onderbeen
  rect(positieX+70,positieY+45,10,60,50);   // Rechts onderbeen
}
  
  fill(255);
  ellipse(positieX,positieY-30,55,60);     // Witte oog
  
  fill(positieX,0,positieY);
  noStroke();
  ellipse(positieX,positieY-25,30,30);     // Zwarte pupil
  
  fill(255);
  noStroke();
  ellipse(positieX,positieY-25,10,10);     // Wit oog in pupil
  
  fill(255);
  stroke(0);
  rect(positieX, positieY+30, 40, 20, 50); // Mond
  

  
  stroke(0);  
  for (int i = 90; i < 110; i = i + 5) {
  if (i == 110){
    i = 90;
  }
  } //tanden
  line(positieX-20, positieY+30, positieX+20, positieY+30);
}
