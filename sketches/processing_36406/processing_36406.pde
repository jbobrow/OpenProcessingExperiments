
Boolean drawing;

void setup () {
  smooth();
  size(300, 300);
  drawing = true;
}

int x = 0;

void draw() {
  if (drawing) {
    if (mouseX < width/2) {
      background(255, 255, 0);

      //candle on

      stroke(0);
      strokeWeight(2);

      fill(115, 95, 15);
      rectMode(CORNER);
      rect(0, 225, width, height);

      fill(255);
      rectMode(CENTER);
      rect(width/2, height/2, 40, height/2);

      noStroke();
      fill(230, 190, 20);
      triangle(width/2, 75, 135, 60, 165, 60);
      triangle(width/2, 45, 135, 60, 165, 60);
    }
    else {
      background(40);

      //candle off

      stroke(200);
      strokeWeight(4);
      line(width/2, 75, width/2, 60);

      stroke(0);
      strokeWeight(2);
      fill(65, 45, 0);
      rectMode(CORNER);
      rect(0, 225, width, height);

      fill(175);
      rectMode(CENTER);
      rect(width/2, width/2, 40, height/2);
    }
  }
  else {
    if (mouseX < width/2) {
      background(255, 255, 0);

      //TNT

      stroke(0);
      strokeWeight(2);

      fill(115, 95, 15);
      rectMode(CORNER);
      rect(0, 225, width, height);

      fill(255, 0, 0);
      rectMode(CENTER);
      rect(width/2, height/2, 40, height/2);

      noStroke();
      fill(230, 190, 20);
      triangle(width/2, 75, 135, 60, 165, 60);
      triangle(width/2, 45, 135, 60, 165, 60);

      PFont font;
      fill(255);
      font = loadFont("Helvetica-14.vlw"); 
      textFont(font); 
      text("TNT", 136, height/2); 
      text("TNT", 136, (height/2)+50);
      text("TNT", 136, (height/2)-50);
    }
    else {

      //TNT EXPLODE

      stroke(0);
      strokeWeight(2);

      fill(115, 95, 15);
      rectMode(CORNER);
      rect(0, 225, width, height);

      fill(255, 0, 0);
      rectMode(CENTER);
      rect(width/2, height/2, 40, height/2);

      noStroke();
      fill(230, 190, 20);
      triangle(width/2, 75, 135, 60, 165, 60);
      triangle(width/2, 45, 135, 60, 165, 60);

      PFont font;
      fill(255);
      font = loadFont("Helvetica-14.vlw"); 
      textFont(font); 
      text("TNT", 136, height/2); 
      text("TNT", 136, (height/2)+50);
      text("TNT", 136, (height/2)-50);

      fill(255, x++, x++);
      ellipse(width/2, height/2, x++, x++);
      if (x >= 400) {
        background(255, 255, 0);
        x=0;
      }
    }
  }
}

void mousePressed() {
  if (drawing) {
    drawing=false;
  } 
  else {
    drawing=true;
  }
}


