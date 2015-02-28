
int x = 5;
float b = 3;
PFont sara;

void setup(){
  size(1023,768);
  background(1,18,1);
  size(800,600);
  sara = loadFont("Zapfino-90.vlw");
}

void draw(){
  fill(0,(b + 18) / 4,b / 6);
  textFont(sara);
  textSize(b);
  text("GIOVANNI DA VERRAZZANO",-70,b * 2);
}

void keyPressed(){
  b = b + 2;

}

