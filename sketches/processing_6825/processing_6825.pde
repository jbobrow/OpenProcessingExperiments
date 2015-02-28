

int lines = 10;
int[][] wall;
int score = 0;
int highScore = 0;
PFont font;


void setup() {
  frameRate(60);
  size(200, 600);
  stroke(255);
  noLoop();
  font = loadFont("AlMateen-Bold-20.vlw");
  textFont(font, 20);
  int lineToline =height/lines;
  wall = new int[lines][2];
  for(int i = 0; i < lines; i++ ) {
    wall[i][0] = lineToline * i;
    wall[i][1] = int(map((random(-1,16)), 0, 16, 0, 160));
  }
}

void draw() 
{ 
  background(0);
  hit();
  stroke(255);
  strokeWeight(2); 
  for(int i = 0; i < lines; i++) { 
    line(0, wall[i][0], wall[i][1], wall[i][0]);
    line(wall[i][1]+40, wall[i][0], width, wall[i][0]);
    
    wall[i][0] = wall[i][0] - 1; 
    if (wall[i][0] < 0) { 
      wall[i][0] = height;
      wall[i][1] = int(map((random(-1,16)), 0, 16, 0, 160));
      score++;
    }
  } 
  fill(255,0,0);
  noStroke();
  ellipse(mouseX,mouseY,10,10);

  fill(0,0,255);
  text("HIGHSCORE   " + highScore, 5, 20);
  text("SCORE   " + score, 5, 45);
}

void hit() {
  for (int i = 0; i < lines; i++) {
    if (mouseY <= wall[i][0] + 5 && mouseY >= wall[i][0] - 5) {
      fill(255,0,0);
      ellipse(width-10,10,10,10);
      if (mouseX >= wall[i][1] && mouseX <= wall[i][1]+40) {

      } else {
        if (score > highScore) {
        highScore = score; 
        score = 0;
        }
        fill(0,255,0);
        text("Click\nand Restart", 30, height/2);
        noLoop();        
      }
    }
  }
}  

void mousePressed() 
{
  loop();
}

