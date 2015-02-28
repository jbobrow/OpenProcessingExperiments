
PFont fontA;
int letter = 255;

void setup(){
  size(600, 400);
  //background(0);
  smooth();
  fontA = loadFont("AmericanTypewriter-CondensedBold-36.vlw");
  textAlign(CENTER);
  textFont(fontA, 40);
  //noLoop();
}

void draw() {
  background(0);
  fill(255);
  stroke(110);
  line(25, 50, 75, 50); //this line
  line(85, 50, 135, 50); //this line
  line(145, 50, 195, 50); //this line
  line(205, 50, 255, 50); //this line
  
  line(305, 50, 355, 50); //took line
  line(365, 50, 415, 50); //took line
  line(425, 50, 475, 50); //took line
  line(485, 50, 535, 50); //took line
  
  line(55, 150, 105, 150); //a line
  
  line(155, 150, 205, 150); //really line
  line(215, 150, 265, 150); //really line
  line(275, 150, 325, 150); //really line
  line(335, 150, 385, 150); //really line
  line(395, 150, 445, 150); //really line
  line(455, 150, 505, 150); //really line
  
  line(25, 250, 75, 250); //long line
  line(85, 250, 135, 250); //long line
  line(145, 250, 195, 250); //long line
  line(205, 250, 255, 250); //long line
  
  line(305, 250, 355, 250); //time line
  line(365, 250, 415, 250); //time line
  line(425, 250, 475, 250); //time line
  line(485, 250, 535, 250); //time line
  
  if(keyPressed){
    if (key == 't'){
        noFill();
        text("t", 50, 38);
        text("t", 330, 38);
        text("t", 330, 238);}
    if (key == 'h'){
        noFill();
        text("h", 110, 38);}
    if (key == 'i'){
        noFill();
        text("i", 170, 38);
        text("i", 390, 238);}
    if (key == 's'){
        noFill();
        text("s", 230, 38);}
    if (key == 'o'){
        noFill();
        text("o", 390, 38);
        text("o", 450, 38);
        text("o", 110, 238);}
    if (key == 'k'){
        noFill();
        text("k", 510, 38);}
    if (key == 'a'){
        noFill();
        text("a", 80, 138);
        text("a", 300, 138);}
    if (key == 'r'){
        noFill();
        text("r", 180, 138);}
    if (key == 'e'){
        noFill();
        text("e", 240, 138);
        text("e", 510, 238);}
    if (key == 'l'){
        noFill();
        text("l", 360, 138);
        text("l", 420, 138);
        text("l", 50, 238);}
    if (key == 'y'){
        noFill();
        text("y", 480, 138);}
    if (key == 'n'){
        noFill();
        text("n", 170, 238);}
    if (key == 'g'){
        noFill();
        text("g", 230, 238);}
    if (key == 'm'){
        noFill();
        text("m", 450, 238);}
  
      
   if (keyPressed == true) {
   letter = 255;
    } 
  else {
    letter = 0;
  }
 }
}

//void keyPressed() {
  //if (letter == 0) {
    //letter = 255;
  //} else {
    //letter = 0;
  //}
//}

void keyReleased() {
  if (letter == 255) {
    letter = 0;
  } else {
    letter = 255;
  }
}

