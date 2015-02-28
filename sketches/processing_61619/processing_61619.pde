
//Diana Chen
//cdiana@cmu.edu

PFont f;

void setup() {
size(500,400);
background(59, 89, 152);
fill(255);

frameRate(1.5);
}
 
void draw() {
  background(59, 89, 152);
  String []first = {
  "Like", "Msg", "Poke"
};

  
  f = loadFont("Helvetica-70.vlw");
 textSize(70);
int a = int(random(3));
 
text( first[a], 30,160);
text( "Me", 220,160);
}
 
void keyPressed() {
    saveFrame();
  }



