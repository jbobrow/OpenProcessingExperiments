
//floats to set the stars
float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];

//floats to set the blue ellipses
float[] a = new float[10];
float[] b= new float[10];
float[] speedA = new float[10];

//floats to set the orange ellipses
float[] g = new float[10];
float[] h= new float[10];
float[] speedB = new float[10];

//int for the score
int score;

//float for the ellipse's radius
float d1 =15;
float d2 = 15;

//setting the font
PFont scoreFont;

//general setup for the game
void setup () {

  //removes cursor leaving just the spaceship
  noCursor();

  //sets the font type
  scoreFont = loadFont("ARDESTINE-48.vlw");

  //sets the font size
  textFont(scoreFont, 30);

  size(900, 600);
  background (0);
  stroke(255);

  //sets the score to 0
  score = 0;


  //sets the stars
  int i = 0;
  while (i < 100) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random (1, 5);
    i = i + 1;
  }

  //sets the blue ellipses
  int j = 0;
  while (j < 10) {
    a[j] = random(0, width);
    b[j] = random(0, height);
    speedA[j] = random (1, 5);
    j = j + 1;
  }

  //sets the orange ellipses
  int z = 0;
  while (z < 10) {
    g[z] = random(0, width);
    h[z] = random(0, height);
    speedB[z] = random (1, 5);
    z = z + 1;
  }
}

//sets what is on the screen basically
void draw() {

  //sets the colour of the text and the text itself
  fill(204, 102, 0);
  background(0);
  text("only hit the orange power ups!!!", 50, 40);
  text("score " +score, 600, 40);

  //makes the motion of the stars
  int i = 0;
  while (i < 100) {

    point(x[i], y[i]);

    x[i] = x[i] - speed[i];
    if (x[i] < 0) {
      x[i] = width;
    }
    i = i +1;
  }



  //sets the motion of the orange ellipses
  int j = 0;


  while (j < 10) {
    fill(204, 102, 0);
    ellipse(a[j], b[j], d1, d1);

    a[j] = a[j] - speedA[j];
    if (a[j] < 0) {
      a[j] = width;
    }
    //makes the score decrease by 10 when the orange ellipses are hit
    if (dist(mouseX, mouseY, a[j], b[j])<d2/2) {
      score = score + 10;

      //makes the orange ellipses "vanish" when touched 
      b[j] = random(650);
      a[j] = -10;
    }
    j = j +1;
  }



  //sets the motion of the blue ellipses
  int z = 0;


  while (z < 10) {
    fill(0, 0, 255);
    ellipse(g[z], h[z], d2, d2);

    g[z] = g[z] - speedB[z];
    if (g[z] < 0) {
      g[z] = width;
    }

    //makes the score decrease by 10 when the blue ellipses are hit
    if (dist(mouseX, mouseY, g[z], h[z])<d1/2) {
      score = score - 10;

      //makes the blue ellipses "vanish" when touched 
      h[z] = random(650);
      g[z] = -10;
    }
    z = z +1;
  }


  //sets the victory screen when score reaches 300
  if (score >290) {
    background (0);
    fill(204, 102, 0);
    textFont(scoreFont, 60);
    text("You won!!!!!!", 220, 350);
    int l = 0;
  while (l < 100) {

    point(x[l], y[l]);

    x[l] = x[l] - speed[l];
    if (x[l] < 0) {
      x[l] = width;
    }
    l = l +1;
  }
  }

  //sets the loser screen when score reaches -50
  if (score <= -50) {
    background (0);
    fill(204, 102, 0);
    textFont(scoreFont, 60);
    text("you lose !!!!!!", 200, 350);
        int w = 0;
  while (w < 100) {

    point(x[w], y[w]);

    x[w] = x[w] - speed[w];
    if (x[w] < 0) {
      x[w] = width;
    }
    w = w +1;
  }
  }


  //makes the triangle and mnoves it with the point of the cursor
  fill(153); 
  triangle(mouseX, mouseY, mouseX, mouseY + 10, mouseX + 30, mouseY + 5);
}


