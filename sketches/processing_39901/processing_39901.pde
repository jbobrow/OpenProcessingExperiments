
int s=60;
int d=15;
color sandwich = color(216, 187, 114);
color grapes = color(91, 240, 51);
color bologna = color(234, 159, 144);
color water = color(162,235,247);
 
 
void setup() {
  size (500, 500);
  background(255);
  makechecker();
  makeplates();
}
 
 
void draw() {
  strokeWeight(2);
if (mouseX > 250) {
  frameRate(10);
  makeants(int(random(250,500)),int(random(0,500)));
}
  //if (mousePressed) {
  // makewater(mouseX, mouseY);
}
 
 
void keyPressed() {
strokeWeight(2);
  if (key == ' ') {
    background(255);
    makechecker();
    makeplates();
  }
  if (key == 'w') {
   /* if (mouseX<200 && mouseX>50 &&mouseY<200 && mouseY>50) {
      makewater(mouseX+ random(-100, 100), mouseY);
      */
      makewater(mouseX,mouseY);
     
  }
  if (key == 'g') {
    grapes = color(91, 240, 51);
    makegrapes(mouseX, mouseY);
  }
  if (key == 's') {
    sandwich = color(216, 187, 114);
    makesandwich(mouseX-35, mouseY-35);
  }
  if (key == 'c') {
    makecheese(mouseX-30, mouseY-30);
  }
  if (key == 'b') {
    bologna = color(234, 159, 144);
    makebologna(mouseX, mouseY);
  }
  if (key == 'a') {
    water = color(162,235,247);
    makeglass(mouseX, mouseY);
  }
  if (key == 't') {
    fill (28, 26, 23);
    sandwich = color(28, 26, 23);
    makesandwich(mouseX, mouseY);
  }
  if (key == 'r') {
    bologna = color(15, 252, 0);
    makebologna(mouseX, mouseY);
  }
  if (key == 'p') {
    grapes = color(116, 20, 124);
    makegrapes(mouseX, mouseY);
  }
  if (key == 'm') {
    makemuffin(mouseX, mouseY);
  }
  if (key == 'h') {
    makecupcake(mouseX, mouseY);
  }
  if (key == 'q') {
    makeants(mouseX, mouseY);
  }
  if (key == 'l') {
    water = color(245,239,67);
    makeglass(mouseX,mouseY);
  }
  if (key == 'd') {
    water = color(134,91,27);
    makeglass(mouseX,mouseY);
  }
  if (key == 'y') {
    makepopsicle(mouseX,mouseY);
  }
}
 
void makewater(float x, float y) {
 
  smooth();
  fill (48, 80, 44);
  arc (x, y, s, s, 0, PI);
  fill (237, 105, 121);
  arc (x, y, s/1.18, s/1.18, 0, PI);
}
 
void makegrapes (int h, int g) {
  stroke(0);
  fill (grapes);
  line(h, g, h, g-10);
  ellipse (h, g, d, d);
  ellipse (h-16, g, d, d);
  ellipse (h+16, g, d, d);
  ellipse (h-9, g+15, d, d);
  ellipse (h+9, g+15, d, d);
  ellipse (h, g+30, d, d);
}
 
void makesandwich (int x, int y) {
 noStroke();
  fill (sandwich);
  ellipse(x, y, 50, 50);
  ellipse(x+43, y, 50, 50);
  rect (x-15, y, 75, 70);
}
 
void makecheese (int x, int y) {
  stroke(0);
  fill (245, 142, 7);
  rect (x, y, 60, 60);
}
 
void makebologna (int x, int y) {
  stroke(0);
  fill (bologna);
  ellipse (x, y, 70, 70);
}
 
void makeglass (int x, int y) {
  stroke(0);
  fill(255);
quad (x,y,x+10,y+75,x+45,y+75,x+55,y);
fill (water);
quad (x+5,y+37.5,x+10,y+75,x+45,y+75,x+50,y+37.5);
stroke(255,8,24);
line(x+15,y+65,x-2,y-8);
line(x-2,y-8,x-15,y+1);
 
}
 
void makechecker() {
  int i = 0;
  for (int x=0; x<=500; x = x+25) {
    for (int y=0; y<=500; y = y+25) {
      if (i % 2 == 0) {
        fill (25, 20, 219);
      }
      else {
        fill (255);
      }
 
      rect (x, y, 25, 25);
      i = i+1;
    }
  }
}
 
void makemuffin (int x, int y) {
  stroke(0);
  fill (198, 143, 60);
  arc (x, y, 50, 50, PI, PI*2);
  fill(115, 224, 218);
  quad (x-20, y, x-17, y+20, x+17, y+20, x+20, y);
  line (x+16, y+2, x+13, y+18);
  line (x+12, y+2, x+9, y+18);
  line (x-16, y+2, x-13, y+18);
  line (x-12, y+2, x-9, y+18);
}
 
void makecupcake (int x, int y) {
  stroke(0);
  fill (248, 250, 204);
  arc (x, y, 50, 50, PI, PI*2);
  fill(115, 224, 218);
  quad (x-20, y, x-17, y+20, x+17, y+20, x+20, y);
  line (x+16, y+2, x+13, y+18);
  line (x+12, y+2, x+9, y+18);
  line (x-16, y+2, x-13, y+18);
  line (x-12, y+2, x-9, y+18);
  stroke (225, 99, 240);
  line (x-5, y-5, x-1, y-1);
  line (x+7, y-7, x+10, y-10);
  line (x, y-11, x+4, y-15);
  line (x+20, y-3, x+17, y-9);
  line (x-18, y-10, x-15, y-7);
  line (x-14, y-17, x-12, y-14);
  line (x-11, y-8, x-10, y-12);
}
 
void makepopsicle (int x, int y) {
  stroke(0); 
  fill(240,153,22);
  rect(x,y,30,70);
  stroke(118,90,47);
  line (x+15,y+70,x+15,y+100);
  
}
void makeants (int x, int y) {
  stroke(0);
  fill (183, 24, 24);
  ellipse(x, y, 10, 10); //1st right leg
  ellipse(x-7, y+7, 10, 10); //
  ellipse(x-14, y+14, 11, 11);
  line(x, y+5, x+9, y+9);
  line(x-3, y+5, x-9, y-9);
  line(x-3, y+11, x+7, y+14);
  line(x-11, y+5, x-16, y-2);
  line(x-8, y+15, x-3, y+23);
  line(x-14,y+9,x-22,y+6); //3rd left leg
  fill(0);
  ellipse(x+2, y+2, 1, 1);
  ellipse(x-2, y-2, 1, 1);
}
 
void makeplates() {
  for (int i=125; i <500; i = i+250) {
    for (int j=125; j <500; j = j+250) {
      smooth();
      fill (255);
      ellipse (i, j, 175, 175);
    }
  }
}

                
                
