
//by Marion Desmonnet

void setup() {
  size(400, 400);
  background(250);
  smooth();
  strokeWeight(1);
}

void draw() {
  background(250);

  //cercles pleins + lignes :
  for (float i=30; i<height; i+=50) {
    for (float j=30; j<height; j+=50) {
      
      //cercles pleins :
      noStroke();
      fill(mouseY, random(200), random(200));
      ellipse(i, j, 10, 10);

      //lignes qui suivent la souris :
      stroke(random(200), random(200), mouseX);
      line(i, j, mouseX, mouseY);
    }
  }

  //cercles vides :
  for (float k=55; k<height; k+=50) {
    for (float l=55; l<height; l+=50) {
      stroke(mouseY, random(200), random(200));
      noFill();
      ellipse(k, l, 10, 10);
    }
  }
}



