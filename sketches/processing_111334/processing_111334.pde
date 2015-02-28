
boolean hat = true;

void setup() {
  size (1000, 1000);
  background(144, 234, 213, 30);
}

void draw () {
  noLoop();
  noStroke();


  for (int y=0; y<=height;y+=60) {
    for (int x =0; x<= width; x +=60) {
      color c = color(random (255), random (255), 65);
      fill (c);
      ellipse (x, y, 40, 40);
    }
  }
  //neck
  fill(227, 176, 94);
  rect(650, 500, 50, 120);

  //face
  fill(227, 176, 94);
  ellipse (2*width/3, height/3, 300, 400);

  //eyes
  fill(0);

  ellipse(((2*width)-200)/3, height/3, 70, 125);

  ellipse(((2*width)+200)/3, height/3, 70, 125);

  //nose 
  fill(191, 26, 214);
  ellipse(2*width/3, (height/3)+100, 180, 80);

  //hat  
  fill(214, 26, 219);
  ellipse(660, 180, 400, 100);
  fill(0);
  rect(480,180,15,120);


  //balloons
  fill(214, 26, 29);
  ellipse(200, 100, 225, 270);
  fill(85, 26, 214);
  ellipse(100, 300, 225, 270);
  fill(214, 208, 26);
  ellipse(300, 400, 225, 270);


  //glasses
  fill(214, 26, 0, 100);
  arc(600, 333, 50, 50, 0, PI);
  fill(45, 222, 220, 50);
  arc(733, 333, 50, 50, 0, PI);

  //body 
  fill(100, 16, 32);
  arc(733, 333, 50, 50, -PI, 0);
  //body 
  fill(100, 16, 32);
  arc(675, 1000, 300, 800, -PI, 0);

  //hand

  fill(100, 16, 32);
  rect(300, 670, 300, 100);
  fill(227, 176, 94);
  ellipse(300, 720, 100, 100);
}
