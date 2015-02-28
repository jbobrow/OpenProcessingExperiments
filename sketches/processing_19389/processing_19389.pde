
PFont L;
PFont five;

void setup() {
  size(250,250);
  L = loadFont("ACaslon-Regular-100.vlw"); //fonts used
  five = loadFont("Futura-Bold-160.vlw");
  smooth();
  frameRate(1); //slow frame rate so background changes in intervals
}
void draw() {
  background(random(200,255)); //background changes from random shades of light gray - white
  fill(0,100); //semi-opaque letters
  
  textFont(L);
  text("L",20,100);
  
  textFont(five);
  text("5",23,160);
  
  textFont(L);
  text("C",45,112);
  
  textFont(five,80);
  text("1",120,180);
  
  textFont(L,97);
  text("W",130,178);
  
  textFont(five,120);
  text("5",180,200);
}

