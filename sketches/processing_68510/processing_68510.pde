
int varx=int(random(20,380));
 int vary=int(random(100,380));
 float timer = 0;
String timerdisplay = "0";
 
void setup() {
  size(400, 400);
  frameRate(50);
}

void draw() {

  background (125,125,125);

// increment and display timer
  timer=timer+.02;
  fill(0,234,400);
  textSize(30);
  fill(104,234,40);
  timerdisplay=nf(timer,2,2);
  text(timerdisplay,25,350);

// instructions
  textSize(15);
  text("Click Mouse when nose is in place",80,20);
  text("Press Return when mouse is over the centre",40,45);
  text("Use Arrow Keys to move the nose",85,70);
  fill(125,125,125);
  
// body
  triangle(100, 410, 200, 200, 300, 410);

// face
  ellipse(200, 180, 191, 200);

// hands
  ellipse(100, 300, 42, 42);
  ellipse(300, 300, 42, 42);

// mouth
  line(183, 246, 245, 230);

// glasses frames
  line(107, 163, 292, 163);

// glasses lenses    
  rect(132, 152, 50, 38);
   rect(215, 152, 50, 38);
  

// nose  
  fill(255,0,0);
  ellipse(varx,vary,30,30);
  fill(125,125,125);

}


// check nose position when mouse clicked
  void mousePressed() {
      if (varx > 195 && (varx < 205) && (vary > 195) && (vary < 205)) {
        fill(234,40,40);
        textSize(50);
        text("You Win", 100, 180);
        textSize(20);
        text("Press Space to Continue",90,380);
        fill(125,125,125);
        noLoop();
      }
      else {
        fill(234,40,40);
        textSize(50);
        text("You Lose", 95, 180);
        textSize(20);
        text("Press Space to Continue",90,380);
        fill(125,125,125);
        noLoop();
      }
}


// respond to keyboard inputs
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {varx = varx - 2; } 
      else if (keyCode == RIGHT) {varx = varx + 2; }
      else if (keyCode == UP) {vary = vary - 2; }
      else if (keyCode == DOWN) {vary = vary + 2; }
     }
// restart the drawing loop after noloop instruction.     
    if (key == ' ') {loop();}
    if (key == ENTER) {shooting();}
  }

// Check Mouse Position when 'Return' is pressed      
void shooting(){
  if (mouseX > 190 && (mouseX < 210) && (mouseY > 190) && (mouseY < 210)) {
        fill(234,40,40);
        textSize(50);
        text("Good Shot", 90, 180);
        textSize(20);
        text("Press Space to Continue",90,380);
        fill(125,125,125);
        noLoop();
      }
      else {
        fill(234,40,40);
        textSize(50);
        text("Oh Dear", 98, 180);
        textSize(20);
        text("Press Space to Continue",90,380);
        fill(125,125,125);
        noLoop();
      }
}
