
PFont font;
int userclicks = 5;
boolean defeated = false;
int[] enemies = new int [60];
int setupx = 200;
int setupy = 200;
void setup() {
  font = loadFont("Algerian-48.vlw"); 
  textFont(font, 14);
  text("", 15, 50);
  ellipse(1, 1, 1, 1);
  size(1000, 600); 
  smooth();
  background(0);
  rectMode(CORNER);
}


void draw() {
  background (255, 255, 255);
  if (userclicks==5) {
    text("Oh HAI! See that circle up there in the corner? Thats YOU!", 15, 50);
  } 
  else if (userclicks==4) {
    text("Now unfortunately I have some bad news for you. Somehow you, the odd purple circle, Have managed to anger the red squares.", 15, 50);
  } 
  else if (userclicks==3) {
    text("and woops...here they come now...you might wanna run...Just sayin.", 15, 50);
  }
  else {
    for (int i = 0; i<20; i++) {
      float r = random(1, 5);
      float g = random(1, 5);
      rect(setupx+r, setupy+g, 10, 10);
      text(i, i+40, i+40);
    }
    while (defeated == false) {
      int k = mouseX;
      int h = mouseY;
      int b = 1;
      int v = 2;
      for (int j = 0; j< 20; j++) {
        if (enemies[b] < k) {
          enemies[b] +=1;
        }
        else {
          enemies[b]-=1;
        }
        if (enemies[v] < h) {
          enemies[v]+=1;
        }
        else {
          enemies[v] -=1;
        }
        rect (enemies[b], enemies[v], 10, 10);
        if (enemies[b] == mouseX && enemies[v] == mouseY) {
          defeated = true;
        }
        else {
          b+=2;
          v+=2;
        }
      }
    }
    fill(212, 28, 118);
    ellipse(mouseX, mouseY, 50, 50);
  }
}
void mousedragged() {
  fill(212, 28, 118);
  ellipse(mouseX, mouseY, 50, 50);
}
void mousePressed() {
  userclicks =userclicks-1;
}
