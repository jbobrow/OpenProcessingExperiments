
String [] myText;
String allWords;
String [] myWords;
ArrayList drops;
PFont fontA;
boolean addDrop = false;
PImage bug;
Bug B1 = new Bug (width/2, height/2, 5, 5);
Bug B2 = new Bug (width/2, height/2, 2, 4);
int tree = 0;

void setup() {
  size(1024, 768);
  myText=loadStrings("wired.txt");
  drops = new ArrayList();
  // Set the font and its size (in units of pixels)
  fontA = loadFont("Verdana-10.vlw");
  textFont(fontA, 10);
  bug = loadImage("bug.GIF");
  allWords = join (myText, " ");
  myWords = splitTokens (allWords, ", ");
  drops.add(new Drop (width/2, 1, int (random(2, 10)), myWords[int (random(0, myWords.length-1))], color (0, 128, 255, 128)));
}

void draw() {
  background(0);
  for (int i = drops.size()-1; i >= 0; i--) {
    Drop drop = (Drop) drops.get(i);
    drop.moveDrop();
    drop.checkCollision();
  }
  if (drops.size() <= 0) {
    drops.add(new Drop (int (random (0, width)), 1, int (random(2, 10)), myWords[int (random(0, myWords.length-1))], color (0, 128, 255, 128)));
  }
  B1.moveBug();
  B2.moveBug();
}


/*void mouseAttraction() {
 B1.speedY=mouseY-B1.yPos mouseX-B1.xPos*7;
 B1.speedX=mouseX-B1.xPos mouseY-B1.yPos*7;
 if (mouseX > B1.xPos) {
 B1.xPos++;
 if (B1.speedX<0) {
 B1.speedX*=-1;
 }
 }
 if (mouseX < B1.xPos) {
 B1.xPos--;
 if (B1.speedX>0) {
 B1.speedX*=-1;
 }
 }
 if (mouseY > B1.yPos) {
 B1.yPos++;
 if (B1.speedY<0) {
 B1.speedY*=-1;
 }
 }
 if (mouseY < B1.yPos) {
 B1.yPos--;
 if (B1.speedY>0) {
 B1.speedY*=-1;
 }
 }
 }*/

void mousePressed() {
  addDrop=true;
  for (int d = drops.size()-1; d >= 0; d--) {
    Drop check = (Drop) drops.get(d);
    if (mouseX - check.xPos <= 25 && mouseY - check.yPos <= 25 && mouseY > check.yPos - 50 && mouseX > check.xPos - 50) {
      //drops.remove(d);
      check.xPos = width/2;
      check.yPos = height-(tree*10);
      check.speed = 0;      
      tree++;
      if (tree*10>height) {
        tree=0;
      }
      addDrop=false;
    }
  }
  if (addDrop==true) {
    drops.add(new Drop (mouseX, mouseY, int (random(2, 10)), myWords[int (random(0, myWords.length-1))], color (0, 128, 255, 128)));
    addDrop=false;
  }
  // mouseAttraction();
}


