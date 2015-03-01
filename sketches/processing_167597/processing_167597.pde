
float x, y;
float angle = 0;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  x= 300 * sin(angle);
  y= 300 * cos(angle); 

  //angle = angle +1 ; (same below line)
  //everytime +1 = angle ++;
  angle += 10;

  stroke(0, 25);
  noFill();
  translate(width/2, height/2);
  rotate(angle);
  stroke(random(0),0,random(200),random(50));
  ellipse(0, 0, x, y);
  
  stroke(0, 5);
  ellipse(100, 150, x, y);

}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

