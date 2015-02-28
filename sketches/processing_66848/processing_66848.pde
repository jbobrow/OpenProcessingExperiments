

PFont Font01;

void setup() {
   size(500, 500);
   background(255);
 
   Font01 = loadFont("AppleGothic-48.vlw");
}
 
void mouseDragged() {
  {
    background(random(255));
    fill(random(255), random(255), random(255));
    textFont(Font01);
    text("Primadonna Girl,", 20, 70);
    text("Yeah...", 20, 120);
    text("All I ever wanted", 20, 170);
    text("Was the world.", 20, 220);
    text("I can't help that", 20, 270);
    text("I need it all.", 20, 320);
  }
}

void draw() {
    Function();
} 
 
void Function() {
  fill(random(255), mouseX, mouseY);
  rect (450,0,mouseX,mouseY);
  rect (0, 450,mouseX,mouseY);
  rect (450, 450,mouseX,mouseY);
  
}

void keyPressed() {
  if (key == 'c') {
    background(0);
  }   
 
  if (keyCode == UP) {
    textFont(Font01);
    text("Primadonna life,", 20, 370);
  }
  if (keyCode == DOWN) {
   textFont(Font01);
   text("The rise and fall...", 20, 420);
  }
}

    
 



