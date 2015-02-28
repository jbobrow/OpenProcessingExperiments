
PImage img;
String w1;
String w2;
String w3;
String w4;
String w5;
String w6;
String w7;
String w8;
String wDisp;



int randomNum;
int prevNum;

String[] words;


void setup() {

  size(700, 700);

  randomNum = int(random(1, 27));
  prevNum = randomNum;
  img = loadImage("IMD"+randomNum+".jpg");
  image(img, 50, 0);

  w1 = "      TRUE LOVE";
  w2 = "    PERSPECTIVE";
  w3 = "       COURAGE";
  w4 = "      RESTRAINT";
  w5 = "        UNIQUE";
  w6 = "      ADDICTION";
  w7 = "           FEAR";

  words = new String[7];

  for (int i = 0; i<7; i++) {
    switch (i) {
    case 0:
      words[i] = w1;
      break;
    case 1:
      words[i] = w2;
      break;
    case 2:
      words[i] = w3;
      break;
    case 3:
      words[i] = w4;
      break;
    case 4:
      words[i] = w5;
      break;
    case 5:
      words[i] = w6;
      break;
    case 6:
      words[i] = w7;
      break;
    }
  }
  wDisp = words[int(random(0, 7))];
}

void changeImage() {
  randomNum = int(random(1, 27));
}

void keyPressed() {
  changeImage();
  wDisp = words[int(random(0,7))];
}

void draw() {
  background(0);
  
  print("PrevNUm: " + prevNum + " ");
  if (prevNum != randomNum) {
    img = loadImage("IMD"+randomNum+".jpg");
    prevNum = randomNum;
    print(randomNum+" ");
  }
  image(img, 50, 0);

  fill(0);
  rect(0, 0, width, 75);
  rect(0, 0, 75, height);
  rect(0, height-200, width, 200);
  rect(width-75, 0, 75, height);

  fill(255); 
  textSize(75);
  text(wDisp, 0, height - 130);
}



