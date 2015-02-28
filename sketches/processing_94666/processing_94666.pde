
float winkel = 0.0;
float radius = 100.0;
float radius2 = 200.0;
float winkel2 = 0.0;



void setup() {
  size (800, 800);
  smooth();
  noFill();
}
void draw() {
  background(0);
  //vollkreis darstellen
  stroke(255, 255, 0);
  strokeWeight(2);

  //  ellipse(width/2, height/2, radius*2, radius*2);
  //x,y,koordinaten
  float x = width/2 + radius * cos(winkel);
  float y = height/2 - radius * sin(winkel);
  //-----------
  float xx = width/2 - radius * cos(winkel);
  float yy = height/2 + radius * sin(winkel);
  //----------radius 2
  float xxx = width/2 + radius2 * cos(winkel2);
  float yyy = height/2 - radius2 * sin(winkel2);
  //-----------
  float xxxx = width/2 - radius2 * cos(winkel2);
  float yyyy = height/2 + radius2 * sin(winkel2);

  float xspecial = x - radius2 * cos(winkel2);
  float yspecial = y + radius2 * sin(winkel2);

  float xspecial2 = xx - radius2 * cos(winkel2);
  float yspecial2 = yy + radius2 * sin(winkel2);


  float xspecial3 = xxx - radius2 * cos(winkel2);
  float yspecial3 = yyy + radius2 * sin(winkel2);




  //Kreispunkt darstellen
  stroke(255, 0, 0);
  strokeWeight(2);
  //line(width/2,height/2,x,y);//no
  fill(0, 255, 255);
  ellipse(x+winkel, y+winkel2, 15, 15);//hellblau mini 
  noFill();
  fill(0, 14, 50);
  ellipse(xspecial2-40, yspecial, 60, 60);//Blaugroß
  ellipse(width/2, height/2, 10, 10);
  noFill();



  fill(0, 2, 255);
  ellipse(xspecial, yspecial, 15, 15);//Blau mini
  noFill();

  //radius 2 
  fill(0, 255, 255);
  ellipse(xx, yy, 30, 30);//no
  noFill();
  fill(255, 255, 0);
  ellipse(xx-40, y, 40, 40);//Gelb
  noFill();
  // Grün
  fill(25, 255, 0);
  ellipse(yyy+70, xxx, 40, 40);
  noFill();

  fill(0, 2, 255);
  ellipse(xxx, yyy, 30, 30);//blau aussen
  noFill();

  winkel +=0.01; //erhöhung des winkelwertes
  winkel2 +=0.015;
}



