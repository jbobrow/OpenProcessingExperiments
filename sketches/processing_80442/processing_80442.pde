
import java.awt.event.*;
import java.awt.Color;

float counter;
float counter1;
float counter2;

int dial = 0;

void setup() {
  size(800, 800);
  frame.addMouseWheelListener(new MouseWheelInput());
  frame.setBackground(new java.awt.Color(0, 0, 0));

  smooth();
  noCursor();
  colorMode(HSB);
  rectMode(CENTER);
  background(0);
  strokeWeight(1);
  noStroke();
  noFill();
  stroke(0, 0, 255);
  frameRate(30);
}

void draw() {
  background(frameCount % 255);
  background(0);

  float d = 0.025; //DEPTH

  pushMatrix();
  translate(width/2, height/2);

  if (dial == 0) {
    for (int s = 0; s <= 700; s = s + 700/25) {
      ellipse((s/10*d), 0/(s/10*d), s, s+counter);
      d = d + .001;
    }
  }

  if (dial == 1) {
    for (int s = -height; s <= height; s = s + height/5) {
      for (int t = -height; t <= height; t = t + height/5) {
        rect(0, t, (counter1*d), (counter1*d));
      }
      d = d + .05;
    }
  }

  if (dial == 2) {
    for (int i = -height/2; i <= height/2; i = i + height/10) {
      for (int h = -height/2; h <= height/2; h = h + height/10) {
        ellipse(i, h, counter2/5, counter2/5);
      }
    }
  }

  popMatrix();
}

void mouseReleased() {
  if (dial == 0) {
    dial = 1;
  }

  else if (dial == 1) {
    dial = 2;
  }

  else if (dial == 2) {
    dial = 0;
  }
}

class MouseWheelInput implements MouseWheelListener {
  void mouseWheelMoved(MouseWheelEvent e) {  
    int step=e.getWheelRotation();

    if (dial == 0) {
      counter = counter+step;
      if (constrain(counter, -730, 0) == -730) {
        counter = counter-step;
      }
      if (constrain(counter, -730, 0) == 0) {
        counter = counter-step;
      }
    }

    if (dial == 2) {
      counter2 = counter2+step;
      if (abs(counter2) >= 7520) {
        counter2 = - counter2;
      }
    }

    if (dial == 1) {
      counter1 = counter1+step;
      if (constrain(counter1, -height*8, 0) == -height*8) {
        counter1 = counter1-step;
      }
      if (constrain(counter1, -height*8, 0) == 0) {
        counter1 = counter1-step;
        
      }
    }
    println(counter1);
  }
}



