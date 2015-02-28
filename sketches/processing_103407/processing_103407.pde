
PFont font;
int counter;
String greeting = "Happy Birthday!";

void setup() {  
  size(500, 500);
  background(55, 78, 84);  //set background color (some gray? green?)
  noStroke();
  counter = 0;
  font = loadFont ("Arial-Black-20.vlw");
  textFont (font);
}

void draw() {  
 
  //display a psicodelic greeting  
  fill(random(255), 110, 55, 20);
  text(greeting, mouseX, mouseY, mouseX, mouseY);
 
 /*-->draw the candle<--*/
  //candle
  fill(243, 229, 245);
  rect(width/2, 85, 2, 25);
  fill (110, 191, 255);
  rect(240, 110, 20, 90);
  //FX
  counter++;
  fill(random(255), 90, 155, 80);
      if (mousePressed == true) { //light the candle
    ellipse(width/2, 80, 60*sin(counter), 60*sin(counter));
  } 
        /*-->draw the cake<--*/
  //base
  fill(137, 91, 63);
  rect(150, 200, 200, 100, 7, 7, 0, 0);
  rect(100, 300, 300, 100, 7, 7, 0, 0);
  rect(50, 400, 400, 100, 7, 7, 0, 0);
  //cover
  fill(66, 39, 30);
  rect(150, 200, 200, 30, 7, 7, 0, 0);
  rect(100, 300, 300, 30, 7, 7, 0, 0);
  rect(50, 400, 400, 30, 7, 7, 0, 0);
  
  }
