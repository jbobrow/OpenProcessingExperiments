
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name:Lee Sungbum
// ID:201420097
float xSpeed = 5;
float ySpeed = 5;
float x=0;
float y=0;

void setup() {
  size (600, 600);
  smooth();
  //noLoop();
}

void draw() {
  background(255);

  x=x+xSpeed;
  y=y+ySpeed;

  xSpeed=xSpeed*-1;
  ySpeed=ySpeed*-1;

  if ((x > width) || (x < 100)) { 
    xSpeed = xSpeed * -1;
  } 
  if ((y > height) ||(y < 100)) { 
    ySpeed = ySpeed * -1;
  }
  for (int i = 0; i < width; i = i + 30) {
    for (int j = 0; j < height; j = j +30) {
      fill(#5352C1, 300);  
      stroke(#CEC8C8);
      ellipse(i, j, 20, 20);
    }
  }
  stroke(0);
  strokeWeight(random(5));
  translate(width/2, height/2);
  scale(0.5);
  rotate(10);
  noFill();
  quad(x, y, width, 0, width, height, 0, height/2);
  quad(x-30, y-30, width-30, 0-30, width-30, height-30, 0-30, height/2-30);
  quad(x-60, y-60, width-60, 0-60, width-60, height-60, 0-60, height/2-60);
  quad(x-90, y-90, width-90, 0-90, width-90, height-90, 0-90, height/2-90);
  quad(x-120, y-120, width-120, 0-120, width-120, height-120, 0-120, height/2-120);
  quad(x-150, y-150, width-150, 0-150, width-150, height-150, 0-150, height/2-150);
  fill(#65CB6C, 100);
  ellipse(x-100, y+300, width/2, height/2);
  ellipse(x-500, y-100, width/4, height/3);
  ellipse(x-400, y+100, width/5, height/3);
  ellipse(x+200, y-100, width/3, height/3);
  fill(#C58FD6, 100);
  quad(x, y, width, 0, width, height, 0, height);
}

