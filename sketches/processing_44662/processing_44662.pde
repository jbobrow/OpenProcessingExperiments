
boolean drawLine = false;

void setup() {
  size(500, 600);
  smooth();
  background(255);
  //  frameRate(600);
  //  noStroke ();

  float box_size = 10; 
  float box_space = 22; 
  int margin = 0; 
  



  for (int i = margin; i < height-margin; i += box_space) {
    if (box_size > 0) {
      for (int j = margin; j < width-margin; j+= box_space) {
        fill(255-box_size*10);
        rect(j, i, box_size, box_size);
      }
      box_size = box_size - 0.6;
    }
  }


  for (int diameter=255; diameter > 0; diameter = diameter - 12) {
    fill (diameter, 150, 200);
    ellipse (width / 2, height / 2, diameter, diameter);
  }

  fill(255, 255, 255);
}



void draw() {
  
  float noiseScale=0.02;

  
  if (keyPressed) {

    if (key=='0') stroke(#FFFFFF);
    if (key=='1') stroke(#000000);
    if (key=='2') stroke(#5656FF);
    if (key=='3') stroke(#FF2300);
    if (key=='4') fill(255, 255, 255);
    if (key=='5') fill(219, 187, 135);
    if (key=='6') noStroke();
    if (key=='7') background(200);
    if (key=='8') for(int x=0; x < width; x++) {
                float noiseVal = noise((mouseX+x)*noiseScale, 
                                        mouseY*noiseScale);
                stroke(noiseVal*255);
                line(x, mouseY+noiseVal*80, x, height);
                }
    if (key=='9') rect(pmouseX-random(-3, 40), mouseY+random(-40, 100), 5, 5);
  }

  if (mousePressed) {
    //   stroke(#FF2300);
    strokeWeight(dist(mouseX/5000, mouseY/100, 0, 0));
    ellipse(pmouseX, pmouseY, mouseY/10, 10);
    filter(BLUR,1);
    //   filter(POSTERIZE,10);
  }

  if (drawLine==true) line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyReleased() {
  if (key=='a')drawLine = !drawLine;
}




