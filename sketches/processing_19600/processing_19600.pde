
PFont bob, kelly;
String AJ2 = "L6A 1J3";
String[] AJ = {
  "L", "6", "A", "1", "J", "3"};
int counter = 0;
 
float X, Y;
void setup() {
  size(250,250);
  background(0,75,200);
  smooth();
  bob = createFont("Capitals", 50);
  kelly = createFont("Helvetica",50);
}

void draw() {
  
  if (mousePressed) {
    textFont(bob);
    fill(random(200),random(75),random(0));
    text(AJ2,mouseX,mouseY);
 
  }
 X = random(width);
 Y = random(height);
     textFont(kelly);
    fill(0,75,200);
    text(AJ[counter],X,Y);
      if(counter<AJ.length-1){
      counter++;
}
}

