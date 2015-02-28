
int monsterX;  
int richting;  
int score; 
boolean test;
PImage landscape;
PImage landscape2;
PImage landscape3;



void setup() {
  size(500, 500);
  monsterX = 250;
  richting =79;
  score = 0;
  test = false;
  landscape = loadImage("test1.png");
  landscape2 = loadImage("test2.png");
  landscape3 = loadImage("test3.png");
  smooth();
}
  
  
void draw() {
  
  if (test == false){
  fill(57, 199, 204);
  background(landscape2);

  }
  
  if (test == true){
  fill(138,138,138);
  background(landscape);

  }
  
  
  
    noStroke();
  rectMode(CENTER);
  rect(monsterX, mouseY, 60, 100);
  
    noStroke();
  rectMode(CENTER);
  rect(monsterX-10, mouseY+50, 5, 25);
  
    noStroke();
  rectMode(CENTER);
  rect(monsterX+10, mouseY+50, 5, 25);
  
  

 
   stroke(180);
  fill(255);
  rectMode(CENTER);
  rect(monsterX-10, mouseY-20, 20, 20);
  
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(monsterX-10,mouseY-20, 10, 10);
  
   stroke(180);
  fill(255);
  rectMode(CENTER);
  rect(monsterX+10, mouseY-20, 20, 20);
  
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(monsterX+10,mouseY-20, 10, 10);
  
   
  stroke(0);
  fill(50);
  rectMode(CENTER);
  rect(monsterX, mouseY+20, 30, 22);
       monsterX = monsterX + richting;
  
  
  
  if (monsterX > 500 || monsterX < 0) {
    richting = -richting;
    score= score+1;
    println(test);
    println(score);
  }
  if (score == 10) {
    score = 0;
    test = !test;
    
    
  }
  
   text(score, 250, 250);
  textSize(50);
}



