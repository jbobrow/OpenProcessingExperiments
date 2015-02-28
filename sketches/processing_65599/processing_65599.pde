
// gloable Variable fÃ¼r
// die Ablage der Position
float xpos;
float ypos;
float xpos2;
float ypos2;
float xpos3;
float ypos3;
float xpos4;
float ypos4;
// PositionsÃ¤nderung pro Einzelbild
float xGeschwindigkeit = cos(2000);
float yGeschwindigkeit = sin(200);
float xGeschwindigkeit2 = cos(2000);
float yGeschwindigkeit2 = sin(200);
float xGeschwindigkeit3 = cos(2000);
float yGeschwindigkeit3 = sin(200);
float xGeschwindigkeit4 = cos(2000);
float yGeschwindigkeit4 = sin(200);
// Kreisdurchmesser
float durchmesser = 60;
float durchmesser2 = 70;
float durchmesser3 = 80;
float durchmesser4 = 50;

//Font;
PFont font;
 
void setup () {
  // GrÃ¶ÃŸe des Sketches definieren
  size(600, 400);
  //load Font
  font = loadFont ("MicrosoftYaHei-Bold-13.vlw");
  // aktiviere KantenglÃ¤ttung
  smooth ();
  // Startposition
  xpos = width / 2;
  ypos = height / 2;
  xpos2 = width / 4;
  ypos2 = height / 4;
  xpos3 = width / 8;
  ypos3 = height / 8;
  xpos4 = width / 8;
  ypos4 = height / 8;
}
 
