
//Creates Bokeh effect and types out quote.
//click mouse to begin blurring
//click mouse again to change brush size randomly
// press "s" to save the image.

PImage  bg;
PFont font;
float s;
int counter=0;
int x=30;
int y=250;
int loc =0;
String inputText = "Looking at my shoes, I think I'm tired. Lets go home and get some rest eh? It's getting late anyways.so ttyl";

void setup() {
  size(723,480);
  bg=loadImage("8.jpg"); 
  background(bg);
  smooth();
  font = createFont("Georgia-Italic",11);
}

void draw(){
  if(pmouseX>0){
    if(0 < mouseX && mouseX < width && 0 < mouseY && mouseY < height){
      loc = mouseX +mouseY*bg.width;
    }
    // Look up the RGB color in the source image
    loadPixels();
    float r = red(bg.pixels[loc]);
    float g = green(bg.pixels[loc]);
    float b = blue(bg.pixels[loc]);

    noStroke();
    fill(r,g,b,50);
    if(mousePressed){
      s = random(100);
    }
    //leaf shape
    ellipse(mouseX,mouseY,s,s);
  }
  
}

void keyPressed(){
  if(key == ENTER){
    background(bg); 
    x=50;
    counter=0;
  }
}

void keyReleased() {
  //if (key == 's' || key == 'S') saveFrame("output"+"_##.png");
}

void keyTyped(){
  if(counter<inputText.length() && key != ENTER){
  char letter = inputText.charAt(counter);
  fill(255);
  textFont(font);
  text(letter, x, y);
  counter++;
  x = x + (int)textWidth(letter);
  }
}


