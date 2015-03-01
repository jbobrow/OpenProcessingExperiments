
PFont font;
PImage img;

void setup() {
  size(900,680 );
  font = loadFont("Zapfino-48.vlw");
  textFont(font);
      img = loadImage("http://anotherbestday.com/wp-content/uploads/2014/06/coffee-beans-forming-world-map-on-burlap-adam-gault.jpg");
  image(img, 0, 0);
  background(#C4AE8A);
}  

void draw() {
  if (mousePressed){
    fill(#623513);
  String ant = "Cafe&Coffe";
  for (int y=0; y<30; y++) {
    textSize(random(10, 35));
    text(ant.substring((int)random(0, 9)), random(0, width), random(0, height));
  }
  }
}
