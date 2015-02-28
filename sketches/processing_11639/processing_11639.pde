
float x = random(100, 800);
float y = random(100, 350);

void setup() {
  size (900,450);
}

void draw() {
  stroke(mouseY+50,180,mouseX-300);
  strokeWeight(5);
     line(mouseX,mouseY,450,225);
   frameRate(1000);  

  stroke(0);
  strokeWeight(50);
   noFill();
   rect(0,0,900,450);
}



void mouseClicked() {
    PFont font;
   font = loadFont("Rockwell-Bold-48.vlw");
   textFont (font, 48);
   text("Hello", x, y);   
   }
   
  

