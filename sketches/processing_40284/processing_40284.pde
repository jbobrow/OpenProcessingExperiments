
PFont font;
String c = ("Catch me if you can.");
float x,y;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  background(0);
  font = loadFont("BlairMdITCTT-Medium-48.vlw"); 
  textFont(font, 18); 
  //text positioning
  for (int i = 0; i<c.length()-1;i++) {
    fill(255);
    x = width-mouseX+i*18;
    y =height-mouseY;
if(dist(x,y,mouseX,mouseY)<40){
  x+=random(-60,60);
  y+=random(-60,60);
}
    text(c.charAt(i),x,y);
  }
}


