
int xPos = 75;
int yPos = 75;
int but = 30;

int xtwo = 110;
int ytwo = 75;

void setup() {
  size(800, 600);
  background(82, 51, 10);

  //drawing board
  fill(18, 75, 0);
  rect(200, 0, 600, 600);
  fill(142, 86, 13);
  rect(200, 0, 30, 600);

  //left buttons 
  fill(255, 0, 0);
  rect(xPos, ytwo, but, but);
  fill(255, 255, 0);
  rect(xPos, ytwo+but, but, but);
  fill(0, 185, 255);
  rect(xPos, ytwo+but*2, but, but);
  fill(255);
  rect(xPos, ytwo+but*3, but, but);

  //right buttons 
  fill(255, 3, 230);
  rect(xtwo, yPos, but, but);
  fill(155, 255, 75);
  rect(xtwo, yPos+but, but, but);
  fill(0, 0, 255);
  rect(xtwo, yPos+but*2, but, but);
  fill(150);
  rect(xtwo, yPos+but*3, but, but);

  //Eraser
  fill(20, 44, 0);
  rect(xPos+3, 220, 60, 27, 10);
  fill(150);
  rect(xPos, 220, 65, 5);
  
  //man head
  stroke(255);
  strokeWeight(5);
 noFill();
  ellipse(100,400,100,100);
  //body
  stroke(255);
  strokeWeight(5);
  line(100,450,110,520);
  
  //R hand
    stroke(255);
  strokeWeight(5);
  line(104,480,150,470);
  line(150,470,170,390);
   line(160,380,190,400);
  
  //L hand
      stroke(255);
  strokeWeight(5);
  line(104,480,50,460);
  
  //leg
  stroke(255);
  strokeWeight(5);
  line(80,520,140,520);
  line(80,520,80,560);
  line(140,520,145,560);
  
  //eye
  stroke(255);
  strokeWeight(5);
  line(70,390,90,390);
  line(110,390,130,390);
  arc(100, 420, 20, 20, 0, PI, OPEN);
  
  
}

void draw() {

  if (mousePressed) {


    //left buttons
    //brush 
    if (790 > pmouseX && 790 > mouseX && pmouseX > 240 && mouseX > 240 && 
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }


    //red, 
    if ( mouseX > xPos && mouseX < xPos+but && mouseY > yPos && mouseY <yPos+but) {
      stroke(255, 0, 0);
      strokeWeight(5);
    }
    //yellow
    if ( mouseX > xPos && mouseX < xPos+but && mouseY > yPos+but && mouseY <yPos+but+but) {
      stroke(255, 255, 0);
      strokeWeight(5);
    }

    //sky blue
    if ( mouseX > xPos && mouseX < xPos+but && mouseY > yPos+but+but && mouseY < yPos+but+but+but) {
      stroke(0, 185, 255);
      strokeWeight(5);
    } 
    //white
    if ( mouseX > xPos && mouseX < xPos+but && mouseY > yPos+but+but+but && mouseY < yPos+but+but+but+but) {
      stroke(255);
      strokeWeight(5);
    }

    //pink
    if ( mouseX > xtwo && mouseX < xtwo+but && mouseY > ytwo && mouseY <ytwo+but) {
      stroke(255, 3, 230);
      strokeWeight(5);
    }
    //green
    if ( mouseX > xtwo && mouseX < xtwo+but && mouseY > ytwo+but && mouseY <ytwo+but+but) {
      stroke(155, 255, 75);
      strokeWeight(5);
    }
    //blue
    if ( mouseX > xtwo && mouseX < xtwo+but && mouseY > ytwo+but+but && mouseY <ytwo+but+but+but) {
      stroke(0, 0, 255);
      strokeWeight(5);
    }
    //gray
    if ( mouseX > xtwo && mouseX < xtwo+but && mouseY > ytwo+but+but+but && mouseY <ytwo+but+but+but+but) {
      stroke(150);
      strokeWeight(5);
    }
    //eraser
    if ( mouseX > xPos+3 && mouseX < xPos+3+but && mouseY > 220 && mouseY <220+but) {
      stroke(18, 75, 0);
      strokeWeight(50);
    }
    
    
  }
}



