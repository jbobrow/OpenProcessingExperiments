
float speed = 2.5; 
int w = 25;
int h = 20;
int d = 10;
int x = 120;
int y = 240;
int body = 100;
int orange = #F57839;
int black = #000000;
float vert; 
float hori;

PFont font;

void setup() { 
  size(340, 540); 
  smooth(); 
  vert = width/2;
  hori = height/2;
  font = loadFont ("Blur-48.vlw");
  textFont(font);
}
void draw() { 
  
  textSize(15);
  text("Eeek. My body is doing that thing again...", 30, 500, 240, 100);
  vert += random(-speed, speed); 
  hori += random(-speed, speed); 
  // Antennae
stroke(255);
line(vert+20, hori/4,vert, hori+d);
line(vert+40, hori/4, vert+60, hori+d);
noStroke();
ellipse(vert, hori+d, d-7, d-7);
ellipse(vert+60, hori+d, d-7, d-7);
//Head
noStroke();
fill(orange);
rect(x, x/2, x/2, x/2);
fill(255);
ellipse(x+h, h*4, d-3, d);
fill(255);
ellipse(x+40, h*4, d-3, d);
fill(black);
ellipse(x+h, h*4+5, d-7, d-7);
ellipse(x+40, h*4+5, d-7, d-7);
//Mouth
stroke(black);
line(x+h, body+10, x+40, body+5);
//Ears
noStroke();
fill(orange);
rect(vert-5, hori-w, d, d+5);
rect(vert+55, hori-w, d, d+5);
//Neck
ellipse(vert+30, hori+d, d,d);
//Arms
fill(255);
ellipse(vert, hori, d, d);
ellipse(vert, hori, d, d);
fill(orange, 180);
ellipse(vert, hori, d, d);
ellipse(vert, hori, d, d);
fill(255);
ellipse(vert, hori, d, d);
ellipse(vert, hori, d, d);
fill(orange, 180);
ellipse(vert, hori, d, d);
ellipse(vert, hori, d, d);
//Body
noStroke();
fill(orange);
rect(vert+13, hori+40, body-25, body);
fill(255);
rect(vert+20, hori+48, body/2+10, body-15);
fill(orange);
rect(vert, hori, w, h);
rect(vert+35, hori, w, h);
//Knees
fill(255);
ellipse(vert+12, hori+30, d, d);
ellipse(vert+48, hori+30, d, d);
//Calves
fill(orange);
rect(vert, hori+40, w, h*2);
rect(vert+35, hori+40, w, h*2);
//Feet
fill(255);
ellipse(vert+12, hori+80, d*1.5, d/2);
ellipse(vert+48, hori+80, d*1.5, d/2);
}


