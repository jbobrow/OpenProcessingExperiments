
void setup()
{
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  background(0,0,0);
 
}

void draw()
{
  float sekunde = map(second(), 0, 60, 0, 250);

  float sekundenfarbe = map(second(),0,60,0,255);

  background(0,0,0);

  //Grundkreis
  pushMatrix();
  stroke(100);
  strokeWeight(2);
  noFill();
  ellipse(250, 250, 250, 250);
  popMatrix();

  //Sekundenkreis
  pushMatrix();
  noStroke();
  fill(sekundenfarbe);
  ellipse (250, 250, sekunde, sekunde);
  popMatrix();

  float minutes;

  //Minutenrechtecke
  
  for (int i=0; i<minute (); i=i+1) { //die for Schleife fasst alles ein und erstellt für jedes  Rechteck eine Matrix
    pushMatrix();
    translate(250, 250);
    minutes = map(i, 0, 60, 0, 2*PI); //variable i als value für map. i zählt von 0 hoch bis zur aktuellen minutenzahl (in 1er schritten)
    rotate(minutes); 
    println(minutes); //Zeigt dir den 
    
      pushMatrix();
    noFill();
    
    float minutenfarbe = map(second(),0,60,0,350);
    
    stroke(minutenfarbe, 100, 100);
    rectMode(CENTER);
    translate(0,-125);
    rotate(radians(45));
    rect(0,0, 13, 13);
      popMatrix();
        
    popMatrix();
  }



  float stunde = map(hour(), 0, 12, 0, 2*PI);

  //Stundenkreis
  pushMatrix();
  translate(250, 250);
  ellipseMode(CENTER);
  noStroke();
  
  float stundenfarbe = map(second(),0,60,0,350);
  
  fill(stundenfarbe, 100, 100);
  rotate(stunde);
  ellipse(0, -90, 30, 30);
  popMatrix();
}
