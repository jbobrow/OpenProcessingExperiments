
PImage yyy;
float speed = 2.0;
float move;

void setup() {

size(400,400); 
yyy=loadImage("http://www.helpinghomelesscats.com/images/cat.jpg");
}
void draw(){
move=move+speed;
//background(random(0,100),random(50,200),random(0,255));
image(yyy,40,move);
if (move > 200) {
move=0;
}
}

// Transcription of program arabesque
// originally prepared by Paul Rother for John Whitney for the book "Digital Harmony"
// ported to the Processing language by Jim Bumgardner
  

