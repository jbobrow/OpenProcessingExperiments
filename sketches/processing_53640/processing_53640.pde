

  color a = color (250, 255, 3);
  color b = color (69, 153, 252);
  color c = color (25, 247, 52);
  color d = color (250, 10, 30);
 
  float level = 5;
  int score = 0;
  
  targetYellow t1 = new targetYellow (level);
  targetBlue t2 = new targetBlue (level);
  targetGreen t3 = new targetGreen (level);
  targetRed t4 = new targetRed (level);

void setup() {
  
  size (1000, 900);
  smooth();
  stroke(0);
}

void draw() {
  background (255);
  
  PFont font;
  font = loadFont("EngraversMT-20.vlw"); 
  textFont(font); 
  fill(0);
  text("Score: ", 10, 100, 200, 200);
  text(" "+ score, 10, 140, 200, 200);
  
  fill(232, 61, 75);
  rect (100, 0, 800, 900);

  line (0, 800, 1000, 800);
  
  fill (247, 228, 52);
  ellipse (200, 800, 80, 80);
  fill (a);
  ellipse (200, 800, 40, 40);
  fill (21, 5, 175);
  ellipse (400, 800, 80, 80);
  fill (b);
  ellipse (400, 800, 40, 40);
  fill (1, 126, 0);
  ellipse (600, 800, 80, 80);
  fill (c);
  ellipse (600, 800, 40, 40);
  fill (165, 2, 15);
  ellipse (800, 800, 80, 80);
  fill (d);
  ellipse (800, 800, 40, 40);
  
    t1.run();
    t2.run();
    t3.run();
    t4.run();
    
    if (score == -1000) {
      


      
      noLoop();
    }
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      a = color (247, 228, 52);
    } else if (keyCode == UP) {
      b = color (21, 5, 175);
    } else if (keyCode == DOWN){
      c = color (1, 126, 0);
    } else if (keyCode == RIGHT) {
      d = color (165, 2, 15);
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      a = color (250, 255, 3);
      t1.buttonPress();
    } else if (keyCode == UP) {
      b = color (69, 153, 252);
      t2.buttonPress();
    } else if (keyCode == DOWN){
      c = color (25, 247, 52);
      t3.buttonPress();
    } else if (keyCode == RIGHT) {
      d = color (250, 10, 30);
      t4.buttonPress();
    }
  }
}

