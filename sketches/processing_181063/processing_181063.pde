

// a variable that can be true or false



void setup() {
  background(72,178,203);
  size(600,400);
    smooth();
}
void draw() {


    if (mousePressed==true) {
        strokeWeight(map(pmouseX,0,400,1,15));
          stroke(map(pmouseY,0,400,1,220));
        line(pmouseX,pmouseY,mouseX,mouseY);
        fill(57,46,157,50);
        println(mouseX);
    }
}

void mousePressed() {
  noStroke();
   ellipse(mouseX,mouseY,25,25);
}
void mouseReleased() {
  noStroke();
  ellipse(mouseX,mouseY,25,55);
}


