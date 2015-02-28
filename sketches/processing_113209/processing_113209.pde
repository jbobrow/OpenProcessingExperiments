
void setup() {
  size(800, 700);
  background(#1F9B7D);

  int numObjectsHoriz = 14;
  int numObjectsVert = 12;

  int intervalHoriz = width/numObjectsHoriz;
  int intervalVert = height/numObjectsVert;

  float scale = 0.4;

  for (int i = 1; i < numObjectsHoriz; i++) {
    int posX = intervalHoriz * i;
    for (int j = 1; j < numObjectsVert; j++) {
      int posY = intervalVert * j;

      if ((i % 3 == 0 && j % 3 == 0) 
        || (i % 3 == 1 && j % 3 == 1)
        || (i % 3 == 2 && j % 3 == 2)) {
        drawNose(posX, posY, scale);
      } 
      else if ((i % 3 == 0 && j % 3 == 1)
        || (i % 3 == 1 && j % 3 == 2)
        || (i % 3 == 2 && j % 3 == 0)) {
        drawMouth(posX, posY, scale);
      } 
      else {
        if (j % 2 == 0) {
          drawEar(posX, posY, scale, true);
        } else {
          drawEar(posX, posY, scale, false);
        }
      }
    }
  }
}

void draw() {
  //  if (mousePressed) {
  //    drawNose(mouseX, mouseY);
  //  }
}

void drawNose(int x, int y, float scale) {
  noStroke();
  fill(255, 234, 217);
  //nose bridge
  triangle(x-(28*scale), y+(80*scale), x, y, x+(28*scale), y+(80*scale));
  //flesh surrounding nostrils
  ellipse(x, y+(70*scale), 70*scale, 40*scale);

  stroke(255, 234, 217);
  strokeWeight(40*scale);
  //nose tip
  line(x, y+(60*scale), x, y+(75*scale));

  noStroke();
  fill(#1F9B7D);
  //nostrils
  ellipse(x-(20*scale), y+(84*scale), 12*scale, 10*scale);
  ellipse(x+(20*scale), y+(84*scale), 12*scale, 10*scale);
}

void drawEar(int x, int y, float scale, boolean left) {
  int startAngle;
  int endAngle;

  //left ear angles
  if (left) {
    startAngle = 90;
    endAngle = 270;
  } 
  else { //right ear angles
    startAngle = -90;
    endAngle = 90;
  }

  noStroke();
  fill(255, 234, 217);
  //larger part of ear
  arc(x, y, 70*scale, 80*scale, radians(startAngle), radians(endAngle));
  //ear lobe
  arc(x, y+(30*scale), 50*scale, 50*scale, radians(startAngle), radians(endAngle));

  noFill();
  stroke(#1F9B7D);
  strokeWeight(5*scale);
  //arc line inside of ear
  arc(x, y+(5*scale), 30*scale, 50*scale, radians(startAngle), radians(endAngle));
}


void drawMouth(int x, int y, float scale) {
  noStroke();
  fill(255, 234, 217);
  //upper lips
  arc(x-(20*scale), y, 50*scale, 50*scale, radians(180), radians(360));
  arc(x+(20*scale), y, 50*scale, 50*scale, radians(180), radians(360));
  //bottom lip
  arc(x, y+(5*scale), 90*scale, 50*scale, radians(0), radians(180));
}
