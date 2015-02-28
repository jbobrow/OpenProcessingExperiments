
PFont font; //nombro la tipografia (paso 2)
PImage nana;
void setup() {
size(737, 500);
smooth();
font = loadFont("Bauhaus93-48.vlw"); //cargo la tipografia que estaba en DATA (paso3)
nana = loadImage("IMAGE.jpg");
textFont(font);//comienzo a usar la tipografia (paso4)
}
void draw() {
background (nana);

fill (0);
textSize(36);
text("black", 25, 350); //escribo
fill (250);
textSize(36);
text("whitee", 25, 390); //escribo
fill (199,236,87);
textSize(36);
text("be yourself", 300, 410); //escribo
textSize(36);
text("day by day", 400, 450); //escribo

}

