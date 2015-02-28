
//FLOAT
float targetX, targetY;
float easing = 1;
//SHAPE
PFont f;
PShape s, h, a , p, e, ss, hh;

void setup() {
  background(0);
  smooth();
  noStroke();
  size(320, 480);
  //SHAPE
  s = loadShape ("bombs.svg");
  h = loadShape ("arms.svg");
  a = loadShape ("neck.svg");
  p = loadShape ("legs.svg");
  e = loadShape ("sparks.svg");
  ss = loadShape ("background.svg");
  hh = loadShape ("background1.svg");
  //FONT
  f = loadFont ("Dialog-48.vlw");
}

void draw() {
  float bgr = map (mouseX, 0, width, 159, 9);
  float bgg = map (mouseX, 0, width, 201, 25);
  float bgb = map (mouseX, 0, width, 247, 40);
  float shake = map (mouseX, 0, width, 0, random (-2, 2));
  float shake1 = map (mouseX, 0, width, 0, random (-3, 3));
  background (bgr, bgg, bgb);
  bg1 (mouseX-320, 0);
  bg (0, 104);
  //float headbodyW = map(mouseheight, 0, width, 0, 2);
  //float headbodyH = map(mouseheight, 0, width, 0, 2);
  //ROBOT
  angry (120, 200 + shake);
  arms (70, height - 217 + shake1);
  neck (120, height - 343 + shake1);
  legs (120, height - 126 + shake1);
  sparks (135, height - 340 + shake);
  eyes (160, 270);
  retinas (150, 260);
  command (120, 210);
  leftredbutton (190, 200);
  rightredbutton (170, 200);
  topleftbutton (170, 180);
  toprightbutton (180, 180);
  bottomleftbutton (170, 170);
  bottomrightbutton (180, 170);
  siren (160, 300);
  mouth (150, 240);
  commandlines (140, 190);
  bomb (0, 360);
  //BACKGROUND
  windows (35, 230);
  windows (55, 236);
  windows (37, 210);
  windows (242, 353);
  windows (258, 356);
  windows (258, 340);
  windows (19, 130);
  windows (39, 133);
  windows (59, 136);
}
void bg (int x, int y) {
  shape (ss, x, y); 
}
void bg1 (int x, int y) {
  shape (hh, x, y);
}
  //scale (w, h);
  //translate (129, height - 296);
