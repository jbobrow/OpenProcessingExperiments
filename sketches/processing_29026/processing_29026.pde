
void setup() {
  size(400, 400);
  background(74, 189, 245);
  smooth();
}

void draw() {

  //positions
  int x = width/2;
  int y = height/3;

  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();

  //face
  fill(245, 250, 15, 20);  //color
  ellipse(x, y, 80, 80);

  //eyes
  fill(0);
  ellipse(x-20, y,10,10);
  ellipse(x +20, y,10,10);


  //nose
  fill(39, 54, 31, 100);
  arc(x, y+3, 30, 30, 0, PI);

  //body
  fill(20, 22, 99, 100);
  rect(x, y+90, 40, 100);

  //hands
  fill(152, 51, 81);
  arc(x +50,y+70, 60, 60, PI/4, 7*PI/4);
  arc(x -50,y+70, 60, 60, 5*PI/4, 2*PI+ 3*PI/4);

  //headdress
  stroke(4);
  fill(250,48, 25);
  strokeWeight(2);
  line(x, y - 40, x, y - 80);
  ellipse(x, y - 80, 10, 10);

  //legs
  line(x +20, y+140, x+20, y+180);
  line(x -20, y+140, x-20, y+180);
}

