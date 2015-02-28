
void setup()
{
  size(300, 300);
  smooth();
}


void draw() {

  if (mouseX<=100 && mouseY<=100) {
    noStroke();
    fill(10, 20);
    rect(0, 0, width, height);
    fill(255);
    ellipse(50, 50, 100, 100);
    ellipse(150, 50, 80, 80);
    ellipse(250, 50, 60, 60);
    ellipse(50, 150, 80, 80);
    ellipse(150, 150, 60, 60);
    ellipse(250, 150, 60, 60);
    ellipse(50, 250, 60, 60);
    ellipse(150, 250, 60, 60);
    ellipse(250, 250, 60, 60);
  }
  else {

    if (mouseX>100 && mouseX<=200 && mouseY<=100) {
      noStroke();
      fill(250, 20);
      rect(0, 0, width, height);
      fill(0);
      ellipse(50, 50, 80, 80);
      ellipse(150, 50, 100, 100);
      ellipse(250, 50, 80, 80);
      ellipse(50, 150, 60, 60);
      ellipse(150, 150, 80, 80);
      ellipse(250, 150, 60, 60);
      ellipse(50, 250, 60, 60);
      ellipse(150, 250, 60, 60);
      ellipse(250, 250, 60, 60);
    }
    else {
      if (mouseX>=200 && mouseY<=100) {
        noStroke();
        fill(10, 20);
        rect(0, 0, width, height);
        fill(255);
        ellipse(50, 50, 60, 60);
        ellipse(150, 50, 80, 80);
        ellipse(250, 50, 100, 100);
        ellipse(50, 150, 60, 60);
        ellipse(150, 150, 60, 60);
        ellipse(250, 150, 80, 80);
        ellipse(50, 250, 60, 60);
        ellipse(150, 250, 60, 60);
        ellipse(250, 250, 60, 60);
      }
      else {
        if (mouseX<=100 && mouseY>100 && mouseY<=200) {
          noStroke();
          fill(250, 20);
          rect(0, 0, width, height);
          fill(0);
          ellipse(50, 50, 80, 80);
          ellipse(150, 50, 60, 60);
          ellipse(250, 50, 60, 60);
          ellipse(50, 150, 100, 100);
          ellipse(150, 150, 80, 80);
          ellipse(250, 150, 60, 60);
          ellipse(50, 250, 80, 80);
          ellipse(150, 250, 60, 60);
          ellipse(250, 250, 60, 60);
        }
        else {
          if (mouseX>100 && mouseX<=200 && mouseY>100 && mouseY<=200) {
            noStroke();
            fill(10, 20);
            rect(0, 0, width, height);
            fill(255);
            ellipse(50, 50, 60, 60);
            ellipse(150, 50, 80, 80);
            ellipse(250, 50, 60, 60);
            ellipse(50, 150, 80, 80);
            ellipse(150, 150, 100, 100);
            ellipse(250, 150, 80, 80);
            ellipse(50, 250, 60, 60);
            ellipse(150, 250, 80, 80);
            ellipse(250, 250, 60, 60);
          }
          else {
            if (mouseX>200 && mouseY>100 && mouseY<=200) {
              noStroke();
              fill(250, 20);
              rect(0, 0, width, height);
              fill(0);
              ellipse(50, 50, 60, 60);
              ellipse(150, 50, 60, 60);
              ellipse(250, 50, 80, 80);
              ellipse(50, 150, 60, 60);
              ellipse(150, 150, 80, 80);
              ellipse(250, 150, 100, 100);
              ellipse(50, 250, 60, 60);
              ellipse(150, 250, 60, 60);
              ellipse(250, 250, 80, 80);
            }
            else {
              if (mouseX<=100 && mouseY>200) {
                noStroke();
                fill(10, 20);
                rect(0, 0, width, height);
                fill(255);
                ellipse(50, 50, 60, 60);
                ellipse(150, 50, 60, 60);
                ellipse(250, 50, 60, 60);
                ellipse(50, 150, 80, 80);
                ellipse(150, 150, 60, 60);
                ellipse(250, 150, 60, 60);
                ellipse(50, 250, 100, 100);
                ellipse(150, 250, 80, 80);
                ellipse(250, 250, 60, 60);
              }
              else {
                if (mouseX>100 && mouseX<=200 && mouseY>200) {
                  noStroke();
                  fill(250, 20);
                  rect(0, 0, width, height);
                  fill(0);
                  ellipse(50, 50, 60, 60);
                  ellipse(150, 50, 60, 60);
                  ellipse(250, 50, 60, 60);
                  ellipse(50, 150, 60, 60);
                  ellipse(150, 150, 60, 60);
                  ellipse(250, 150, 60, 60);
                  ellipse(50, 250, 80, 80);
                  ellipse(150, 250, 100, 100);
                  ellipse(250, 250, 80, 80);
                }
                else {
                  if (mouseX>200 && mouseY>200) {
                    noStroke();
                    fill(10, 20);
                    rect(0, 0, width, height);
                    fill(255);
                    ellipse(50, 50, 60, 60);
                    ellipse(150, 50, 60, 60);
                    ellipse(250, 50, 60, 60);
                    ellipse(50, 150, 60, 60);
                    ellipse(150, 150, 60, 60);
                    ellipse(250, 150, 80, 80);
                    ellipse(50, 250, 60, 60);
                    ellipse(150, 250, 80, 80);
                    ellipse(250, 250, 100, 100);
                  }
                  else {
                   
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


