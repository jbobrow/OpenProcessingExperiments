
void setup() {
  size(500, 500);
}

void draw() 
{
  background(255);

  if (hour() >= 0 && hour() < 8)
 {
  pushMatrix();
  translate(width/4, height/4);
  fill(125);
  noStroke();
  ellipse(0, 0, 90, 90);
  fill(255);
  ellipse(0, -10, 90, 80);
  ellipse(0, 0, 90, 70);
  popMatrix();
  
  //rechtes auge
  pushMatrix();
   translate(width/1.35, height/4);
    fill(125);
  noStroke();
  ellipse(0, 0, 90, 90);
  fill(255);
 ellipse(0, -10, 90, 80);
  ellipse(0, 0, 90, 70);
  popMatrix();
   
//Mund
 float s = map(second(),0, 30, 0, 60);
  pushMatrix();
  translate(width/2, height/1.35);
 
 fill(0);
  ellipse(0,0,s+60,s+10);
   fill(255,0,0);
  ellipse(0,0,s+50,s);

  //Z
 
  fill(0);
  rect(100,-100,30,10);
  rect(100,-130,30,10);
  pushMatrix();
  translate(100,-102.5);
  rotate(-QUARTER_PI);
  rect(0,0,30,10);
  popMatrix();
  
  //z
   rect(50,-50,20,5);
  rect(50,-70,20,5);
  pushMatrix();
  translate(50,-52.5);
  rotate(-QUARTER_PI);
  rect(0,0,20,5);
  popMatrix();
  
  rect(73,-73,25,7.5);
  rect(73,-93,25,7.5);
  pushMatrix();
  translate(73,-74.5);
  rotate(-QUARTER_PI);
  rect(0,0,25,7.5);
  popMatrix();
  
  popMatrix();
  

    //Nase
  pushMatrix();
 translate(width/2, height/2);
  fill(125);
  noStroke();
  ellipse(0, 0, 150, 100);
  fill(255);
  noStroke();
  ellipse(-30, 0, 15, 25);
  ellipse(30, 0, 15, 25);
  popMatrix();
 }
 
else if ((hour() >= 8 && hour() < 10))
 //Frühstück 
  {
    //messer
    fill(0);
    rect(width/16, height/1.6, 15, 130, 3);
    ellipse(width/13, height/1.9, 35, 110);
    fill(255);
    rect(width/10.9, height/2.45, 20, 110);
    //gabel
    fill(0);
    ellipse(width/1.08, height/1.65, 25, 20);
    rect(width/1.10, height/1.6, 15, 130, 3);
    ellipse(width/1.10, height/1.9, 5.5, 70);
    ellipse(width/1.08, height/1.9, 5, 70);
    ellipse(width/1.06, height/1.9, 5.5, 70);
  }

//Mittag
    else if ((hour() >= 12 && hour() < 14))
       {
    //messer 
    fill(0);
    rect(width/16, height/1.6, 15, 130, 3);
    ellipse(width/13, height/1.9, 35, 110);
    fill(255);
    rect(width/10.9, height/2.45, 20, 110);
    //gabel
    fill(0);
    ellipse(width/1.08, height/1.65, 25, 20);
    rect(width/1.10, height/1.6, 15, 130, 3);
    ellipse(width/1.10, height/1.9, 5.5, 70);
    ellipse(width/1.08, height/1.9, 5, 70);
    ellipse(width/1.06, height/1.9, 5.5, 70);
  }
  
 //Abend
  else if ((hour() >= 18 && hour() < 20))
   {
    //messer 
    fill(0);
    rect(width/16, height/1.6, 15, 130, 3);
    ellipse(width/13, height/1.9, 35, 110);
    fill(255);
    rect(width/10.9, height/2.45, 20, 110);
    //gabel
    fill(0);
    ellipse(width/1.08, height/1.65, 25, 20);
    rect(width/1.10, height/1.6, 15, 130, 3);
    ellipse(width/1.10, height/1.9, 5.5, 70);
    ellipse(width/1.08, height/1.9, 5, 70);
    ellipse(width/1.06, height/1.9, 5.5, 70);
  }
  
  if (hour() >= 8 && hour() < 24)
  {
  //Mund
  pushMatrix();
  translate(width/2, height/2);
  fill(0);
  noStroke();
  ellipse(0, -10, 350, 350);
  fill(255);
  ellipse(0, -10, 360, 230);
  ellipse(0, -80, 360, 230);

  popMatrix();
 
  float min = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);

  //Augen: Stunden + Minuten
  pushMatrix();

  translate(width/4, height/4); //in die Mitte springen
  fill(125);
  noStroke();
  ellipse(0, 0, 110, 110);
  for (int i=0; i<360; i+=10) //360 grad in 20° schritten
  {
    pushMatrix();
    rotate(radians(i)); // um i rotieren
    translate(0, -60);    // um radius verschieben -i/2.0 Schnecke wird  kleiner
    stroke(0);
    line(0, 0, 0, -10);
    popMatrix();
  }
  //Minuten
  rotate(radians(min)); // Um min rotieren
  translate(0, -40); // Um Radians verschieben
  fill(0);
  ellipse(0, 0, 20, 20);
  popMatrix();

  //stunden
  pushMatrix();
  translate(width/1.35, height/4);
  fill(125);
  noStroke();
  ellipse(0, 0, 110, 110);
  for (int i=0; i<360; i+=30) //360 grad in 20° schritten
  {
    pushMatrix();
    rotate(radians(i)); // um i rotieren
    translate(0, -60);    // um radius verschieben -i/2.0 Schnecke wird  kleiner
    stroke(0);
    line(0, 0, 0, -10);
    popMatrix();
  }
  rotate(radians(h));

  translate(0, -35);
  fill(0);
  noStroke();
  ellipse(0, 0, 30, 30);
  popMatrix();

  //Zunge: Sekunden

  translate(width/2, height/2);

  pushMatrix();
  float sec = map(second(), 0, 60, 110, 230);

  rotate(radians(sec)); // Um sec rotieren
  translate(0, -250); // Um Radians verschieben

  fill(255, 0, 0);
  noStroke();
  rect(0, 0, 50, 100, 30);
  stroke(0);
  line(25, 100, 25, 10);

  popMatrix();

  //Nase
  pushMatrix();

  fill(125);
  noStroke();
  ellipse(0, 0, 200, 150);
  fill(255);
  noStroke();
  ellipse(-30, 0, 20, 30);
  ellipse(30, 0, 20, 30);
  popMatrix();
    
}
}

