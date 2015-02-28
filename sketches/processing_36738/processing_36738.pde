
//windows placed along a facade in a controlled pattern will be random colors of a blue hue
void setup() {
  size(500, 500);
  background(21, 229, 250);
  smooth();
  noStroke();
  fill(180);
  rect(0, 50, width, height);
  fill(240);
  rect(0, 50, width, 20);
  rect(0, 180, width, 10);
  rect(0, 280, width, 10);
  rect(0, 380, width, 10);
}

float count=0;//places the windows along the width of the facade
float a=50;//places the windows along the height of the facade

void draw() {
  stroke(160);
  strokeWeight(3);

  //makes the color selection of the windows random in a blue hue
  if (random(50)>20) {

    fill(random(80, 225), random(150, 200), 255);
  }
  else {
    fill(64, 255, 250);
  }
  if (count<= width) {
    if (count % 20==0) {
      rect(20+(5*count), 2*a, 45, 70);
    }
    if (random(50)>20) {
      fill(random(80, 225), random(150, 200), 255);
    }
    else {
      fill(64, 255, 250);
    }
    if (count<= width) {
      if (count % 40==0) {
        rect(20+(5*count), 4*a, 45, 70);
      }
      if (random(50)>20) {
        fill(random(80, 225), random(150, 200), 255);
      }
      else {
        fill(64, 255, 250);
      }

      if (count<= width) {
        if (count % 20==0) {
          rect(20+(5*count), 6*a, 45, 70);
        }

        if (random(50)>20) {
          fill(random(80, 225), random(150, 200), 255);
        }
        else {
          fill(64, 255, 250);
        }

        if (count<= width) {
          if (count % 40==0) {
            rect(20+(5*count), 8*a, 45, 70);
          }
        }
      }
    }
  }


  count++;
}


