
int w, h;
int tttSize  = 32;
int textAlpha = 255;

float x;
float y;
float yPos = 0; //position of the circle

String _title = "Victory Ceremony";

PFont font;
PImage b;


void setup() {
  size(640, 360);   // 16:9 ratio
  w = width/2;
  h = height/2;
  //background(88, 0, 98);
  font = createFont("Lithos Pro", 32);
  b = loadImage("logo.jpg");
  textFont(font, 32);   //  Tell processing to use this font
  smooth();
}

void draw() {

  noStroke();

  image(b, 0, 0, 150, 150);

  fill(88, 0, 98);    //  set fill for rect to clear background
  rect(0, 0, width, height);
  stroke(255);

  if (tttSize >= 32) {
    tttSize += 1;
    textAlpha -=20;
  }
  else if (tttSize == 50) {
    tttSize -= 1;
    textAlpha +=20;
  }

  if (textAlpha <= 0) {

    tttSize = 32;
    textAlpha = 255;
  }



  drawLines();
  drawCircles();

  fill(255, 255, 255, textAlpha);      //  fill of the text
  textSize (tttSize);
  text(_title, w - (textWidth(_title)/2) + 70, h + 100);  //  centre the text on the screen
  ani();
}

void drawLines() {

  smooth(); 
  strokeWeight(7); 
  stroke(250, 0, 180, 30);



  line(0, random(250, 360), 640, random(180, 360));
  line(random(500, 600), 0, random(200, 380), 640); 
  delay(100); 
  line(random(500, 640), 0, random(500, 640), 640); 
  delay(100);
}

void drawCircles() {


  strokeWeight (5);
  noFill();
  stroke(0, 53, 255, random(150, 255));
  ellipse(100, yPos, 80, 80);//Setting one of the Olympic Five Rings
  stroke(0, 0, 0, random(150, 255));
  ellipse(190, yPos, 80, 80);//Setting one of the Olympic Five Rings
  stroke(255, 0, 0, random(150, 255));
  ellipse(280, yPos, 80, 80);//Setting one of the Olympic Five Rings
  stroke(255, 255, 0, random(150, 255));
  ellipse(145, yPos+40, 80, 80);//Setting one of the Olympic Five Rings
  stroke(0, 255, 0, random(150, 255));
  ellipse(235, yPos+40, 80, 80);//Setting one of the Olympic Five Rings
}

void ani() {


  if (yPos >= 0 & yPos < 100) {

    yPos += 5;
  }
}


