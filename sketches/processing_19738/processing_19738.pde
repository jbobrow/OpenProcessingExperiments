
PFont font;
float x = 40;


void setup(){
  size(250, 250);
  font = loadFont("ZapfDingbatsITC-35.vlw");
  textFont(font);
  smooth();
  
}
void draw(){
  fill(0,5);
  rect(0,0,width,height);
  fill(255);


  text("L 5 N 3 S 6", 80, random(x,x+90));
fill(150,150);
    rotate(0.2);

  fill(#FEFBAF);
  rotate(0.2);
  text("L 5 N 3 S 6", 130, random(x));
  fill(#C2A34F);
  rotate(0.2);
  text("l 5 n 3 s 6", 10, random(x));
  fill (#FFE545);
  rotate(0.2);
  text("L 5 N 3 S 6", 130, random(x-150,x-120));


  frameRate(120);
  x += 1.0;

  }





