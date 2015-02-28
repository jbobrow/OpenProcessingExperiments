
boolean pageStarted = false;
boolean isClicked = false;
boolean levelOneBeat = false;
boolean levelTwoBeat = false;
boolean levelThreeBeat = false;

void setup(){
  size(800,600);
  background(60);
  frameRate(30);
}
void draw() {
  if(!pageStarted) {
    //Start Page
    background(0,255,255);
    fill(0,0,0);
    textSize(40);
    text("Welcome to the Not Scary Maze Game!" , 25, 150);
    text("4 Levels Total!" , 250, 250);
    textSize(20);
    text("Note: Turn volume to max for the best gaming experience" , 150, 350);
    rect(30,500,150,60);
    fill(255,255,255);
    textSize(45);
    text("Start" , 50, 550);
    if ( mouseX > 30 && mouseX < 180 && mouseY > 500 && mouseY < 560 ) {
    if (mousePressed && (mouseButton == LEFT)) {
      pageStarted = true;
    }
  } 
  } else if (pageStarted = true) {
      noCursor();
    //LevelOne
      background(60);
      fill(0,255,255);
      stroke(0);
      ellipse(mouseX,mouseY,10,10);
      fill(0,0,0);
      rect(0, 0, 700, 200);
      rect(200, 300, 600, 300);
      rect(0, 200, 50, 400);
      rect(750, 0, 50, 400);
      fill(0,255,255);
      rect(700,0,50,30);
      if ( mouseX > 750 || (mouseX < 700 && mouseY < 200) || mouseX < 50 || ( mouseX > 200 && mouseY > 300) ) {
        pageStarted = false;
        cursor();
       }
      if ( mouseX > 700 && mouseX < 750 && mouseY < 30 ) {
        levelOneBeat = true;
      }

   }
      if ( levelOneBeat != false ) {
        //LevelTwo 
        background(60);
        fill(0,255,255);
        stroke(0);
        ellipse(mouseX,mouseY,10,10);
        fill(0,0,0);
        rect(0, 0, 20, 600);
        rect(750, 0, 50, 530);
        rect(0,0,700,20);
        rect(50,60,700,50);
        rect(0,130,730,50);
        rect(50,200,700,50);
        rect(0,270,730,50);
        rect(50,340,700,50);
        rect(0,410,730,50);
        rect(50,480,700,50);
        rect(0,550,800,50);
        fill(0,255,255);
        rect(770,530,30,20);
      }

}  



