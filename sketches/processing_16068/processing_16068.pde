
PFont font;

void setup (){
  size (800,600);
  font = loadFont ("Bauhaus93-72.vlw");
  textFont (font);
}
void draw (){
  background (0,0,0);
  fill (255);
 // text ("Nada de nada...", 0, 100, mouseX, 500);
  // text ("Nada de nada...", 0, 100, mouseY, 500);
    text ("Nada de nada...", 25, 100, 500);
     text ("Es todo,", 25, 200,  500);
      text ("Así es como te quiero,", 25, 300,  500);
       text ("Nada, del todo,", 25, 400, 500);
        text ("para nada.", 25, 500, 500);
}
  

