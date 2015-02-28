
pixelText pxlTxt;
textBox txtBx;
boolean part1=true, part2=false;
String keysEntered="";
PFont font;

void setup() {
  size(1000, 650);
  background(#f10909);
  fill(#890E0E);
  stroke(#890E0E);
  frameRate(10);
  font = loadFont("GillSans-100.vlw");
  textFont(font);
  txtBx = new textBox(100, 100, "type something");
}


void draw() {
  if(part1==true) {
    txtBx.display();
  } 
  else {
    background(#f10909);
    pxlTxt.display();
    pxlTxt.addPixels();
  }
}

void keyPressed() {
  if (key==RETURN || key==ENTER) {
    background(#f10909);
    part1=false;
    pxlTxt=new pixelText(keysEntered, 4, 30, 5);
    pxlTxt.createCoords();
  }
  else if(part1==true) {
    keysEntered=keysEntered+str(key);
  }
}



