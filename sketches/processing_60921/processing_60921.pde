
PFont f;

void setup() {
size(500,400);
background(59, 89, 152);
fill(255);

frameRate(1);
}
 
void draw() {
  background(59, 89, 152);
  String []first = {
  "Like", "Love", "Hold", "Poke"
};

  
  f = loadFont("Helvetica-70.vlw");
 
int a = int(random(4));
 
textSize(75);
 
text( first[a], 30,160);
text( "Me", 220,160);
}
 
void keyPressed() {
    saveFrame();
  }



