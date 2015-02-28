
//int font etc. area
PFont gill;
PImage market;
int topBtn; //this is for the top row of btns on top 
int topBar; //this is for the top bar height and the location of the btn in it as well spacing
int fontPosY; //this is for setting line height between text and images

//void setup area
void setup() {
  size(800, 600);
  background(97, 97, 97);

  //top bar
  topBtn=12;
  topBar=32;

  //font
  fontPosY=88;
  gill=loadFont("GillSans-48.vlw");

  //picture
  imageMode(CENTER);
  market=loadImage("market.jpg");
}

//void draw area
void draw() {
  smooth();
  noStroke();

  //top bar 
  fill(160, 160, 160);
  rect(0, 0, width, topBar);

  //red btn gui - fill color is set 
  fill(216, 37, 37);
  ellipse(topBtn, topBar/2, topBtn, topBtn);
  // if the mouse is over the button fill color is changed
  if (mouseX > topBtn && mouseX < topBtn*2 && mouseY > topBtn && mouseY < topBtn*2) {
    fill(162, 28, 28);
    ellipse(topBtn, topBar/2, topBtn, topBtn);
  } 

  //yellow btn gui - fill color is set
  fill(255, 198, 8);
  ellipse(topBtn*2.5, topBar/2, topBtn, topBtn);
  // if the mouse is over the button fill color is changed
  if (mouseX > topBtn*2.5 && mouseX < topBtn*4 && mouseY > topBtn && mouseY < topBtn*2) {
    fill(178, 138, 5);
    ellipse(topBtn*2.5, topBar/2, topBtn, topBtn);
  } 

  //grey btn gui - fill color is set 
  fill(232, 240, 230);
  ellipse(topBtn*4, topBar/2, topBtn, topBtn);
  //if the mouse is over the button fill color is changed
  if (mouseX > topBtn*4 && mouseX < topBtn*5 && mouseY > topBtn && mouseY < topBtn*2) {
    fill(182, 188, 180);
    ellipse(topBtn*4, topBar/2, topBtn, topBtn);
  } 

  //this is the title area
  fill(255);
  textFont(gill, 32); //font name and then font size
  text("Union Square Farmers Market", topBtn, fontPosY);  

  //pictures area
  image(market, width/2, fontPosY*4, 600, 450);
}



