
void setup(){
size(1080, 720);

PFont coolfont;
coolfont = loadFont("Zapfino-48.vlw");
textFont(coolfont);
textSize(40);

}



void draw(){
  background(0);
String firstText = "Rap God";
fill(random(100, 255), 0, random(100, 255));
textAlign(CENTER, CENTER);
text(firstText, width/2, height/2);
}



