
int b1 = 0;
int b2 = 0;
int b3 = 0;

int b1Pin = 2;
int b2Pin = 3;
int b3Pin = 4;

int ledPin = 9;

int state = LOW;
int blinkRate = 0;

boolean sineWave = false;
boolean sawtoothWave = false;

int c = 0;
int p = 0;

void setup() { 

  pinMode(b1Pin, INPUT);
  pinMode(b2Pin, INPUT);
  pinMode(b3Pin, INPUT);

  pinMode(ledPin, OUTPUT);

  Serial.begin(9600);
}

void loop() {

  b1 = digitalRead(b1Pin);
  b2 = digitalRead(b2Pin);
  b3 = digitalRead(b3Pin);

  b1 = !b1;
  b2 = !b2;
  b3 = !b3;

  c = millis();
  if (c - p > blinkRate) {
    p = c;
    state = !state;
  }

  if (b1)
    blinkRate = 75;

  if (b2)
    blinkRate = 150;

  if (b3)
    blinkRate = 400;

  if (b1 && b2)
    sineWave = true;
  else
    sineWave = false;

  if (b2 && b3)
    sawtoothWave = true;
  else
    sawtoothWave = false;

  if (sineWave) {
    float sine = sin(millis() / 100);
    sine += 1;
    sine /= 2;
    sine *= 255;
    analogWrite(ledPin, sine);
  }

  else if (sawtoothWave) {
    float sawtooth = millis() / 5 % 255;
    analogWrite(ledPin, sawtooth);
  }

  else {
    digitalWrite(ledPin, state);
  }
}
