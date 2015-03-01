
PFont Font;
PImage xu;
PImage bg;
float diameter;
float angle = 0;
 
void setup() {
  size(600, 400);
  diameter = height - 90;
  fill(255, 0, 0);   
  Font = createFont ("Arial Black", 30);
  xu = loadImage("xd.png");
  bg = loadImage("bg.png");
}
 
void draw() {
  image(bg,0,0, width, height);   
  float dia = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
 
  fill(0);
  textAlign(CENTER);
  textFont(Font);
  text("Have Fun Here ^3^", width/2, dia/2);
 
 
  image(xu, width/3, height/5, dia, dia);
   
  angle += 0.05;
}



