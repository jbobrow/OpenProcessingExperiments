
import java.util.Random;

String syl1[] = {"rain", "spring", "eyes", "beach", "sun", "moon", "koi", "cold"};  
String syl2[] = {"window", "mountains", "drizzle", "silence", "thousands", "thunder", "autumn", "sunshine", "flowers", "river", "dripping", "driftwood", "lovers", "crying", "fog", "amber"};
String syl3[] = {"fingertips", "whistling", "tumbling", "exhaustless", "pictureesque", "nirvana"}; 
String syl4[] = {"awakening", "magnolia", "excitable", "symmetrical"};
String syl5[] = {"electricity", "illuminated", "serendipity", "generosity"};
int syl1i = 0;
int syl2i = 0;
int syl3i = 0;
int syl4i = 0;
int syl5i = 0;
Random random = new Random();
String haiku;

PFont f;

void setup(){
   size(600, 600);
  
  // font
  printArray(PFont.list());
  f = createFont("NittiPX-Normal", 24);
  textFont(f);
  haiku = genHaiku();
  
  rectColor = color(0);
  rectHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  rectX = width/2 - 45;
  rectY = height/2 + 45;
}

void draw() {
  background(102);
  textAlign(CENTER);
  text(haiku, width * 0.5, height * 0.35);
  
  update(mouseX, mouseY);
  if (rectOver)
    fill(rectHighlight);
  else
    fill(rectColor);
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
}

String genHaiku(){
  String line1 = "", line2 = "", line3 = "";
  int line1Count = 0, line2Count = 0, line3Count = 0;
  do {
    int i = random.nextInt(5 - line1Count) + 1;
    switch (i){
      case 1:
        line1 += syl1[syl1i++];
        line1Count++;
        break;
      case 2:
        line1 += syl2[syl2i++];
        line1Count += 2;
        break;
      case 3:
        line1 += syl3[syl3i++];
        line1Count += 3;
        break;
      case 4:
        line1 += syl4[syl4i++];
        line1Count += 4;
        break;
      case 5:
        line1 += syl5[syl5i++];
        line1Count += 5;
    }
    line1 += " ";
    checkIndex();
  } while (line1Count < 5);
  
  do {
    int i = random.nextInt(7 - line2Count) + 1;
    switch (i){
      case 1:
        line2 += syl1[syl1i++];
        line2Count++;
        break;
      case 2:
        line2 += syl2[syl2i++];
        line2Count += 2;
        break;
      case 3:
        line2 += syl3[syl3i++];
        line2Count += 3;
        break;
      case 4:
        line2 += syl4[syl4i++];
        line2Count += 4;
        break;
      case 5:
        line2 += syl5[syl5i++];
        line2Count += 5;
    }
    line2 += " ";
    checkIndex();
  } while (line2Count < 7);
  
  do {
    int i = random.nextInt(5 - line3Count) + 1;
    switch (i){
      case 1:
        line3 += syl1[syl1i++];
        line3Count++;
        break;
      case 2:
        line3 += syl2[syl2i++];
        line3Count += 2;
        break;
      case 3:
        line3 += syl3[syl3i++];
        line3Count += 3;
        break;
      case 4:
        line3 += syl4[syl4i++];
        line3Count += 4;
        break;
      case 5:
        line3 += syl5[syl5i++];
        line3Count += 5;
    }
    line3 += " ";
    checkIndex();
  } while (line3Count < 5);
  
  return line1 + " —\n" + line2 + "\n" + line3;
}

void checkIndex(){
    syl1i %= 7;
    syl2i %= 12;
    syl3i %= 5;
    syl4i %= 3;
    syl5i %= 3;
}
int rectX, rectY;      // Position of square button
int rectSize = 90;     // Diameter of rect
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;

void update(int x, int y) {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

void mousePressed() {
  if (rectOver) {
      haiku = genHaiku();
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}



