
int butX = 0;
int butY = 0;
int butX2 = 75;
int butY2 = 25;
boolean paint = false;

void setup() {
  size(1000,1000);
  fill(255);
 
}

void draw() {
  if (paint) {
    {
   stroke(0);
   strokeWeight(5);
   smooth();
   if (mousePressed) {
     line(pmouseX,pmouseY,mouseX,mouseY);
   }
    }
   
  } else {
    background(255);
  }
  fill(255);
  rect(butX,butY,butX2,butY2);
   textSize(10);
  fill(0);
  text("erase",20,20);
}

void mousePressed() {
  if (mouseX > butX && mouseX < butX + butX2 && mouseY > butY && mouseY < butY + butY2) {
    paint = !paint;
    fill(200);
  }
}

void mouseReleased() {
  fill(255);
}

