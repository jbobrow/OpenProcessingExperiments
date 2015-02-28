
class Molec
{
  float xPos, yPos;
  int pin;

  Molec(int x, int y, int p) {
    xPos = x;
    yPos = y;
    pin = p;
  }


  void update() {
    arduino.pinMode(pin, Arduino.OUTPUT);


    smooth();
    strokeWeight(1);
    stroke(0);
    println(xPos);
    float d =  dist(mouseX, mouseY, xPos, yPos);

    if (d<=5) {
      fill(0);
      arduino.digitalWrite(pin, Arduino.HIGH);
    }
    else {
      fill(255);
      arduino.digitalWrite(pin, Arduino.LOW);
    }

    ellipse(xPos, yPos, 10, 10);
  }
}


