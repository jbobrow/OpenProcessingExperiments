
void setup()
{
  size(600,400); 
  background(90);
}

void draw() {
}

void mousePressed() {
  drawsquare(mouseX,mouseY);
}

void drawsquare(int x,int y) {
  translate(x,y);
  for (int i=0; i<= 50; i=i+10) {
    for (int j=0; j<= 50; j=j+10) {

      noStroke();
      fill(random(255),random(255),random(255),45);

      rotate(PI/random(3)); 
      rect(random(i),random(j),random(80),random(80));
    }
  }
}

void keyPressed(){
  background(90);
}

