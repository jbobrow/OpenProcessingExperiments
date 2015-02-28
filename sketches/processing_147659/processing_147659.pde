
//Based on P_4_0_01.pde of http://www.generative-gestaltung.de
/**
* draw a grid of streched copies of an image 
* 
* MOUSE
* position x : tile count horizontally
* position y : tile count vertically
* 
* KEYS
* s : save png
*/
import java.util.Calendar;
PImage img;
void setup(){
size(600, 800);
img = loadImage("1_Droste-Cacao.png");
}
void draw(){
float tileCountX = mouseX/50+1;
float tileCountY = mouseY/150+1;
float stepX = width/tileCountX;
float stepY = height/tileCountY;
for (float gridY = 0; gridY < height; gridY += stepY){
for (float gridX = 0; gridX < width; gridX += stepX){
image(img, gridX, gridY, stepX, stepY);
}
}
}
void keyReleased(){
if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}
// timestamp
String timestamp() {
Calendar now = Calendar.getInstance();
return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

