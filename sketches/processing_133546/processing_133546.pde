
int squaresCounter=0;

void setup() {
  background(255);
  size(700, 700);
 // frameRate(100);
}

void draw() {
  smooth();
  if(squaresCounter>8000){
    println("!!!!!!!!!!!!!!!!!!!");
    writeText();
  }
}

void writeText(){
  PFont helvetica;
      stroke(255);
      helvetica= createFont("Helvetica", 50);

      textMode(CENTER);
      textFont(helvetica);
      text("Too many squares!", 20, height/2);
    }

void mouseMoved() {
  stroke(0, 50);
  fill(0,5);
 
      for (int i=0;i<60;i++) {
      float myAngle=random(-90, 90);
      rotate(radians(myAngle));
      float rectSize=map (i*random(-2,2), 1, 200, 2, 100);
      rect(mouseX*random(-3,3), mouseY, rectSize, rectSize);
      translate(0, 10);
      squaresCounter +=1;
    }
  }




