
import controlP5.*; //Startup controlp5 interface

PFont f;//declaring the variable for my text
PFont f2;//my 2nd font for the rolling middle name
PFont f3;//joker font for last N
float r = 30;//radius of my circles for the letter S
float w = 20;//width and height of letter s boxes
float h = 20;
int i;//my i variable integer
int inc; // my increment integer
int xpos, ypos; //my integers for my rolling banner
boolean el; //sets up my boolean statement
ControlP5 cp5; //introducing and labeling controlp5
int BG = 0; //establishing BG integer for slider

void setup() {
  size(500, 500);
  background(BG);
  smooth();
  frameRate(120); //sets my framerate to 120 fps
  xpos = -150; //setting the original position of my rolling banner
  ypos = 290;
  f = loadFont("FreestyleScript-Regular-48.vlw");//loading my newly created font
  f2 = loadFont("engrave.vlw");//my second font
  f3 = loadFont("Joker.vlw");//joker font int
  i = 0;//settting up my i variable
  el = false; //setting my start boolean position to false
  cp5 = new ControlP5(this); //introducing new slider
  Slider s = cp5.addSlider("BG", 0, 255, 0, 20, 475, 100, 10); //slider name, value, range etc.
}


void draw() {
  if (inc>380) {//rules that states once my text rolls to a certain point it stops
    inc = 380;
  }
  background(BG);
  strokeWeight(1);
  stroke(0);//the C
  fill(255, 0, 0);
  rect(20, 20, 20, 20);//back of C
  stroke(0);
  fill(200, 50, 0);
  rect(20, 40, 20, 20);
  stroke(0);
  fill(150, 100, 0);
  rect(20, 60, 20, 20);
  stroke(0);
  fill(100, 100, 0);
  rect(20, 80, 20, 20);
  stroke(0);
  fill(50, 150, 0);
  rect(20, 100, 20, 20);
  stroke(0);
  fill(0, 200, 0);
  rect(20, 120, 20, 20);
  stroke(0);
  fill(200, 50, 0);
  rect(40, 20, 20, 20);//top of C
  stroke(0);
  fill(150, 100, 0);
  rect(60, 20, 20, 20);
  stroke(0);
  fill(100, 100, 0);
  rect(80, 20, 20, 20);
  stroke(0);
  fill(0, 255, 0);
  rect(40, 120, 20, 20);//bottom of C
  stroke(0);
  fill(0, 200, 50);
  rect(60, 120, 20, 20);
  stroke(0);
  fill(0, 150, 100);
  rect(80, 120, 20, 20);
  stroke(0); 
 smooth(); 
  textFont(f, 150);//letter R
  fill(0, 0, 255);     
  text ( "R", 225, 130); 
  stroke(0);//letter I
  strokeWeight(5);
  line(350, 30, 350, 130);//backbone of I
  line(325, 30, 375, 30);//top of I
  line(325, 130, 375, 130);//bottom of I
  strokeWeight(1);//change weight
  fill(255, 0, 255);//elliptical H
  ellipse(140, 80, 10, 120);//left side H
  ellipse(200, 80, 10, 120);//right side H
  ellipse(170, 80, 70, 10);//crossbeam of H
  stroke(0);
  fill(mouseX, 0, mouseY);//colour of moving dot, changing with mouse position
  ellipse(i, 160, 20, 20);//Dot that underlines Chris
  i++;//command to make the x-axis change variable i to +1
  if (i-20 >= width) {//conditions that tell the dot to move back to start when finished
    i = 0;
  }
  stroke(125, 200, 3);
  strokeWeight(3);
  noFill();
  arc(450, 55, 50, 50, HALF_PI, TWO_PI-QUARTER_PI);//top half of my S
  stroke(150, 45, 30);
  arc(450, 105, 50, 50, -TWO_PI-HALF_PI, -PI);//bottom half of my S
  inc++; //makes my inc value +1
  xpos=inc/6;//slows the roll of my text
  fill(0, 255, 34);
  text("S", 2*xpos, ypos);//rolling type for middle name
  text("H", 3*xpos, ypos);
  text("A", 4*xpos, ypos);
  text("W", 5*xpos, ypos);
  text("N", 6*xpos, ypos);
  println(inc); //used to print inc to find when name moves to the part of the screen i want it too
  noFill();
  stroke(255, 255, 50);
bezier(20, 450,  20, 300,  60, 300,  60, 450);//first half of M (anchor point 1 x,y,control point 1 x,y,control point 2 x,y, anchor point 2 x,y)
stroke(255,255,50);
bezier(60, 450,  60, 300,  100, 300,  100, 450);//second half of M
strokeWeight(3);
stroke(0);
triangle(120,450,140,350,160,450);//letter A in Triangle
line(130,400,150,400);//line thru A
triangle(360,450,380,350,400,450);//2nd letter A in Triangle
line(370,400,390,400);//line thru A
noFill();
stroke(255,0,0);
strokeWeight(3);
strokeJoin(ROUND);
beginShape();//strokejoined letter C
vertex(220, 350);
vertex(200, 350);
vertex(180, 375);
vertex(180, 425);
vertex(200, 450);
vertex(220,450);
endShape();
if (keyPressed){
  stroke(0);
  line(240,450,240,350);//makes letter L appear
  line(240,450,270,450);
}
  if (mousePressed){
    stroke(0);
    bezier(340,350,280,350,280,400,340,400);//makes bezier letter E appear
    bezier(340,400,280,400,280,450,340,450);   
}
fill(0);
textFont(f,30);
text("Try clicking the mouse or pressing a key",180,490);
textFont(f3,125);
fill(mouseY,0,mouseX);
text("N",410,450);

}



