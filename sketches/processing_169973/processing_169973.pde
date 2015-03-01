
int count = 100;
float x[] = new float[count];
float y[] = new float[count];


PFont f;

void setup() {

  size (500, 500);

  for (int i = 0; i < count; i++) {
    x[i] = random(width);
    y[i] = random(0, 250);
  }
  
  f = createFont("Courier",10);
  textFont(f);
}

void draw() {
  background(0);


  //stars
  for (int i = 0; i < count; i++) {
    x[i] += random(-2, 2);
    y[i] += random(-2, 2);


    fill(0, random(50, 200), random(50, 200));
    noStroke();
    ellipse(x[i], y[i], 8, 8);
  }

  //moon
  fill(240, 255, 0);
  noStroke();
  ellipse(400, 100, 100, 100);
  fill(0);
  ellipse(410, 90, 90, 90);
  
  textAlign(CENTER);
  fill(255);
  textSize(15);
  text("wow, dancing stars!", width/2, 380);
  
  
}



