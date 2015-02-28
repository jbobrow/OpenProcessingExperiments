
// *** sk V0001h

boolean cpEn; 
boolean eog = false; 
float games = -1; 
float score = 0; 
int[][] pg = new int[3][3]; 
String sk = "TR_tunder"; 
void setup() {
  size(640, 640); 
  frameRate(10); 
  smooth(); 
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) pg[i][j] = 0;
  }
  cpEn = false;
  games++; 
  // println("Games: ", int(games), "; Score: ", int(score)); 
  if (games < 100 && score > 20) { 
    eog = true; 
    // println(sk);
  }
}

void draw() {
  // *** Draw playground
  background(0); 
  stroke(255); 
  strokeWeight(5);
  line(width/8, height/8, width*3/4+width/8, height/8); 
  line(width/8, height/4+height/8, width*3/4+width/8, height/4+height/8); 
  line(width/8, height/2+height/8, width*3/4+width/8, height/2+height/8);
  line(width/8, height*3/4+height/8, width*3/4+width/8, height*3/4+height/8);
  line(width/8, height/8, width/8, height*3/4+height/8);
  line(width/4+width/8, height/8, width/4+width/8, height*3/4+height/8);
  line(width/2+width/8, height/8, width/2+width/8, height*3/4+height/8);
  line(width*3/4+width/8, height/8, width*3/4+width/8, height*3/4+height/8);

  // *** Draw score
  fill(255); 
  textAlign(CENTER);
  textSize(height/30); 
  text("Games: " + int(games) + "; Score: " + int(score), width/2, height-height/30);
  if (eog) { 
    fill(255, 255, 0); 
    textSize(height/5); 
    text(sk, width/2, height/2);
  }

  // *** Draw greens and reds
  stroke(0, 255, 0); 
  strokeWeight(5);
  noFill(); 
  if (pg[0][0] == 1) ellipse(width/4, height/4, width/5, height/5); 
  if (pg[1][0] == 1) ellipse(width/4, height/2, width/5, height/5); 
  if (pg[2][0] == 1) ellipse(width/4, height*3/4, width/5, height/5); 
  if (pg[0][1] == 1) ellipse(width/2, height/4, width/5, height/5); 
  if (pg[1][1] == 1) ellipse(width/2, height/2, width/5, height/5); 
  if (pg[2][1] == 1) ellipse(width/2, height*3/4, width/5, height/5);
  if (pg[0][2] == 1) ellipse(width*3/4, height/4, width/5, height/5); 
  if (pg[1][2] == 1) ellipse(width*3/4, height/2, width/5, height/5); 
  if (pg[2][2] == 1) ellipse(width*3/4, height*3/4, width/5, height/5);
  stroke(255, 0, 0); 
  strokeWeight(5);
  noFill(); 
  if (pg[0][0] == 2) ellipse(width/4, height/4, width/5, height/5); 
  if (pg[1][0] == 2) ellipse(width/4, height/2, width/5, height/5); 
  if (pg[2][0] == 2) ellipse(width/4, height*3/4, width/5, height/5); 
  if (pg[0][1] == 2) ellipse(width/2, height/4, width/5, height/5); 
  if (pg[1][1] == 2) ellipse(width/2, height/2, width/5, height/5); 
  if (pg[2][1] == 2) ellipse(width/2, height*3/4, width/5, height/5);
  if (pg[0][2] == 2) ellipse(width*3/4, height/4, width/5, height/5); 
  if (pg[1][2] == 2) ellipse(width*3/4, height/2, width/5, height/5); 
  if (pg[2][2] == 2) ellipse(width*3/4, height*3/4, width/5, height/5);

  // *** End of game
  // Who wins
  if ( 
  (pg[0][0] == 1 &&
    pg[1][0] == 1 &&
    pg[2][0] == 1) ||
    (pg[0][1] == 1 &&
    pg[1][1] == 1 &&
    pg[2][1] == 1) ||
    (pg[0][2] == 1 &&
    pg[1][2] == 1 &&
    pg[2][2] == 1) ||

    (pg[0][0] == 1 &&
    pg[0][1] == 1 &&
    pg[0][2] == 1) ||
    (pg[1][0] == 1 &&
    pg[1][1] == 1 &&
    pg[1][2] == 1) ||
    (pg[2][0] == 1 &&
    pg[2][1] == 1 &&
    pg[2][2] == 1) ||

    (pg[0][0] == 1 &&
    pg[1][1] == 1 &&
    pg[2][2] == 1) ||
    (pg[0][2] == 1 &&
    pg[1][1] == 1 &&
    pg[2][0] == 1)
    )
  {
    score++; 
    setup();
  } 
  else if ( 
  (pg[0][0] == 2 &&
    pg[1][0] == 2 &&
    pg[2][0] == 2) ||
    (pg[0][1] == 2 &&
    pg[1][1] == 2 &&
    pg[2][1] == 2) ||
    (pg[0][2] == 2 &&
    pg[1][2] == 2 &&
    pg[2][2] == 2) ||

    (pg[0][0] == 2 &&
    pg[0][1] == 2 &&
    pg[0][2] == 2) ||
    (pg[1][0] == 2 &&
    pg[1][1] == 2 &&
    pg[1][2] == 2) ||
    (pg[2][0] == 2 &&
    pg[2][1] == 2 &&
    pg[2][2] == 2) ||

    (pg[0][0] == 2 &&
    pg[1][1] == 2 &&
    pg[2][2] == 2) ||
    (pg[0][2] == 2 &&
    pg[1][1] == 2 &&
    pg[2][0] == 2)
    )
  {
    score--; 
    setup();
  }
  if (
  pg[0][0] != 0 &&
    pg[1][0] != 0 &&
    pg[2][0] != 0 &&

    pg[0][1] != 0 &&
    pg[1][1] != 0 &&
    pg[2][1] != 0 &&

    pg[0][2] != 0 &&
    pg[1][2] != 0 &&
    pg[2][2] != 0)
  {
    setup();
  }

  // *** 
  if (cpEn) {
    if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 0 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0)
    {
      //
    }

    // BD-Corners
    else if (
    pg[0][0] == 1 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 0 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0)
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 1 &&

      pg[0][1] == 0 &&
      pg[1][1] == 0 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0) 
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 0 &&
      pg[2][1] == 0 &&

      pg[0][2] == 1 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0)   
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 0 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 1)   
    {
      pg[1][1] = 2;
      cpEn = false;
    }

    // B-NonCorner
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 1 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 0 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0)   
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 1 &&
      pg[1][1] == 0 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0)   
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 1 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0)   
    {
      float r = random(1); 
      if (r < 0.25) pg[0][0] = 2;
      else if (r < 0.5) pg[2][0] = 2;
      else if (r < 0.75) pg[0][2] = 2;
      else pg[2][2] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 0 &&
      pg[2][1] == 1 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0)   
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 0 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 1 &&
      pg[2][2] == 0)   
    {
      pg[1][1] = 2;
      cpEn = false;
    }

    // D-StopThe3rd
    else if (
    pg[0][0] == 1 &&
      pg[1][0] == 1 &&
      pg[2][0] == 0)
    {
      pg[2][0] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 1 &&
      pg[1][0] == 0 &&
      pg[2][0] == 1)
    {
      pg[1][0] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 1 &&
      pg[2][0] == 1)
    {
      pg[0][0] = 2;
      cpEn = false;
    }
    else if (
    pg[0][1] == 1 &&
      pg[1][1] == 1 &&
      pg[2][1] == 0)
    {
      pg[2][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][1] == 1 &&
      pg[1][1] == 0 &&
      pg[2][1] == 1)
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][1] == 0 &&
      pg[1][1] == 1 &&
      pg[2][1] == 1)
    {
      pg[0][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][2] == 1 &&
      pg[1][2] == 1 &&
      pg[2][2] == 0)
    {
      pg[2][2] = 2;
      cpEn = false;
    }
    else if (
    pg[0][2] == 1 &&
      pg[1][2] == 0 &&
      pg[2][2] == 1)
    {
      pg[1][2] = 2;
      cpEn = false;
    }
    else if (
    pg[0][2] == 0 &&
      pg[1][2] == 1 &&
      pg[2][2] == 1)
    {
      pg[0][2] = 2;
      cpEn = false;
    }

    else if (
    pg[0][0] == 1 &&
      pg[0][1] == 1 &&
      pg[0][2] == 0)
    {
      pg[0][2] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 1 &&
      pg[0][1] == 0 &&
      pg[0][2] == 1)
    {
      pg[0][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[0][1] == 1 &&
      pg[0][2] == 1)
    {
      pg[0][0] = 2;
      cpEn = false;
    }
    else if (
    pg[1][0] == 1 &&
      pg[1][1] == 1 &&
      pg[1][2] == 0)
    {
      pg[1][2] = 2;
      cpEn = false;
    }
    else if (
    pg[1][0] == 1 &&
      pg[1][1] == 0 &&
      pg[1][2] == 1)
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[1][0] == 0 &&
      pg[1][1] == 1 &&
      pg[1][2] == 1)
    {
      pg[1][0] = 2;
      cpEn = false;
    }
    else if (
    pg[2][0] == 1 &&
      pg[2][1] == 1 &&
      pg[2][2] == 0)
    {
      pg[2][2] = 2;
      cpEn = false;
    }
    else if (
    pg[2][0] == 1 &&
      pg[2][1] == 0 &&
      pg[2][2] == 1)
    {
      pg[2][1] = 2;
      cpEn = false;
    }
    else if (
    pg[2][0] == 0 &&
      pg[2][1] == 1 &&
      pg[2][2] == 1)
    {
      pg[2][0] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 1 &&
      pg[1][1] == 1 &&
      pg[2][2] == 0)
    {
      pg[2][2] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 1 &&
      pg[1][1] == 0 &&
      pg[2][2] == 1)
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][1] == 1 &&
      pg[2][2] == 1)
    {
      pg[0][0] = 2;
      cpEn = false;
    }
    else if (
    pg[0][2] == 1 &&
      pg[1][1] == 1 &&
      pg[2][0] == 0)
    {
      pg[2][0] = 2;
      cpEn = false;
    }
    else if (
    pg[0][2] == 1 &&
      pg[1][1] == 0 &&
      pg[2][0] == 1)
    {
      pg[1][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][2] == 0 &&
      pg[1][1] == 1 &&
      pg[2][0] == 1)
    {
      pg[0][2] = 2;
      cpEn = false;
    }

    // D-2Corners-1Center
    else if (
    pg[0][0] == 1 &&
      pg[1][0] == 0 &&
      pg[2][0] == 0 &&

      pg[0][1] == 0 &&
      pg[1][1] == 2 &&
      pg[2][1] == 0 &&

      pg[0][2] == 0 &&
      pg[1][2] == 0 &&
      pg[2][2] == 1)
    {
      float r = random(1); 
      if (r < 0.25) pg[0][1] = 2;
      else if (r < 0.5) pg[1][0] = 2;
      else if (r < 0.75) pg[1][2] = 2;
      else pg[2][1] = 2;
      cpEn = false;
    }
    else if (
    pg[0][0] == 0 &&
      pg[1][0] == 0 &&
      pg[2][0] == 1 &&

      pg[0][1] == 0 &&
      pg[1][1] == 2 &&
      pg[2][1] == 0 &&

      pg[0][2] == 1 &&
      pg[1][2] == 0 &&
      pg[2][2] == 0)
    {
      float r = random(1); 
      if (r < 0.25) pg[0][1] = 2;
      else if (r < 0.5) pg[1][0] = 2;
      else if (r < 0.75) pg[1][2] = 2;
      else pg[2][1] = 2;
      cpEn = false;
    }

    // Whatever
    else {
      float r = random(0.9); 
      if (r < 0.1 &&  pg[0][0] == 0) {
        pg[0][0] = 2;
        cpEn = false;
      }
      else if (r < 0.2 && pg[1][0] == 0) {
        pg[1][0] = 2;
        cpEn = false;
      }
      else if (r < 0.3 && pg[2][0] == 0) {
        pg[2][0] = 2;
        cpEn = false;
      }
      else if (r < 0.4 && pg[0][1] == 0) {
        pg[0][1] = 2;
        cpEn = false;
      }
      else if (r < 0.5 && pg[1][1] == 0) {
        pg[1][1] = 2;
        cpEn = false;
      }
      else if (r < 0.6 && pg[2][1] == 0) {
        pg[2][1] = 2;
        cpEn = false;
      }
      else if (r < 0.7 && pg[0][2] == 0) {
        pg[0][2] = 2;
        cpEn = false;
      }
      else if (r < 0.8 && pg[1][2] == 0) {
        pg[1][2] = 2;
        cpEn = false;
      }
      else if (r < 0.9 && pg[2][2] == 0) {
        pg[2][2] = 2;
        cpEn = false;
      }
    }
  }
}

