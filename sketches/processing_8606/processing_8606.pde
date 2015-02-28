
float r = 17;
float g = 51;
float b = 34;
float a = 255;
float x = 50;
float x2 = 1;
float y = 580;
float w = 100;
float h = 0;
float spacing = 80;
float speed = 1;

boolean clickOn = false;

void setup () {
  size (600,600);
  smooth();
}

void draw () {
background (220);
drawEllipse(50,300,160,80,color(20,51,80,160));
smallerEllipse (x-20,y,80,40,color(83,134,200,200));

x = x + speed;
if (x > (width+20) || (x < -20)) {
  y = y -80;
  speed = speed *-1;  
}
}

void smallerEllipse (float x2, float y2, float w, float h, color c) {
fill (c+10);
ellipse (x2,y2,width/8.5,h);
w = w*1;
h = h - 1;
}

void drawEllipse (float x, float y, float w, float h, color c) {
 for (int j = 50; j > 0 && j < height; j += spacing) {  
 for (int i = 20; i > 0 && i < width; i +=spacing) {
 
 fill (random(100),g*speed,b*speed,a);
 stroke (255);
 ellipse (i,j,w,h);
 w = constrain(mouseX,60,500) + 1;
  h = w/2;
 }
 } 

 if (mouseX > 20 && mouseY > 20 && mousePressed) {
    clickOn = true;
  } else {
    clickOn = false;
  }
  
  if (clickOn) {
 g = g + 1;
  b = b + 5;
  a = a - 10;

} else {
  g = 200;
  b = 210;
  a = a + 1;

  for (int j = 50; j > 0 && j < height; j += spacing) {  
 for (int i = 20; i > 0 && i < width; i +=spacing) {
 
 fill (random(70,100),g*speed-50,b*speed,a);
 stroke (10);
 ellipse (i,j,w,h);
 w = constrain(w,60,500) + .5;
  h = w/4;

}

r = constrain (r,17,236);
g = constrain (g,51,238);
b = constrain (b,34,235);
a = constrain (a,30,255);

}


}
}


