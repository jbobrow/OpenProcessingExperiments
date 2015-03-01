
Ant myAnt1;


void setup() {
  size(600, 600);

  myAnt1 = new Ant(color(0, 0, 255), 0, 100, 2, 5, 10);
}

void draw() {
  background(255);
  fill(0, 0, 0);
  ellipse(200, 300, 15, 15);
  ellipse(430, 200, 15, 15);
  text("food", 200, 320);
  text("rest", 430, 220);


  myAnt1.life();
  myAnt1.display();
  myAnt1.think();
}

class Ant { 
  color c;
  float x_pos;
  float y_pos;
  float x_speed;
  float hunger;
  float t;


  Ant(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempHunger, float tempT) { 
    c = tempC;
    x_pos = tempXpos;
    y_pos = tempYpos;
    x_speed = tempXspeed;
    hunger = tempHunger;
    t = tempT;
  }

  void life() {
    text(hunger, 20, 80);
    hunger = hunger - 0.01;
    text(t, 20, 100);
    t = t - 0.05;
  }

  void display() {
    stroke(0);
    fill(c);
    ellipse(x_pos, y_pos, 10, 10);
  }

  void think() {

    if ((hunger < 2) && (x_pos != 200) && (y_pos != 300)) {

      if (x_pos < 200) {
        x_pos = x_pos + x_speed;
      }
      if (x_pos > 200) {
        x_pos = x_pos - 5;
      }
      if (y_pos < 300) {
        y_pos = y_pos + 2;
      }
      if (y_pos > 300) { 
        y_pos = y_pos - 5;
      }
    }

    if ((x_pos ==200) && (y_pos == 300) && (hunger <15)) {
      hunger = hunger + 2;
    }


    if ((hunger > 15)  && (y_pos != 200)) {
      y_pos = y_pos - 2; 

      if (x_pos != 430) {
        x_pos = x_pos + 5;
      }
    }

    if ((x_pos == 430) && (y_pos == 200)) {
      t = t + 0.1;
    }
  }
}



