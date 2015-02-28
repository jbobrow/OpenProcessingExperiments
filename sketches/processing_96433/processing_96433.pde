
float theta = radians(30);
float i = 120;
PImage bg;

void setup() {
  size(650, 700);
  smooth();
  // background(0); 
  frameRate(1);

  // translate(width/2, height);
  //branch(150);
}

void draw() {
  // background(0);
   bg = loadImage("bg3.png");
 image(bg, 0, 0);

  translate(width/2, height);
  branch(i);
  i = i + 1;
  if (i >120) {
    i = 120;
  }
}



void branch(float len) {
  strokeWeight(len/4);
  //stroke(255);
  strokeJoin(ROUND);
  strokeCap(ROUND);

  organicLine( 0, 0, 0, -len, len/10, random(200));

  // line(0, 0, 0, -len);
  translate(0, -len);



  if (len > 10 && len <=40) {

    pushMatrix();
    rotate(-theta*noise(random(30)));      
    branch(len*.8);
    popMatrix();

    pushMatrix();
    rotate(theta*random(30));
    branch(len*.8);
    popMatrix();
  }

  if (len > 40) {

    pushMatrix();
    rotate(-theta);      
    branch(len*.75);
    popMatrix();

    pushMatrix();
    rotate(theta);
    branch(len*.75);
    popMatrix();
  }

  if (len<=10) {
    stroke(255,100);
    fill(random(100, 200), random(100, 200), random(100, 200), 100);
    ellipse(0, 0, 5, 5);

    fill(random(100, 200), random(100, 200), random(100, 200), 120);
    ellipse(0, 0, random(10,15), random(15,20));

    //   fill(random(100, 200), 50);
    //   ellipse(0, 0, 5, 10);
  }
}



void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
  strokeCap(ROUND);
  strokeWeight(strokeW);
  stroke(255);
  float numSections = 5;
  float cx = x2-x1; // change in x
  float cy = y2-y1; // change in y

  float nx1 = x1 *random(50); // first x
  float ny1 = y1 *random(50); // first y

  for (int i = 1; i <= numSections; i++) {
    float nx2 = x1 + i/numSections * cx+ random(-5, 5);
    float ny2 = y1 + i/numSections * cy+ random(-5, 5);

    line(nx1, ny1, nx2, ny2);
    nx1 = nx2;
    ny1 = ny2;
  }
}

