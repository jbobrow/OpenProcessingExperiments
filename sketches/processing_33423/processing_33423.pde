


int posx;
int posy;

void setup() {
  background(255);
  size(600,600);
  strokeWeight(1);
}

void draw() {
  posx=mouseX-(mouseX%10);
  posy=mouseY-(mouseY%10);

  if(mousePressed == true) {
    noFill();
    stroke(0);
    rect(posx,posy,10,10);
  } else if(keyPressed) {
    if(key=='a') {
      noFill();
      triangle(posx,posy+10,posx+5,posy,posx+10,posy+10);
    }

    if(key=='b') {
      fill(255);
      stroke(255);
      rect(posx,posy,10,10);
    }

    if(key=='c') {
      background(255);
    }
  }
}







