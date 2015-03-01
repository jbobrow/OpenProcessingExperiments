
import java.util.*;

List<Stripe> stripes = new ArrayList<Stripe>();
float stripeWidth = 30;
float dampIn = .08;
float dampOut = .15;
float alpha = 200;
void setup() {
  size(800, 600);
}

void draw() {
  if (round(random(2)) == 0)
   addStripe();
  background(100);

  for (Iterator<Stripe> iterator = stripes.iterator (); iterator.hasNext(); ) {
    Stripe stripe = iterator.next();
    stripe.draw();

  }
}

void mousePressed() {
  addStripe();
}

void addStripe() {
  stripes.add(new Stripe());
}

class Stripe {
  PVector vector1, vector2;
  float x1, y1, x2, y2;
  boolean switched = false;
  boolean xFlat;
  boolean dead = false;
  int stripeColor;
  Stripe() {
    float r = random(1);
    if (r < .2) {
      stripeColor = color(34, 71, 94, alpha);
    } else  if (r < .4) {
      stripeColor = color(117, 176, 138, alpha);
    } else  if (r < .6) {
      stripeColor = color(240, 231, 151, alpha);
    } else  if (r < .8) {
      stripeColor = color(255, 157, 132, alpha);
    } else {
      stripeColor = color(255, 84, 96, alpha);
    }

    this.vector1 = new PVector(random(0, width), random(0, height));
    this.vector2 = new PVector(random(0, width), random(0, height));
    vector2.x = (vector1.y - vector2.y) + vector1.x;

    // switch things around (im too cowardly to think about math for real)
    if (round(random(1)) == 0) {
      PVector v = this.vector1;
      this.vector1 = vector2;
      this.vector2 = v;
    }

    if (round(random(1)) == 0) {
      float x = this.vector1.x;
      this.vector1.x = vector2.x;
      this.vector2.x = x;
    }

    x1 = x2 = this.vector1.x;
    y1 = y2 = this.vector1.y;
    xFlat = (round(random(0)) == 0);
  }

  void draw() {
    // the java to js stuff processing is doing breaks iterator.remove(), using this nasty hack
    if (dead) { return; }
    fill(stripeColor);
    noStroke();
    x2 += (this.vector2.x - x2) * dampIn;
    y2 += (this.vector2.y - y2) * dampIn;
    if (abs(x2 - this.vector2.x) < 1) {
      switched =true;
    }
    if (switched) {
      x1 += (this.vector2.x - x1) * dampOut;
      y1 += (this.vector2.y - y1) * dampOut;

      if (abs(x1 - this.vector2.x) < 1) {
        dead = true;
      }
    }
    beginShape();
    if (xFlat) {
      vertex(x1 - stripeWidth, y1);
      vertex(x1 + stripeWidth, y1);
      vertex(x2 + stripeWidth, y2);
      vertex(x2 - stripeWidth, y2);
      vertex(x1 - stripeWidth, y1);
    } else {
      vertex(x1, y1 - stripeWidth);
      vertex(x1, y1 + stripeWidth);
      vertex(x2, y2 + stripeWidth);
      vertex(x2, y2 - stripeWidth);
      vertex(x1, y1 - stripeWidth);
    }
    endShape();
  }
}

