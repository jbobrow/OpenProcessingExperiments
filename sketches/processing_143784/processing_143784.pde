
void setup ()
{
  size (500, 500);
  background (255);
  noStroke();
}

void draw ()
{
  //allgemein
  background (255);
  float s = map(second(), 0, 60, 0, 360);
  float m = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);
  //allgemein END

  //UhrflÃ�Â¤che
  stroke(100);
  strokeWeight(30);
  ellipse(width/2, height/2, 440, 440); //Rand
  noStroke();
  fill(20);
  ellipse(width/2, height/2, 420, 420); //Mitte
  ellipseMode(CENTER);
  //UhrflÃ�Â¤che END

  //Uhr
  translate(width/2, height/2); 
  for (int i=0; i<=360; i+=30) 
  { 
    //Kreise fÃ�Â¼r Stunden
    pushMatrix();
    rotate(radians(i)); 
    translate(0, 200); 
    fill(200);
    ellipse(0, 0, 20, 20);
    popMatrix();
    //Kreise fÃ�Â¼r Stunden END
  }

  for (int i=0; i<=360; i+=6) 
  {
    //Striche fÃ�Â¼r Minuten
    pushMatrix();
    rotate(radians(i)); 
    translate(0, 194); 
    fill(200);
    rect(0, 0, 1, 15);
    noFill();
    popMatrix();
    //Striche fÃ�Â¼r Minuten END
  }

  //Stundenzeiger
  pushMatrix();
  rotate(radians(180+h));
  noStroke();
  fill(240);
  rect(0, 0, 8, 120);
  noFill();
  popMatrix();
  //Stundenzeiger END

  //Minutenzeiger
  pushMatrix();
  rotate(radians(180+m));
  noStroke();
  fill(240);
  rect(0, 0, 4, 180);
  noFill();
  popMatrix();
  //Minutenzeiger END

  //Sekundenzeiger
  pushMatrix();
  rotate(radians(180+s));
  noStroke();
  fill(100, 200, 255);
  rect(0, 0, 2, 185);
  noFill();
  popMatrix();
  //Sekundenzeiger END

  //Uhr END
}

