
//Anthony Hernandez
//Infographic-Homework1

//Text is still fuzzy...

PFont myfont;

void setup(){
  size(700,200);
  stroke(0);
  smooth();
  background(255);
  myfont=loadFont("Serif-48.vlw");
  textFont(myfont,15);
}

void draw(){
  stroke(0);
  fill(0);
  ellipse(50,50,25,25);
  ellipse(150,50,50,50);
  ellipse(250,50,50,50);
  ellipse(350,50,25,25);
  ellipse(450,50,15,15);
  ellipse(550,50,5,5);
  ellipse(650,50,1,1);
  
  stroke(25);
  text("M",50,150);
  text("T",150,150);
  text("W",250,150);
  text("T",350,150);
  text("F",450,150);
  text("S",550,150);
  text("S",650,150);

  text("Infographic - Hours Spent in Studio Each Week",200,190);
  
  
}

