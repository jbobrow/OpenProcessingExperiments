
void setup() {
  size(300, 190);
  smooth();
}

void draw() {
  background(165);
  fill(255,220,191);
  stroke (0);
  strokeWeight(2);
  ellipse(150,125, 140, 40);
  ellipse(150, 130, 110, 110);

  strokeWeight(3);
  for (int x = 146; x <= 155; x+= 6) {
    point(x, 145);
  } 
  strokeWeight(5);
  strokeCap (ROUND);
  for (int l = 113; l<=200; l+= 50) {
    line (l, 115, l+25, 115);
  }
  fill(0);
  for (int a= 125; a<=200; a+=50) {
    arc(a, 117, 15, 15, 0, PI);
  }
  strokeWeight (0);
  fill(225);
  for (int p= 125; p<=200; p+=50) {
    arc(p, 117, 10, 10, 0, PI);
  }
  
  if (mousePressed) {

    fill(225,0,0);
    ellipse (150, 165, 10, 20);
  } 
  else {
    stroke(255,0,0);
    strokeWeight(2);
    fill(225,0,0);
    for (int q = 130; q<=170; q+=15) {
      line(q, 165, q+5, 170);
    }
    for (int w = 136; w<=170; w+=15) {
      line (w, 170, w+7, 165);
    }

fill(247,67,215);
    if (mouseX < 60) {
      textSize(50);
      text ("I", mouseX, mouseY);
    }
    else if (mouseX <190) {
      textSize(50);
      text ("Love", mouseX, mouseY);
    }
    else if (mouseX <300) {
      textSize(50);
      text ("You", mouseX, mouseY);
    }
  }
}