void mousePressed() {
  if (!eog) {
    if (mouseX > width/8 && mouseX < width/4+width/8 && mouseY > height/8 && mouseY < height/4+height/8 && pg[0][0] == 0) {
      pg[0][0] = 1;
      cpEn = true;
    }
    else if (mouseX > width/8 && mouseX < width/4+width/8 && mouseY > height/4+height/8 && mouseY < height/2+height/8 && pg[1][0] == 0) {
      pg[1][0] = 1;
      cpEn = true;
    }
    else if (mouseX > width/8 && mouseX < width/4+width/8 && mouseY > height/2+height/8 && mouseY < height*3/4+height/8 && pg[2][0] == 0) {
      pg[2][0] = 1;
      cpEn = true;
    }
    else if (mouseX > width/4+width/8 && mouseX < width/2+width/8 && mouseY > height/8 && mouseY < height/4+height/8 && pg[0][1] == 0) {
      pg[0][1] = 1;
      cpEn = true;
    }
    else if (mouseX > width/4+width/8 && mouseX < width/2+width/8 && mouseY > height/4+height/8 && mouseY < height/2+height/8 && pg[1][1] == 0) {
      pg[1][1] = 1;
      cpEn = true;
    }
    else if (mouseX > width/4+width/8 && mouseX < width/2+width/8 && mouseY > height/2+height/8 && mouseY < height*3/4+height/8 && pg[2][1] == 0) {
      pg[2][1] = 1;
      cpEn = true;
    }
    else if (mouseX > width/2+width/8 && mouseX < width*3/4+width/8 && mouseY > height/8 && mouseY < height/4+height/8 && pg[0][2] == 0) {
      pg[0][2] = 1;
      cpEn = true;
    }
    else if (mouseX > width/2+width/8 && mouseX < width*3/4+width/8 && mouseY > height/4+height/8 && mouseY < height/2+height/8 && pg[1][2] == 0) {
      pg[1][2] = 1;
      cpEn = true;
    }

    else if (mouseX > width/2+width/8 && mouseX < width*3/4+width/8 && mouseY > height/2+height/8 && mouseY < height*3/4+height/8 && pg[2][2] == 0) {
      pg[2][2] = 1;  
      cpEn = true;
    }
  }
}

