
PFont font;

float v5b1z9 = 135;
float fr = 15; //frame rate variable starts at 15

void setup() {
  size(250, 250);
  font = loadFont("Agenda-Bold-60.vlw"); //agenda 48
  smooth();
}

void draw() {
  background(235);
  noFill();
  textFont(font);
  frameRate(fr);
 

//V5B1Z9
//V
  fill(#5E412F, v5b1z9); 
  text("V", random(250), v5b1z9);
  fill(#78C0A8, v5b1z9);
  text("V", random(250), v5b1z9);
  fill(#F07818, v5b1z9);
  text("V", random(250), v5b1z9);
  fill(#F0A830, v5b1z9); 
  text("V", random(250), v5b1z9);
//5  
  fill(#5E412F, v5b1z9); 
  text("5", random(250), v5b1z9);
  fill(#78C0A8, v5b1z9);
  text("5", random(250), v5b1z9);
  fill(#F07818, v5b1z9);
  text("5", random(250), v5b1z9);
  fill(#F0A830, v5b1z9); 
  text("5", random(250), v5b1z9);
//B
  fill(#5E412F, v5b1z9); 
  text("B", random(250), v5b1z9);
  fill(#78C0A8, v5b1z9);
  text("B", random(250), v5b1z9);
  fill(#F07818, v5b1z9);
  text("B", random(250), v5b1z9);
  fill(#F0A830, v5b1z9); 
  text("B", random(250), v5b1z9);
//1
  fill(#5E412F, v5b1z9); 
  text("1", random(250), v5b1z9);
  fill(#78C0A8, v5b1z9);
  text("1", random(250), v5b1z9);
  fill(#F07818, v5b1z9);
  text("1", random(250), v5b1z9);
  fill(#F0A830, v5b1z9); 
  text("1", random(250), v5b1z9);
//Z
  fill(#033639, v5b1z9); 
  text("Z", random(250), v5b1z9);
  fill(#22A99A, v5b1z9);
  text("Z", random(250), v5b1z9);
  fill(#44BFAB, v5b1z9);
  text("Z", random(250), v5b1z9);
  fill(#F0A830, v5b1z9); 
  text("Z", random(250), v5b1z9);
//9
  fill(#5E412F, v5b1z9); 
  text("9", random(250), v5b1z9);
  fill(#78C0A8, v5b1z9);
  text("9", random(250), v5b1z9);
  fill(#F07818, v5b1z9);
  text("9", random(250), v5b1z9);
  fill(#F0A830, v5b1z9); 
  text("9", random(250), v5b1z9);

}

void mousePressed (){
  fr += 150;
  }
void mouseReleased(){
  fr = 15;
}
  

