
void setup() {
size(500,500);
background(96, 255, 160);
}
void draw() {
ellipse(250,240,150,150);
fill(255, 0, 0);
if((mouseX>200)&&(mouseY>200)&&(mouseX<320)&&(mouseY<330)){
fill(0 ,0 ,0);
 }
PFont font;
font = loadFont("LetterGothicStd-32.vlw");
textFont(font, 40);
text("Hello", 200, 240);
PFont font;
font = loadFont("LetterGothicStd-32.vlw");
textFont(font, 36);
text("Swipe the circle for a message", 10, 40);

}
 