void draw () {
  // Hintergrund leeren
  background (20);
  
  
///////////////Kreis 1//////////////////// 
  // rechter Fensterrand
  if (xpos > width - durchmesser) {
    xGeschwindigkeit = xGeschwindigkeit * -1;
  }
  // linker Fensterrand
  if (xpos < durchmesser) {
    xGeschwindigkeit = xGeschwindigkeit * -1;
  }
  // unterer Fensterrand
  if (ypos > height - durchmesser) {
    yGeschwindigkeit = yGeschwindigkeit * -1;
  }
  // oberer Fensterrand
  if (ypos < durchmesser / 2) {
    yGeschwindigkeit = yGeschwindigkeit * -1;
  }
////////////Kreis 2///////////////////  
  // rechter Fensterrand
  if (xpos2 > width - durchmesser2) {
    xGeschwindigkeit2 = xGeschwindigkeit2 * -1;
  }
  // linker Fensterrand
  if (xpos2 < durchmesser2) {
    xGeschwindigkeit2 = xGeschwindigkeit2 * -1;
  }
  // unterer Fensterrand
  if (ypos2 > height - durchmesser2) {
    yGeschwindigkeit2 = yGeschwindigkeit2 * -1;
  }
  // oberer Fensterrand
  if (ypos2 < durchmesser2 / 2) {
    yGeschwindigkeit2 = yGeschwindigkeit2 * -1;
  }
  
  //////////////Kreis 3/////////////
  
  if (xpos3 > width - durchmesser3) {
    xGeschwindigkeit3 = xGeschwindigkeit3 * -1;
  }
  // linker Fensterrand
  if (xpos3 < durchmesser3) {
    xGeschwindigkeit3 = xGeschwindigkeit3 * -1;
  }
  // unterer Fensterrand
  if (ypos3 > height - durchmesser3) {
    yGeschwindigkeit3 = yGeschwindigkeit3 * -1;
  }
  // oberer Fensterrand
  if (ypos3 < durchmesser3 / 2) {
    yGeschwindigkeit3 = yGeschwindigkeit3 * -1;
  }
  
  /////////////////Kreis 4//////////////////
  
  if (xpos4 > width - durchmesser4) {
    xGeschwindigkeit4 = xGeschwindigkeit4 * -1;
  }
  // linker Fensterrand
  if (xpos4 < durchmesser4) {
    xGeschwindigkeit4 = xGeschwindigkeit4 * -1;
  }
  // unterer Fensterrand
  if (ypos4 > height - durchmesser4) {
    yGeschwindigkeit4 = yGeschwindigkeit4 * -1;
  }
  // oberer Fensterrand
  if (ypos4 < durchmesser4 / 2) {
    yGeschwindigkeit4 = yGeschwindigkeit4 * -1;
  }
   
  // Position modifizieren, 'geschwindigkeit'
  // kann positiv oder negativ sein (siehe: * -1)
  xpos = xpos + xGeschwindigkeit;
  ypos = ypos + yGeschwindigkeit;
  xpos2 = xpos2 + xGeschwindigkeit2;
  ypos2 = ypos2 + yGeschwindigkeit2;
  xpos3 = xpos3 + xGeschwindigkeit3;
  ypos3 = ypos3 + yGeschwindigkeit3;
  xpos4 = xpos4 + xGeschwindigkeit4;
  ypos4 = ypos4 + yGeschwindigkeit4;
  
/////////////Kreis 1///////////////////// 

  if (mouseX > xpos - durchmesser/2 && 
  mouseX < xpos + durchmesser/2 && 
  mouseY > ypos - durchmesser/2 && 
  mouseY < ypos + durchmesser/2) {
    if (mousePressed){
    xpos = mouseX;
    ypos = mouseY;
    durchmesser = durchmesser * 1.99;
    strokeWeight(5);
    stroke(234,213,14, 50);
    line (xpos, ypos, xpos2, ypos2);
    line (xpos3, ypos3, xpos2, ypos2);
    line (xpos3, ypos3, xpos, ypos);
    line (xpos4, ypos4, xpos3, ypos3);
    line (xpos4, ypos4, xpos2, ypos2);
    line (xpos4, ypos4, xpos, ypos);
    fill(0, 50);
    ellipse (xpos, ypos, 70, 70);
    fill(234,213,14);
    textSize (13);
    textLeading (11);
    float xpossB = xpos + 25;
    float ypossB = ypos + 25;
    text ("BACK20 Artist RSC Drum & Bass Soundcloud", 
    xpossB, ypossB, 80, 60);
    }
  if (durchmesser > 150){
  durchmesser = durchmesser / 2;
  }
  }else{
 durchmesser = 60;
 
  } 

/////////////////Kreis 2///////////////
if (mouseX > xpos2 - durchmesser2/2 && 
  mouseX < xpos2 + durchmesser2/2 && 
  mouseY > ypos2 - durchmesser2/2 && 
  mouseY < ypos2 + durchmesser2/2) {
    if (mousePressed){
    xpos2 = mouseX;
    ypos2 = mouseY;
    durchmesser2 = durchmesser2 * 1.99;
    strokeWeight(5);
    stroke(234,213,14, 50);
    line (xpos, ypos, xpos2, ypos2);
    line (xpos2, ypos2, xpos3, ypos3);
    line (xpos, ypos, xpos3, ypos3);
    line (xpos4, ypos4, xpos3, ypos3);
    line (xpos4, ypos4, xpos2, ypos2);
    line (xpos4, ypos4, xpos, ypos);
    fill(0, 50);
    ellipse (xpos2, ypos2, 70, 70);
    }
  if (durchmesser2 > 150){
  durchmesser2 = durchmesser2 / 2;
  }
  }else{
 durchmesser2 = 70;
  }
  
/////////////////Kreis 3 ////////////
if (mouseX > xpos3 - durchmesser3/2 && 
  mouseX < xpos3 + durchmesser3/2 && 
  mouseY > ypos3 - durchmesser3/2 && 
  mouseY < ypos3 + durchmesser3/2) {
    if (mousePressed){
    xpos3 = mouseX;
    ypos3 = mouseY;
    durchmesser3 = durchmesser3 * 1.99;
    strokeWeight(5);
    stroke(234,213,14, 50);
    line (xpos3, ypos3, xpos2, ypos2);
    line (xpos3, ypos3, xpos, ypos);
    line (xpos2, ypos2, xpos, ypos);
    line (xpos4, ypos4, xpos3, ypos3);
    line (xpos4, ypos4, xpos2, ypos2);
    line (xpos4, ypos4, xpos, ypos);
    fill(0, 50);
    ellipse (xpos3, ypos3, 70, 70);
    }
  if (durchmesser3 > 150){
  durchmesser3 = durchmesser3 / 2;
  }
  }else{
 durchmesser3 = 80;
  }
  
  /////////////////Kreis 4///////////////
if (mouseX > xpos4 - durchmesser4/2 && 
  mouseX < xpos4 + durchmesser4/2 && 
  mouseY > ypos4 - durchmesser4/2 && 
  mouseY < ypos4 + durchmesser4/2) {
    if (mousePressed){
    xpos4 = mouseX;
    ypos4 = mouseY;
    durchmesser4 = durchmesser4 * 1.99;
    strokeWeight(5);
    stroke(234,213,14, 50);
    line (xpos, ypos, xpos2, ypos2);
    line (xpos2, ypos2, xpos3, ypos3);
    line (xpos, ypos, xpos3, ypos3);
    line (xpos4, ypos4, xpos3, ypos3);
    line (xpos4, ypos4, xpos2, ypos2);
    line (xpos4, ypos4, xpos, ypos);
    fill(0, 50);
    ellipse (xpos4, ypos4, 70, 70);
    }
  if (durchmesser4 > 150){
  durchmesser4 = durchmesser4 / 2;
  }
  }else{
 durchmesser4 = 50;
  }
  
  
  // Zeichnen des Kreises an die aktuelle Position
  noStroke();
  fill(14,75,152,60); 
  ellipse (xpos, ypos, durchmesser, durchmesser);
  ellipse (xpos2, ypos2, durchmesser2, durchmesser2);
  ellipse (xpos3, ypos3, durchmesser3, durchmesser3);
  ellipse (xpos4, ypos4, durchmesser4, durchmesser4);
  
  strokeWeight(1);
  stroke(234,213,14, 50);
  line (xpos3, ypos3, xpos2, ypos2);
  line (xpos3, ypos3, xpos, ypos);
  line (xpos2, ypos2, xpos, ypos);
  line (xpos4, ypos4, xpos3, ypos3);
  line (xpos4, ypos4, xpos2, ypos2);
  line (xpos4, ypos4, xpos, ypos);
  
 /////////// Home /////////
 noFill();
  ellipse (100, 100, 100, 100);
  ellipse (100, 100, 20, 20);
  
  if (xpos >90 && xpos < 110){
    if (ypos >90 && ypos <110){
    xpos = 100;
    ypos = 100;
    fill(234,213,14);
    textSize (13);
    textLeading (11);
    float xpossB = xpos + 25;
    float ypossB = ypos + 25;
    text ("BACK20 Artist RSC Drum & Bass Soundcloud", 
    xpossB, ypossB, 80, 60);
   }
  }
  
 //////////// ARTIST ////////////////// 
 fill(234,213,14);
 textSize (13);
 textLeading (11);
 float xposs = xpos - 20;
 float yposs = ypos - 20;
 text ("BACK20", xposs, yposs, 30, 60);
 float xposs2 = xpos2 - 20;
 float yposs2 = ypos2 - 20;
 text ("SIGHTER", xposs2, yposs2, 30, 60);
 float xposs3 = xpos3 - 20;
 float yposs3 = ypos3 - 20;
 text ("APHECTOR", xposs3, yposs3, 30, 60);
 float xposs4 = xpos4 - 20;
 float yposs4 = ypos4 - 20;
 text ("GIZEH", xposs4, yposs4, 25, 60);
 
 
 
  println (durchmesser);
}

