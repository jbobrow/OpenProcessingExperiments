
//super groovy!!!
PFont talkFont;
PFont elseFont;
//boolean mouseOnRight=false;//

PImage soup = loadImage("soup.JPG");

PFont myFont;
int fontPosY = 40;

//mouse can pickup color from any point of the image
void setup() {
  size(370, 370);
  talkFont = loadFont("SansSerif-30.vlw");
  elseFont = loadFont("Antipasto-30.vlw");
  
  String[] fontList = PFont.list();
  println(fontList);
  
  myFont = createFont("HelveticaNeue", 24, true);
  textFont(myFont);    
  fill(255, 0, 255);
  text("Tortilla Soup", 20, fontPosY);
  fill(255, 0, 255);
  text("silly words", 20, fontPosY + 30);
  
}

void draw() {
PImage myImage = loadImage("soup.JPG");
imageMode(CENTER);
image(myImage, width/2, height/2);

color getColor = myImage.get(mouseX, mouseY); 
noStroke();
fill(getColor);

rectMode(CENTER);
rect(width/2, 40, myImage.width, 20); 
//myImage.width (of "my image") 20 (size)
//font

if (mouseX > 100 && mouseX < 100 && mouseY < 100 && mouseY > 100) {
   image(soup, width/2, height/2);
 
   fill(0);
   textFont(talkFont);
   text("Tortilla Soup!!!", 50, 50);
   PImage soup = loadImage("soup.JPG");
   image(soup, width/2, height/2);
  
  }
  
 else {
   fill(255);
   textFont(elseFont);
   text("Yummy!", 50, 50);
   //text("eat up." 100, 100);//
 }
}






