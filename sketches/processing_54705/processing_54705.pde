
int x = 72;
float b = 400;
PFont fontA;
  
void setup() 
{
  size(500, 500);
  background(102);
  fontA = loadFont("Musa-Ornata-72.vlw");


}

void draw() {

  textFont(fontA, x);

  stroke(255,255,255);
  fill(100,0,0);
  text("Lupo's", 10, random(1,500));
  fill(0,0,0);
  text("Heartbreak",95, random(1,500));
  fill(200,0,0);
  text("Hotel",300, random(1,500));
  
  stroke(255,255,255);
  fill(255,255,255);
  rect(random(0,500),random(0,500),300,300);


}

void keyPressed(){
  fill(random(255),0,0);
}
//I have no idea what's going on right now...








