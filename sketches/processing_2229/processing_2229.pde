
// por Mariana L. Torres - Mayo 2009

PFont font1,font2;
String x = "CAoS";

void setup () {
  size (500,500);
  font1 = loadFont("Chiller-Regular-48.vlw");
  font2 = loadFont ("FLWScript-72.vlw");
  cursor(HAND);
}

void draw (){
  frameRate (20);
  if (mousePressed ==false){
    background (0);
    fill (255);
    textFont(font1);
    text(x, random(-50, 550), random(-20, 520));
    text(x, random(-50, 550), random(-20, 520));
    text(x, random(-50, 550), random(-20, 520));
    text(x, random(-50, 550), random(-20, 520));
  }
  if (mousePressed){
    background (255);
    textFont(font2);
    fill(0);
    textAlign(CENTER);
    text ("Orden", width/2, height/2);
    textSize (26);
    text("el orden es un estado no natural de las cosas", 250, 490);
  }
}


