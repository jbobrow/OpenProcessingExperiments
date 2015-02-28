
PFont font;
String txt = "Trentatré trentini entrarono a Trento, tutti e trentatré trotterellando.";
int mov = 0;

void setup () {
  size (400, 400);
  font = loadFont("BaskOldFace-35.vlw");
  textFont(font);
  smooth();
  background (255,255,70,50);
}

void draw() {
  //background (150,250,120, 20);

  
  textSize(30);
  // text(string, x, y, width, height);
  fill(255,255,0, 200);

  //textLeading(50);
  text(txt, -mov +400, -mov/10 + 200);
  mov = mov + 3;
  if(mov >= 1200){
    mov = 0;
  background (255,255,70,50);
  }
  
    fill(0);
    text(txt, -mov +400, -mov/10 + 200);

}


