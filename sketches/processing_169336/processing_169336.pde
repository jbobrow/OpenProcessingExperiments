
String[] name = new String[19];
int[] age = new int[19];
import processing.video.*;
Table kids;
Movie gun;
int j = 0;
long timer;
boolean play = false;
int[] x = new int[56];
int[] y = new int[56];
circle[] Circle;
int[] chooze = new int[19];
void setup() {
  size(500, 850);
  kids = loadTable("victims.csv", "header,csv");
  int i = 0;
  Circle = new circle[56];
  for (TableRow row : kids.rows ()) {
    if (row.getInt("Age") > 0) {
      age[i] = row.getInt("Age");
      name[i] = row.getString("Name");
      println("name " + i + "= " + name[i]);
      println("age " + i + "= " + age[i]);
      i++;
    }
  }
  int high =2;
  int low  =0;
  for (int h = 0; h<19; h++) {
    chooze[h] = int(random(low, high));
    high+=3;
    low+=3;
  }
  int num = 0;
  int X, Y;
  X = 55;
  Y = 35;
  for (int index = 0; index < 56; index++) {
    x[index]=X;
    y[index]=Y;
    if (num>2) {
      X=55;
      Y+=60;
      num = 0;
    } else {
      X+=130;
      num ++;
    }
  }
  gun = new Movie (this, "gunviolencevideo.mov");
  noStroke();
  smooth();
  timer = millis();
}
float randomColor;
void draw() {
  background(0);
  float x1 = random(0, 450);
  float y1 = random(0, 450);
  float x2 = random(0, 450);
  float y2 = random(0, 450);
  randomColor = random(100);
  /*if (randomColor > 10) {
   fill(0, 200, 200, 150);
   } else {
   fill(255, 75, 75, 200);
   }
   ellipse(x1, y1, 30, 30);
   ellipse(x2, y2, 30, 30);
   */
  
  for (int index = 0; index < 56; index++) {
    Circle[index] = new circle(x[index], y[index], 0, 200, 200, 150);
  }
  if (millis() - timer > 100) {
    if (j < 18) {
      j++;
      timer = millis();
    } else {
      play = true;
    }
  }
  int numba = 0;
  for (int h = 0; h<j; h++) {
    numba = chooze[h];
    Circle[numba] = new circle(x[numba], y[numba], 255, 75, 75, 200);
  }
  if (j < 19) {
    textAlign(CENTER);
    textSize(25);
    fill(255);
    text(name[j] + " aged " + age[j], width/2, height/2);
  }
  if (play == true) {
    background(0);
    pushMatrix();
    translate(0,110);
    image (gun, 0, 0);
    gun.play();
    popMatrix();
  }
}
void movieEvent (Movie gun) {
  gun.read();
}
class circle {
  int x, y, colorR, colorG, colorB, o;
  circle(int X, int Y, int r, int b, int g, int O) {
    this.x = X;
    this.y = Y;
    this.colorR = r;
    this.colorG = g;
    this.colorB = b;
    this.o = O;
    fill(colorR, colorB, colorG, this.o);
    ellipse(this.x, this.y, 50, 50);
  }
}



