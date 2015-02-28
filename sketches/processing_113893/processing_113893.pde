
float goodx, goody;
float gr, br;
float badx, bady;
int score = 0;

void setup() {
  size(640, 480);
  smooth();
  goodx = random(width);
  goody = random(height);
  badx = random(width);
  bady = random(height);
  gr = random(10,40);
  br = random(20,70);
}

void draw() {
  background(50);

  //Update data for good and bad ellipse
  goodx += 2.5;
  if (goodx >= width+gr) {
    goodx = -gr;
    goody = random(height);
  }
  badx += 2.8;
  if (badx >= width+br) {
    badx = -gr;
    bady = random(height);
  }

  //Check mouse against good/bad ellipses
  //You have to click the green ones.
  if ( dist(mouseX, mouseY, goodx, goody) < gr && mousePressed)  {
    goodx = -gr;
    goody = random(height);
    score++;
  }
  //but the red ones will lower your score just if you touch
  if ( dist(mouseX, mouseY, badx, bady) < br)  {
    badx = -gr;
    bady = random(height);
    score--;
  }


  //Render any shapes
  fill(240, 130, 150);
  ellipse(badx, bady, br*2, br*2);
  fill(178, 240, 120);
  ellipse(goodx, goody, gr*2, gr*2);
  
  fill(255);
  text(score, 50,50);
}



