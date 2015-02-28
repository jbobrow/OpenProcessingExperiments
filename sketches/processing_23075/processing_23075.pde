
void setup() {
  size(300,1000); //create a canvas 300x300pixels
  background(#FCFCFC);
  smooth();
}

void draw() {

  int centerX = (width/2);
  int shake = 4;
  //int centerY = (height/2);
  //int centerX = (mouseX);
  float centerY = (mouseY +- int (random(shake-4, shake)));

  background (255,255,255);
  for (int y = 20; y < height; y += 20) {
    for (int x = 20; x < width; x += 20) {
      ellipse(x, y, 6, 6);
    }
  }
  if(mousePressed) {
    background(random(255),255,random(255));
    shake = 200;
    fill(#3F91E0); //blue flames
    beginShape();
    vertex(centerX+42, centerY+145);
    vertex(centerX-42, centerY+145);
    vertex(centerX, random(centerY+280, centerY+350));
    endShape(CLOSE);
    fill(#BF68EA); //purple flames
    beginShape();
    vertex(centerX+42, centerY+145);
    vertex(centerX-42, centerY+145);
    vertex(centerX, random(centerY+250, centerY+300));
    endShape(CLOSE);
  }

  //start creature
  fill (#FCFCFC);

  //rockets
  fill(#5A5A54);
  quad (centerX+48, centerY-200, centerX-48, centerY-200, centerX-48, centerY+145, centerX+48, centerY+145); //center rocket
  arc (centerX, centerY-200, 96, 80, PI, TWO_PI); //center dome

  fill(#4D4D46);
  quad (centerX+50, centerY+40, centerX+70, centerY+40, centerX+70, centerY+150, centerX+50, centerY+150); //right rocket
  fill(#2E2E25);
  triangle (centerX+50, centerY+40, centerX+70, centerY+40, centerX+60, centerY-10); //right cone
  arc (centerX+60, centerY+40, 20, 80, PI, TWO_PI); //right dome
  triangle (centerX+70, centerY+150, centerX+80, centerY+150, centerX+70, centerY+120); //right right fin
  triangle (centerX+50, centerY+150, centerX+40, centerY+150, centerX+50, centerY+120); //right left fin
  quad (centerX+50, centerY+60, centerX+48, centerY+60, centerX+48, centerY+110, centerX+50, centerY+110);

  fill(#4D4D46);
  quad (centerX-50, centerY+40, centerX-70, centerY+40, centerX-70, centerY+150, centerX-50, centerY+150); //left rocket
  fill(#2E2E25);
  triangle (centerX-50, centerY+40, centerX-70, centerY+40, centerX-60, centerY-10); //left cone
  arc (centerX-60, centerY+40, 20, 80, PI, TWO_PI); //right dome
  triangle (centerX-70, centerY+150, centerX-80, centerY+150, centerX-70, centerY+120); //left right fin
  triangle (centerX-50, centerY+150, centerX-40, centerY+150, centerX-50, centerY+120); //left left fin
  quad (centerX-50, centerY+60, centerX-48, centerY+60, centerX-48, centerY+110, centerX-50, centerY+110);

  //flames
  fill(#F50723); //red flames
  beginShape();
  vertex(centerX+50, centerY+150);
  vertex(centerX+70, centerY+150);
  vertex(centerX+60, random(centerY+220, centerY+250));
  endShape(CLOSE);
  beginShape();
  vertex(centerX-50, centerY+150);
  vertex(centerX-70, centerY+150);
  vertex(centerX-60, random(centerY+220, centerY+250));
  endShape(CLOSE);
  fill(#FCAC14); //yellow flames
  beginShape();
  vertex(centerX+50, centerY+150);
  vertex(centerX+70, centerY+150);
  vertex(centerX+60, random(centerY+180, centerY+210));
  endShape(CLOSE);
  beginShape();
  vertex(centerX-50, centerY+150);
  vertex(centerX-70, centerY+150);
  vertex(centerX-60, random(centerY+180, centerY+210));
  endShape(CLOSE);

  //nuclear symbol
  fill(#FF0015);
  ellipse (centerX, centerY-220, 25, 23);
  for(float i = PI/7; i <= TWO_PI; i += TWO_PI/6) {
    fill(#FAFF00);
    arc (centerX, centerY-220, 25, 23, i, i+TWO_PI/6);
    i = i + (TWO_PI/6);
    noFill();
    arc (centerX, centerY-220, 25, 23, i, i+TWO_PI/6);
  }

  //body
  fill(#FCFCFC);
  ellipse (centerX, centerY, 15, 200);
  ellipse (centerX - 15, centerY+100, 30, 30);
  ellipse (centerX - 15, centerY+100, 10, 10);
  fill(#FFE5BF, 150);
  ellipse (centerX, centerY, 15, 200);
  ellipse (centerX - 15, centerY+100, 30, 30);
  ellipse (centerX - 15, centerY+100+-random(2), 10, 10);

  //ropes
  for (int j = 1; j<=20; j += 4) {
    line (centerX+48, centerY-j, centerX-48, centerY+10-j);
  }

  //head and face
  fill (#FCFCFC);
  ellipse (centerX, centerY-100, 200, 100); //head
  fill (#FFE5BF, 150);
  ellipse (centerX, centerY-100, 200, 100); //head colour
  fill (#FCFCFC);
  ellipse (centerX - 35, centerY-98, 40, 20 +- random(2)); //left eye
  fill (0,0,0);
  arc (centerX + 35, centerY -99, 48, 28, 0, PI); //black eye
  fill (#FCFCFC);
  ellipse (centerX + 35, centerY-99, 48, 22 +- random(2)); //right eye
  fill (#FF1534, 20);
  ellipse (centerX + 35, centerY-99, 48, 22); //right eye color
  fill (#76B9FF, 150);
  ellipse (centerX + 35, centerY-100, 15, 10); //right iris
  ellipse (centerX - 35, centerY-100, 15, 10); //left iris
  fill (0,0,0);
  ellipse (centerX + 35, centerY-100, 5, 5); //right pupil
  ellipse (centerX - 35, centerY-100, 5, 5); //left pupil
  triangle (centerX-30, centerY-115, centerX-30, centerY-120, centerX - 70, centerY-100); //left eyebrow
  triangle (centerX+30, centerY-115, centerX+30, centerY-120, centerX + 70, centerY-105); //right eyebrow
  ellipse (centerX-2, centerY-70, 10, 10);

  //headphones
  quad (centerX + 90, centerY-125, centerX + 90, centerY-75, centerX + 120, centerY-95, centerX + 120, centerY-115);
  quad (centerX - 90, centerY-125, centerX - 90, centerY-75, centerX - 120, centerY-95, centerX - 120, centerY-115);
  noFill();
  arc(centerX, centerY-120, 220, 150 +- random(shake), PI, TWO_PI);
  arc(centerX, centerY-120, 215, 145 +- random(shake), PI, TWO_PI);
}

