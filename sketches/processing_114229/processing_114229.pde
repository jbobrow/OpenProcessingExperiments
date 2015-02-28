
//try to use functions : if, mouseX, pmouseX and float
//by KokFu Lok

void setup() {
size(480,320);
background(0);
smooth();

}

void draw() {
  //click mouse to clear all
if (mousePressed) {
    fill(0);
    noStroke();
    rect(0, 0, width, height);
  }
  else {
    strokeWeight(2);
    stroke(mouseX,mouseY,10);
  }

strokeWeight(1);
stroke(pmouseX+10,pmouseY-10,pmouseX+pmouseY);
  float la=pmouseX/2;
line( la,pmouseY,pmouseX,la);

stroke(pmouseX+pmouseY,pmouseX+10,pmouseY-10);
fill(pmouseX,pmouseX,pmouseY,30);
ellipse(pmouseX,pmouseY,10,10);
}

void keyPressed() {
saveFrame("screen-####.png");
}

