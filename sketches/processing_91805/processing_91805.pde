
//Carla Campos-Rodriguez
// March 3,2013
// Forloop

int spacing=1;
void setup() {
  size(600, 600);
  smooth();
}
void draw() {

  background(243, 197, 250);//lavender
  smooth();
  noStroke();
  for ( int x = 0; x<width; x+=10 ) { 
    stroke(random(34), random(242), 240);
    strokeWeight(3);
    //stroke( x, x, 0);
    line(mouseX, mouseY, x, 100);
  }
  for ( int x = 0; x<width; x+=10 ) { 
    stroke(random(34), random(242), 240);
    strokeWeight(3);
    //stroke( x, x, 0);
    line(mouseX, mouseY, x, 0);
  }

  for ( int x = 0; x<width; x+=10 ) { 
    stroke(random(247), random(157), 242);
    strokeWeight(2);
    //stroke( x, x, 0);
    line(mouseX, mouseY, x, 600);
  }



  for ( int x = 0; x<width; x+=10 ) { // middle
    stroke(random(247), random(157), 242);
    strokeWeight(2);
    //stroke( x, x, 0);
    line(mouseX, mouseY, x, 300);
  }

  for ( int x = 0; x<width; x+=10 ) { // middle
    stroke(random(247), random(157), 242);
    strokeWeight(2);
    //stroke( x, x, 0);
    line(mouseX, mouseY, x, 500);
  }

  if (mousePressed==true) {

    //color lines
    smooth();
    noStroke();
    for ( int x = 0; x<width; x+=10 ) { 
      stroke(5, 242, 228,120);
      strokeWeight(4);
      //stroke( x, x, 0);
      line(mouseX, mouseY, x, 0);
    }
    smooth();
    noStroke();
    for ( int x = 0; x<width; x+=10 ) { 
      stroke(5, 242, 228,120);
      strokeWeight(4.5);
      //stroke( x, x, 0);
      line(mouseX, mouseY, x, 600);
    }

    for (int x = 0; x<width; x+=mouseX+10) {
      stroke(185, 125, 234,120);
      strokeWeight(2);
      smooth();
      line (mouseX, mouseY, x, 0);
    }
    for (int x = 0; x<width; x+=mouseX+10) {
      stroke(185,125,234,120);
      strokeWeight(2);
      smooth();
      line (mouseX, mouseY, x, 600);
    }
  }
}
