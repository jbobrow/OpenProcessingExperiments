
float theta = radians(30);
float i = 80;
PImage bg;

void setup() {
  size(664, 650);

  // background(0);
  bg = loadImage("bgbg.jpg");
  image(bg, 0, 0);
  frameRate(1);
}

void draw() {
  //background(255);
  translate(width/2, height);
  branch(i);
  i = i + 1;
  if (i >120) {
    i = 120;
  }
}



void branch(float len) {
  strokeWeight(len/4);
  stroke(random(50, 255), 50);
  strokeJoin(ROUND);
  strokeCap(ROUND);

  line(0, 0, 0, -len);
  translate(0, -len);



  if (len > 10 && len <=40) {

    pushMatrix();
    rotate(-theta*noise(random(30)));      
    branch(len*.75);
    popMatrix();

    pushMatrix();
    rotate(theta*random(30));
    branch(len*.75);
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
    fill(random(100, 200), random(100, 200), random(100, 200), 80);
    ellipse(0, 0, 5, 5);

    fill(random(100, 200), random(100, 200), random(100, 200), 80);
    ellipse(0, 0, 10, 15);

    //       fill(random(100, 200), 50);
    //   ellipse(0, 0, 5, 10);
  }
}


