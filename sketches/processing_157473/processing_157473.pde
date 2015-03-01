
PImage[] faces = new PImage[7];
String[] text = new String[11];
PFont tvText;
PImage tv;
PImage st;

int bucketNo = 0;
int choice;
boolean choiced;
boolean isButtonPressed;

void setup () {
  size(500, 500);
  frameRate(7);
  tvText = loadFont("Noteworthy-Bold-29.vlw");
  tv=loadImage("olgaTV.png");
  st=loadImage("StaticTV.png");
  faces[0] = loadImage("image1.png");
  faces[1] = loadImage("image2.jpg");
  faces[2] = loadImage("image3.jpg");
  faces[3] = loadImage("image4.jpg");
  faces[4] = loadImage("image5.jpg");
  faces[5] = loadImage("image6.jpg");
  faces[6] = loadImage("image7.jpg");
  
  text[0] = "boo!!!!";
  text[1] = "try again";
  text[2] = "today is the day!!!";
  text[3] = "you will be a great coder";
  text[4] = "you are a very good designer";
  text[5] = "get some sleep";
  text[6] = "not today!!!";
  text[7] = "you are so cool!!!";
  text[8] = "what is the name of your pillow";
  text[9] = "work harder";
  text[10] = "you are a good student";
}

void draw() {
  println("x is " + mouseX + " y is " +mouseY);
  background(0);
  size(500,500);
  textFont(tvText);
  
  drawFaces ();
  if (isButtonPressed) {
    choiced = true;
    showQuestion(choice);
  } else {
    choiced = false;
    faceRotate();
  }
  image(tv,35,50);
  noFill();
  stroke(#ea0004);
  strokeWeight(2);
  ellipse(mouseX, mouseY, 20,20);
  ellipse(mouseX, mouseY, 50,50);
  ellipse(mouseX, mouseY, 80,80);
  ellipse(mouseX, mouseY, 110,110);
  line(mouseX-80,mouseY,mouseX+80,mouseY);
  line(mouseX,mouseY-80,mouseX,mouseY+80);
}

void faceRotate () {
    bucketNo++;
    if (bucketNo >= faces.length) {
        bucketNo = 0;
    }  
}

void mousePressed () {
  if(mouseX>=102 && mouseY>=134 && mouseX<=344 && mouseY<=362){
  isButtonPressed = !isButtonPressed;
  choice = int(random(text.length));
  
  image(st,104,121);
  image(tv,35,50);
}
}

void drawFaces () {
  image(faces[bucketNo], 106,120, width/2, height/2);
}

void showQuestion(int c) {
  fill (random(255),random(255),random(255));
  textAlign(CENTER, CENTER);
  text(text[c], width/2, height/2+195);
}




