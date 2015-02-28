
int x = 72;
float b = 400;
PFont fontA;
  
void setup() 
{
  size(600, 500);
  background(102);
  fontA = loadFont("Impact-48.vlw");


  textFont(fontA, 120);

}

void draw() {
  
  textFont(fontA, x);

  fill(0);
  text("Intermodal", 20, random(1,500));
  fill(51);
  text("Transporatation",95, random(1,500));
  fill(204);
  text("Center",300, random(1,500));
  fill(255);
  text("Kennedy Plaza",100,100,0);
}

void keyPressed(){
  fill(random(255),0,0);
}
 //mioivbsdkjdhvcbkajshbvckjhvasdkajcvkjhdsvb








