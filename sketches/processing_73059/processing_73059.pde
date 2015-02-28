
int counter;
int lineSize;
int startX;

void setup() {
  size (600, 600);
  background(255);
  counter=0;
  startX= 0;
  lineSize=250;
  stroke(0);
  fill(0);
}

void draw() {

  line(0, height/2, lineSize, height/2);
  translate(startX+lineSize, height/2);
  branch(lineSize);
}


void branch(int ls) {

  if (ls>10) {
    counter++;
    ls*=.6;
    pushMatrix();
    rotate(radians(45));
    line(startX, 0, startX+ls, 0);
    translate(startX+ls, 0);
    branch(ls); 
    popMatrix();

    pushMatrix();
    rotate(radians(-45));
    line(startX, 0, startX+ls, 0);
    translate(startX+ls, 0);
    branch(ls); 
    popMatrix();
  }
}


