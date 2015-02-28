
String phrase = "Catch me";
String phrase1 = "if you can";
float x,y;

/* @pjs font="Apercu-Bold.ttf"; */

void setup () {
  textFont(createFont("Apercu-Bold.ttf",48));  
  background(0);
  size(640, 480);
  smooth();
}

void draw () {
  background(222);
  translate(mouseX,mouseY);
  fill(#FF0000);
    textSize(48);
    text("Catch me", x,y); 
    
  if(mousePressed) {
    if (mouseButton == LEFT ) {
    fill(#0046FF);
    textSize(48);
    text("if you can",mouseX,pmouseY);
    x = random(-100,2);
    y = random(-100,100);
    
    }
    }
    }


