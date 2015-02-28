
float counter = 0;
void setup()
{
  size(500, 500);
}
void draw()
{
  if (hour()<=17) // TAG
  {
    colorMode(RGB, 255);
    background(255);
    //Kreisbahn
    translate(width/2, height/2); 
    noFill();
    ellipse(0, 0, 450, 450);
    //Stundenzeiger
    float std = map(hour(), 0, 12, 0, 360);
    pushMatrix();
    rotate(radians(std)); // Um i rotieren
    translate(0, -150); // Um Radius verschieben
    fill(240);
    ellipse(0, 0, 150, 150);
    //Minutenzeiger 
    float min = map(minute(), 0, 60, 0, 360); 
    rotate(-radians(std));
    rotate(radians(min)); //
    translate(0, -67); // Um Radius verschieben
    fill(0);
    ellipse(0, 0, 15, 15);
    popMatrix();
    //Sekundenzeiger
    if (mousePressed==true) {
    }
    else {
      stroke(0);
      colorMode(HSB, 360, 100, 100);
      float h = map(sin(counter), -1, 1, 0, 360);
      fill(h, 100, 100);
      counter += 0.01;
      float sec = map(second(), 0, 60, 0, 360);
      pushMatrix();
      rotate(radians(sec));
      translate(0, -225);
      ellipse(0, 0, 10, 10);
      popMatrix();
    }
  }
  else if (hour() >=17 && hour() <=8)// NACHT
  {
    colorMode(RGB,255);
    background(0);
    stroke(255);

    translate(width/2, height/2); 
    noFill();
    ellipse(0, 0, 450, 450);
    //Stundenzeiger
    float std = map(hour(), 0, 12, 0, 360);
    pushMatrix();
    rotate(radians(std)); // Um i rotieren
    translate(0, -150); // Um Radius verschieben
    fill(30);
    ellipse(0, 0, 150, 150);
    //Minutenzeiger 
    float min = map(minute(), 0, 60, 0, 360); 
    rotate(-radians(std));
    rotate(radians(min)); //
    translate(0, -67); // Um Radius verschieben
    fill(255);
    ellipse(0, 0, 15, 15);
    popMatrix();

    if (mousePressed==true) {
    }
    else {
      //Sekundenzeiger
      colorMode(HSB, 360, 100, 100);
      float h = map(sin(counter), -1, 1, 0, 360);
      fill(h, 100, 100);
      counter += 0.01;
      float sec = map(second(), 0, 60, 0, 360);
      pushMatrix();
      rotate(radians(sec));
      translate(0, -225);
      ellipse(0, 0, 10, 10);
      popMatrix();
    }
  }
}
