
void setup() {
  smooth();
  size (400,400);
  background(255);
}

void draw() {
  int mitte = (400/2);
  
  //Kopf
  fill(#FAFF08);
  stroke(10);
  ellipse(mitte,mitte,width-10,height-10);

  //Mund
   stroke(10);
   noFill();
   ellipse(mitte, mitte, mitte, mitte);
   //Mund überdecken
   rectMode(CENTER);
   noStroke();
   fill(#FAFF08);
   rect(mitte, mitte-50,220,150);

  //Auge
  stroke(10);
  strokeWeight(10);
  line(mitte-40,mitte-70,mitte-40,mitte-100);
  line(mitte+40,mitte-70,mitte+40,mitte-100);
}

//Alles mal ausprobieren ✔
