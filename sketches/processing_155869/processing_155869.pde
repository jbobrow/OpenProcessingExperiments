
float radius;
int value;
int valueB;
color myColor;

void setup() {

  size(1000, 1000);
  frameRate(12);
}

void draw() {
  
 rotate(mouseX);




  background(255, mouseX, mouseY);

  //body
  fill(mouseY, mouseX, mouseX);
  stroke(0, 255, 236);
  ellipse(250, 500, 500, 500);
  stroke(0, 0, 0);
  //buttons
  line(250, 250, 250, 600);
  fill(mouseX, mouseX, mouseY);
  ellipse(240, 350, 10, 10);
  fill(mouseY, mouseX, mouseY);
  ellipse(240, 380, 10, 10);
  fill(mouseX, mouseY, mouseY);
  ellipse(240, 410, 10, 10);
  fill(mouseX, 78, mouseY);
  ellipse(240, 440, 10, 10);
  fill(mouseY, 255, mouseY);
  ellipse(240, 470, 10, 10);
  fill(145, mouseX, mouseY);
  ellipse(240, 500, 10, 10);

  //headandears
  fill(255, 224, 173);
  stroke(255, 224, 173);
  ellipse(250, 250, 175, 175);
  ellipse(157, 260, 20, 20);
  ellipse(343, 260, 20, 20);

  //nose
  fill(247, 209, 147);
  stroke(247, 209, 147);
  ellipse(250, 260, 10, 50);
  ellipse(245, 277, 8, 8);
  ellipse(255, 277, 8, 8);

  //mouth
  fill(0, 0, 0);
  triangle(220, 295, 280, 295, 250, 310);

  //eye
  fill(value);
  ellipse(210, 220, radius, radius);
fill(valueB);
  ellipse(290, 220, radius, radius);
  fill(0, 0, 0);
  ellipse(210, 240, 5, 5);
  ellipse(290, 240, 5, 5);
}

void mouseReleased() { 

  if (value == #FFFFFF) {
    value =#FFA2C9;
  } else {
    value = #FFFFFF;

    if (valueB == #FFFFFF) {
      valueB =#A2FFFA;
    } else {
      valueB = #FFFFFF;

      if (radius == 50) {
        radius =200 ;
      } else {

        radius=50;
      }
    }
  }
}





