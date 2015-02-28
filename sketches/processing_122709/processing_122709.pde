
int x, y; 


void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(99);
  frameRate(10);
  noStroke();
  smooth();
  fill(0);

  PFont font = createFont("Naiv-Fat", 42);
  textFont(font, 24);
}   //fotonsettei


void draw() {
  if (keyPressed) {
    //ki-bo-dogaosaretatoki 


    if (key == 'm') {
      //m gaosaretatoki

      {
        fill(random(100), 40, 99);
        noStroke();
        smooth();
        ellipse(mouseX, mouseY, pmouseX/2, pmouseX/2);
        //randomcolor randommaru
      }
    } 

    else {
      textAlign(CENTER);
      fill(random(50), 100);
      text(key, random(width), random(height));
    } //soreigainokyewoositatoki
  }
}


void mousePressed() {

  if (mouseButton == LEFT) {
    rect(mouseX, mouseY, 50, 50);
  }//kurikkusitatokini sikaku
  
  else if (mouseButton == CENTER) {
    ellipse(mouseX, mouseY, 60, 60);
  }  //kurikkusitatokini maru
  
  else if ( mouseButton == RIGHT ) {
    background(99);
  }//kurikkusitatokini hakusi
}




