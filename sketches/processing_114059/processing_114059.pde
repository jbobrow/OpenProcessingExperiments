
int startingTime;

void setup() {

  size(800, 800);
  background(255);
  startingTime = millis() - 1000*(second());

}

void draw() {

  // Float et int
  float se =  (millis() - startingTime) / 1000.0;
  float c = se% 60;
  float v =map((c), 0, 60, TWO_PI, 0);
  float e =map(second(), 0, 60, 0, 255);
  float e2 =map(second(), 0, 60, 225, 0);
  float f =map(second(), 0, 60, 230, 100);
  float f2 =map(second(), 0, 60, 100, 230);
  float b =map(second(), 30, 59, 0, 80);
  float v3= map(minute(), 0, 60, 0.0, 10.0);

  float frame1 = map(minute(), 0, 60, 1, 20);
  float frame2 = map(minute(), 0, 60, 70, 90);
  int ratea= int(frame1);
  int rateb= int(frame2);

  float hrs = hour();
  if (hour() > 12) {
    hrs = hour() - 12;
  }
  float hr = map(hrs, 0, 12, 10, 200);
  
  // Rate control

  frameRate(20);


  if (v > 0.000000 && v < 0.00999) {
      background(245,245,245);
  }

  // hour Cercle

  pushMatrix();

  strokeWeight((1/6));
  stroke(e2, f2, f2, 50);
  translate(width/2, height/2);
  line(0, hr, sin((v)+PI)*(hr), (cos((v)+PI)*(hr)));
  line(0, -hr, sin((v)+PI)*(hr), (cos((v)+PI)*(hr)));
  line(hr, 0, sin((v)+PI)*(hr), (cos((v)+PI)*(hr)));
  line(-hr, 0, sin((v)+PI)*(hr), (cos((v)+PI)*(hr)));

  popMatrix();


  // seconde cercle

  pushMatrix();

  strokeWeight((1/2));
  stroke(e, f, f, 50);
  translate(width/2, height/2);
  line(0, 200, sin((v)+PI)*(200), (cos((v)+PI)*(200)));
  line(0, -200, sin((v)+PI)*(200), (cos((v)+PI)*(200)));
  line(200, 0, sin((v)+PI)*(200), (cos((v)+PI)*(200)));
  line(-200, 0, sin((v)+PI)*(200), (cos((v)+PI)*(200)));

  popMatrix();

}
