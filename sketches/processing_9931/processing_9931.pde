
PFont font;
String phr = "YOU SHALL BE AS GODS ";
int count = 0;
char ch = phr.charAt(0);
char c = 'A';
int xpos = 10;
int ypos = 50;
color rojo = color(204, 0, 0);
color negro = color(16);
color bg = color (255);


void setup(){
  size(500, 500);
  background(bg);
  font = loadFont("Commodore_64.vlw");
  fill(0);
  smooth();
  textFont(font);
  rectMode(CORNERS);
  frameRate(30);
}



void draw(){

  if (c%10 == 0){
    fill(rojo);
  }
  else if (c%3 == 0){
    fill(bg);
  }
  else{
    fill(negro);

  }
  text (ch, xpos, ypos);
  ch = phr.charAt(count);
  count++;
  if (count >= 21){
    count = 0;  
  }
  print ("("+c+","+int(c)+")"+"-");
  xpos += 40;
  c++;
  if (c > 90){
    c = 'A';
  }
  if (xpos >= 460){
    fill(255,18);
    rect(-10,-10,width,height);
    xpos = 10;
    ypos += 40;


  }
  if (ypos >= 500){


    ypos = 50;
  }


  filter (BLUR,1);


}
























