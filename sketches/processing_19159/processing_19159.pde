
PFont font;
float angle = 0.0;
float angle2 = 10.0;
float y = 0.0;
//variables

void setup(){
  size(250,250);
  smooth();
  font=loadFont("AdobeArabic-Regular-48.vlw");
  background(255);
  textFont(font);
}

void draw(){
  fill(#28053E,5);
  rect(-10,-10,width+30,height+30);
  //purple background
  
y+=0.05;
//y variable increases
angle = angle + 0.04; 
//angle rotation rate

translate(90,110); 
//translates centre closer to the left
rotate(angle);
fill(#FFDC79,100);
stroke(0);
textSize(70);
text("M2H1J1",10,10);
//rotating yellow postal code

line(y,0,y,270);
line(-y,0,-y,270);
if (y>10){
  y=-0.05;}
  //black lines rotating in clockwise direction
  
  rotate(angle2);
  line(y,0,y,270);
line(-y,0,-y,270);
//black lines rotating parallel to first set of rotating lines

noStroke();
fill(#9185A5,10);
ellipse(10,10,y,y);
//rotating purple circle under black center
textSize(30);
text("M2H1J1",y,y);
//rotating purple text
}

