
/*Schreibe ein Programm welches das Fenster in vier Flächen teilt 
 und jede mit einem Rollover Effekt versieht.*/

int x = width/2;
int y = height/2;

void setup() {
  size(200, 200);
}

void draw() {
  background(255, 0, 135);

  int x = width/2;
  int y = height/2;

  stroke(255);
  strokeWeight(2);
  line(x, 0, x, y*2);
  line(0, y, x*2, y);

  noStroke();

  if (mouseX >=5 && mouseX <=94 && mouseY >=5 && mouseY <=94) {
    fill(186, 139, 185);
    rect(5, 5, x-11, y-11);
  }
  else if (mouseX >=106 && mouseX <=195 && mouseY >=5 && mouseY <=94) {
    fill(152, 199, 189);
    rect(x+6, 5, x-11, y-11);
  }
  else if (mouseX >=5 && mouseX <=94 && mouseY >=106 && mouseY <=195) {
    fill(219, 223, 118);
    rect(5, y+6, x-11, y-11);
  }
  else if (mouseX >=106 && mouseX <=195 && mouseY >=106 && mouseY <=195) {
    fill(107, 178, 164);
    rect(x+6, y+6, x-11, y-11);
  }
}

/*void mousePressed(){
 saveFrame("thumbnail.png");
 }*/