void arms (int x, float y) {
  shape (h, x, y);
}
void neck (int x, float y) {
  shape (a, x, y);
}
void legs (int x, float y) {
  shape (p, x, y);
}
void sparks (int x, float y) {    
  shape (e, x, y);
}
void leftredbutton (int x, int y) {
  if ((mousePressed == true) && ((mouseX > (x-5)) && (mouseX < (x+9)) && 
    (mouseY < height - (y-6)) && (mouseY > height - (y+8)))) { 
    noStroke();  
    textFont(f, 25);  
    fill (random(0,255));  
    text("SHAKE SHAKE SHAKE", 35, 90); 
    fill (255, 242, 0); 
  } 
  else { 
    fill ((random(100,240)), (random(5, 50)), (random(5, 50))); 
  } 
  ellipse ((x), height - (y+1), 12, 12);
}
void rightredbutton (int x, int y) {
  if ((mousePressed == true) && ((mouseX > (x+1)) && (mouseX < (x+13)) && 
    (mouseY < height - (y-6)) && (mouseY > height - (y+8)))) { 
    noStroke(); 
    textFont(f, 31);  
    fill (random(0,255));  
    text("SELF-DESTRUCT!", 33, 90); 
    fill (255, 242, 0); 
  } 
  else { 
    fill ((random(100,240)), (random(5, 50)), (random(5, 50))); 
  } 
  ellipse ((x+5), height - (y+1), 12, 12); 
}
void topleftbutton (int x, int y) {
  if ((mousePressed == true) && ((mouseX > (x+3)) && (mouseX < (x+12)) && 
    (mouseY < height - (y+1)) && (mouseY > height - (y+9)))) { 
    noStroke(); 
    textFont(f, 48);  
    fill (random(0,255));  
    text("Hello!", 100, 90); 
    fill (255, 242, 0); 
  } 
  else { 
    fill (random (0, 255)); 
  } 
  quad((x+3), height - (y+9), (x+12), height - (y+9), (x+12), height - (y+1), (x+3), height - (y+1));
}
void toprightbutton (int x, int y) {
  if ((mousePressed == true) && ((mouseX > (x+4)) && (mouseX < (x+12)) && 
    (mouseY < height - (y+1)) && (mouseY > height - (y+9)))) { 
    noStroke(); 
    textFont(f, 27);  
    fill (random(0,255));  
    text("OVERPOWER!", 80, 90); 
    fill (255, 242, 0); 
  } 
  else { 
    fill (random(0, 255)); 
  } 
  quad((x+4), height - (y+9), (x+12), height - (y+9), (x+12), height - (y+1), (x+4), height - (y+1)); 
}
void bottomleftbutton (int x, int y) {
  if ((mousePressed == true) && ((mouseX > (x+3)) && (mouseX < (x+12)) && 
    (mouseY < height - (y)) && (mouseY > height - (y+9)))) { 
    noStroke(); 
    textFont(f, 20);  
    fill (random(0,255));  
    text("DON'T TOUCH THE BOMB!", 40, 90); 
    fill (255, 242, 0); 
  } 
  else { 
    fill (random (0, 255)); 
  }
  quad((x+3), height - (y+9), (x+12), height - (y+9), (x+12), height - (y), (x+3), height - (y)); 
}
void bottomrightbutton (int x, int y) {
  if ((mousePressed == true) && ((mouseX > (height+4)) && (mouseX < (height+12)) && 
    (mouseY < height - (y)) && (mouseY > height - (y+9)))) { 
    noStroke(); 
    textFont(f, 50);  
    fill (random(0,255));  
    text("BURN!", 30, 90); 
    fill (255, 242, 0); 
  } 
  else { 
    fill (random(0, 255)); 
  } 
  quad((x+4), height - (y+9), (x+12), height - (y+9), (x+12), height - (y), (x+4), height - (y)); 
}
void retinas (int x, int y) {
  fill(255); 
  float ex = constrain(mouseX, (x+25), (x+33));  
  float ey = constrain(height - mouseY, height - (y+6), height - (y+15));  
  float ex2 = constrain(mouseX, (x-5), (x+3));  
  float ey2 = constrain(height - mouseY, height - (y+6), height - (y+15));  
  ellipse(ex2, ey2, 7, 7);  
  ellipse(ex, ey, 7, 7); 
}
void eyes (int x, int y) {
  fill(215, 31, 38); 
  ellipse((x-11), height - (y+1), 16, 16); 
  ellipse((x+19), height - (y+1), 16, 16);
}
void siren (int x, int y) {
  fill(215, 31, 38); 
  targetY = dist(mouseX, mouseY, pmouseX, pmouseY) * 0.5; 
  targetX = targetX + ((targetY - targetX) * easing); 
  ellipse((x+3), height - (y+9), targetX, targetX); 
}
void windows (int x, int y) {
  float bgr1 = map (mouseX, 0 , width, 0, random (180, 253));
  float bgg1 = map (mouseX, 0, width, 0, random (180, 245));
  float bgb1 = map (mouseX, 0, width, 0, random (20, 70));
  fill (bgr1, bgg1, bgb1);
  quad((x-4), height - (y+6), (x+7), height - (y+10), (x+7), height - (y-4), (x-4), height - (y-7)); 
}
void mouth (int x, int y) {
  fill (150); 
  quad(x, height-(y+7), x+27, height-(y+7), x+28, height-(y+1), x-1, height-(y+1)); 
}
void angry (int x, float y) {
    float bgr3 = map (mouseY, 0 , width, 186, random(100,240));
    float bgg3 = map (mouseY, 0, width, 214, random(5, 50));
    float bgb3 = map (mouseY, 0, width, 86, random(5, 50));
    fill (bgr3, bgg3, bgb3); 
 
    triangle(x+43, height - (y+109), x+50, height - (y+96), x+40, height - (y+96));  

    quad(x+8, height - (y+96), x+80, height - (y+96), x+80, height - (y+33), x+8, height - (y+33)); 

    quad (x, height - (y+24), x+91, height - (y+24), x+91, height - (y-75), x, height - (y-75));  

    quad (x+9, height - (y+13), x+81, height - (y+13), x+81, height - (y-35), x+9, height - (y-35));  
}
void command (int x, int y) {
  fill(112, 113, 113); 
  quad (x+9, height - (y+3), x+81, height - (y+3), x+81, height - (y-45), x+9, height - (y-45)); 
}
void commandlines (int x, int y) {
  stroke(8); 
  line(x+1, height - (y+7), x+1, height - (y-21)); 
  line(x+5, height - (y+7), x+5, height - (y-21)); 
  line(x+9, height - (y+7), x+9, height - (y-21)); 
  line(x+13, height - (y+7), x+13, height - (y-21)); 
  noStroke(); 
}
void bomb (int x, int y) {
  shape (s, x, y);
}
  

