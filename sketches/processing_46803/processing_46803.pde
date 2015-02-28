

void setup() {
size(500, 500);
smooth();
}


void draw() {
  background (#DCEEF5);
  for (int x=5; x<width+90; x+=90){
chinaWomen (x,100);
  }
  for (int x=5; x<width+90; x+=90){
    chinaWomen (x,220);
  }
  for (int x=5; x<width+90; x+=90){
    chinaWomen (x,340);
  }
  for (int x=5; x<width+90; x+=90){
    chinaWomen (x,460);
  }
}

void chinaWomen (int x, int y) {
  
  pushMatrix();  
translate(x, y);
noStroke();
smooth();
ellipse(-15,-15,90,90); // Haar
fill(0);
ellipse(-15,-50,65,65); // Zopf
fill(255);
ellipse(-15,-5,70,70); // Gesicht
fill(0);
bezier(-60, -53, -40, -59, -10, -44, 30, -60); // Haarstab
stroke(0);
strokeWeight(1);
line(-35,-15,-22,-11);
line(-5,-11,7,-15);
fill(0);

if (mousePressed == true) {
fill(255,0,0);
ellipse(-15,10,30,30); // offener Mund
stroke(0);
fill(255);
ellipse(1,-15,20,20); // rechtes Auge
ellipse(-30,-15,20,20); // linkes Auge
noStroke();
fill(0);
ellipse(1,-15,5,5); // rechte Pupille
fill (0);
ellipse(-30,-15,5,5); // linke Pupille
fill(0);


}

popMatrix();
}

