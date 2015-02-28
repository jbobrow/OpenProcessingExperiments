
String myTexts[] = new String[5];
/*To use a font in Processing, we need to follow a few steps
1. We pick and add a font from the Tools menu > Create font
2. then we create a font object (ex: myFont) from the PFont class*/
PFont myFont;
PFont helvy;
void setup(){
  frameRate(2);
  myTexts[0]="Ads are the cave art of the twentieth century.";
  myTexts[1]="Diaper backward spells repaid. Think about it.";
  myTexts[2]="I don't necessarily agree with everything I say.";
  myTexts[3]="Art is anything you can get away with.";
  myTexts[4]="We drive into the future using only our rearview mirror.";
  size(500,500);
  //3. We associate the font file to the font object
  myFont = loadFont("GillSans-LightItalic-100.vlw");
  helvy = loadFont("Helvetica-100.vlw");
  //4. We tell processing that we'll be using that font from now on with textFont()
}

void draw(){
  background(255);
  fill(0,0,255);
  textFont(myFont);
  textSize(50);
  textAlign(CENTER);
  //text("McLuhan",random(300),random(400,450));
  text("McLuhan",width/2,random(400,450));
  //now we can draw the text on the screen, change its size, color etc
  fill(255,0,255);
  textFont(helvy);
  //use text size after textFont
  textSize(50);
  textAlign(LEFT);
  //int() converts a float to int by removing its decimals (floor) ex 1.6->1
  int textNumber = int(random(myTexts.length));
  //the length (size, number of items) of an array is obtained with .length
  //text, the parameters: (any text, x, y) or (any text, x, y, width, height),
  //where width and height represent the width and height of the text "box"
  text(myTexts[textNumber],random(200),random(100), 300,height);
}


