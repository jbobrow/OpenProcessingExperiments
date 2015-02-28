
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/129851*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int h=300;
float a = 5;
float b = 50;
float c = 5;
float d = 5;
float e = 5;

void setup(){
size(800,800);
line(0,500,800,500); //Horizon
fill(10,250,50,200);
rect(0,400,800,400); //"Grass"
}

void draw(){
  fill(#1E7BFA);
  rect(0,0,800,500); //sky
  fill(255);
  ellipse(a, b, 300, 50); //"Cloud"1
  fill(255);
  ellipse(a-400, b+200, 150, 50); //"Cloud"2
  fill(255);
  ellipse(c-600, b+150, 250, 50); //"Cloud"3
  fill(255);
  ellipse(d-250, b+100, 500, 50); //"Cloud"4
  fill(255);
  ellipse(e-800, b+50, 180, 50); //"Cloud"5
  
  a = a + 1;
  b = 10;
  c = c + 1.5;
  d = d + 2;
  e = e + 2.5;
  
  fill(0);
triangle(410,50,200,200,600,200); //Roof, obviously

  if (a > width+1000) { 
    a = -5;  
}
  if (c > width+1000) {
    c = -5;    
}
  if (d > width+1000) {
    d = -5;
}
  if (e > width+1000) {
    e = -5;
}
  
  fill(#FCB705);
rect(550,350,200,150); //Garage
  fill(#FCB705);
rect(250,200,h,h); //House
fill(0);
triangle(520,350,780,350,650,250); //Garage Roof
fill(#F7F711);
rect(300,250,h/4,h/4); //Left Window
line(300,290,375,290); //Left Window Horizontal Window Bar
line(337,250,337,325); //Left Window Vertical Window Bar
fill(#F7F711);
rect(430,250,h/4,h/4); //Right Window
line(505,290,430,290); //Right Window Horizontal Window Bar
line(467,325,467,250); //Right Window Vertical Window Bar
fill(#FC0526);
rect(370,400,h/4,h/3); //Door
fill(30,40,50,60);
rect(580,370,140,130); //Garage Door
line(580,390,720,390); //Garage Door Line #1
line(580,410,720,410); //Garage Door Line #2
line(580,430,720,430); //Garage Door Line #3
line(580,450,720,450); //Garage Door Line #4
line(580,470,720,470); //Garage Door Line #5
line(580,490,720,490); //Garage Door Line #6
ellipse(650,480,5,5); //Garage Door Handle
ellipse(420,460,5,5); //Door Knob
}


