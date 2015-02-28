
PFont font;
String h, e, r, o;
int x, y;
float theta;

void setup() {
  size(600, 600);
  font = loadFont("Narkisim-60.vlw");
  textFont(font);
  textAlign(RIGHT);
  o = "O";
  r = "R";
  e = "E";
  h = "H";
  x = width/2;
  y = height/2;
  theta = 0;
}


void draw() {
  background(130, 180, 250);
  Whoosh();
  x = mouseX;
  y = mouseY;
  
  strokeWeight(10);
  strokeCap(SQUARE);
  line(mouseX - 70, mouseY, mouseX - 180, mouseY);    //body
  strokeWeight(1);
  
  textSize(90);
  fill(200, 20, 20);
  text(o, x, y+sin(theta-HALF_PI));
  textSize(60);
  text(r, x - textWidth(o)-20, y+10*sin(theta)-20);
  text(e, x - textWidth(r) - textWidth(o) - 20, y+10*sin(theta+HALF_PI)-20);
  text(h, x - textWidth(e) - textWidth(r) - textWidth(o) - 20, y+10*sin(theta + PI)-20);
  theta += .3;
  strokeWeight(4);
  //stroke(200, 20, 20);
  line(mouseX-10, mouseY, mouseX+20, mouseY);    //arms
  line(mouseX-5, mouseY-5, mouseX+25, mouseY-5);

}

void Whoosh() {
  int high = int(random(height));
  int leng = 20;
  int i, j;
  j = int(random(10));
  background(130, 180, 250);
  strokeWeight(1);
  stroke(0);
  if (j == 1) strokeWeight(2);
  for (i = width; i > leng; i--) {
    line(i, high, i - leng, high);
  }
}

//Narkisim-60


