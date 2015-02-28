
int rotatingStuff = 0;
color[] colorList;
String[] messages;
void setup() {
  size(600, 600);
  background(64, 113, 132);
  smooth();
  //set up the arrays that hold colors and messages so that i can randomize them later
  colorList = new color[] { color(252,254,224),color(229,156,145), color(157,76,60),color(15,17,28) };
  messages =  new String[] { "I can never think of anything for this class", "everything makes me irrationally angry", "I want to kick everyone in the teeth","everything is SO FRUSTRATING","i have no reason to be complaining anyway", "I can't focus on anything any more!","UUUUUUGH","this project is the very definition of first world problems","this stupid 'programming language' makes me want to destroy everything" };
}

void draw() {
  noStroke();
  fill(64, 113, 132, 20);
  rect(0, 0, width, height);
  fill(229, 156, 145,50);
  //this next chunk of code creates circles that roughly correspond to mouse position, but with some randomness in size
  float mappedX = map(mouseX/2, 0, width, 30, 400);
  float ellipseSize = random(mappedX-50, mappedX+50);
  ellipse(width/2, height/2, ellipseSize, ellipseSize);
  fill(252, 254, 224,100);
  ellipse(width/2, height/2, ellipseSize-40, ellipseSize-40);
  translate(width/2, height/2);
  rotate(rotatingStuff);
  //a whole bunch of for loops rotating around the center, each in different positions, etc.
  for (int i=1; i < 20; i+=1) {
    nope(30, 0);  }
  for (int i=1; i< 80; i+=1){
    cramps(60,0);
    nope(150,90);}
  rotate(rotatingStuff-8);
  for (int i=1; i<100; i+=1){
    ugh(40,0);}
  for (int i=1; i<60;i+=1){
    blargh(50,0);}
  //pick a random color and a random message from the above arrays
  color fillColor = colorList[int(random(colorList.length))];
  String message = messages[int(random(messages.length))];
  textSize(random(10,50));
  textMode(CENTER);
  //now STICK IT SOMEWHERE
  fill(fillColor);
  text(message,random(width),random(height));
  rotatingStuff+=1;
  
  
}

void nope(int xPos, int yPos) {
  fill(15, 17, 28);
  textSize(20);
  text("NOPE", xPos, yPos);
}

void cramps(int xPos, int yPos) {
  fill(17, 70, 82);
  textSize(40);
  text("THE CRAMPS!!!",xPos,yPos);
}

void ugh(int xPos,int yPos){
  fill(157, 76, 70);
  textSize(30);
  text("I HATE EVERYTHING",xPos,yPos-15);
  text("SO MUCH RIGHT NOW",xPos,yPos+15);}
 
void blargh(int xPos, int yPos){
  fill(252,254,224);
  textSize(10);
  text("WHY WON'T THIS IBUPROFEN",xPos,yPos-5);
  text("DO ANYTHING GOD DAMMIT", xPos,yPos+5);}
