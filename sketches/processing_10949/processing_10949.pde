
Pou myPour;

void setup() {
 size(500, 500);
 smooth();
 myPour = new Pou(); 
}

void draw()  {
  fill(255, 10);
  rect(0, 0, width, height); 
  myPour.grow();

}

class Pou {

  void grow() {
    
    float x = mouseX + random(2);
    float y = mouseY;
    noStroke();
    float dia = random(2 + random(5), 5);
    fill(mouseY/2);
    ellipse(x + random(-2, 4), y, dia, dia);
  }
  
}



