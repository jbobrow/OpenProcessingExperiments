
void setup() {
size(200,200);
smooth();

//shape parameters
ellipseMode(CENTER);
rectMode(CENTER);
}

void draw() {
  //Pfont font;
  //font=loadfont("Monospaced-48.vlw")
  //textFont(font, 48);
  //text("BOYD", 100,175);

  background(mouseY+100);
  
  translate(50,50);
  
  // draw pen color with mouse move
  stroke(0,mouseX,mouseY);
  
  //strokeWeight(abs((100/(mouseX+1))));
  strokeWeight(2);

  // draw ear
  fill(113,73,34);
  ellipse(30,33,25,25);// boyd's right ear
  ellipse(70,33,25,25);//boyd's right ear
  
  fill(255);
  ellipse(40,28,25,40);//boyd's left eye
  ellipse(60,28,25,40);//boyd's right eye

  // draw teeth
  fill(255,245,137);
  rect(50,70,30,20);
  line(40,60,40,80);
  line(45,60,45,80);
  line(50,60,50,80);
  line(55,60,55,80);
  line(60,60,60,80);
  
  // draw cheeks
  fill(203,128,58);
  ellipse(63,55,35,25);
  ellipse(37,55,35,25);
  fill(125);

  // draw nose
  rect(52,47,15,15);

  // draw whiskers
  line(35,55,10,45);
  line(35,60,10,70);
  line(35,57,10,57);
  line(65,55,90,45);
  line(65,60,90,70);
  line(65,57,90,57);
 
  // draw eyes, bulge on mouse move, red on mouse move
  fill(255,(mouseX+10),(mouseX+10));
  ellipse(40,25,(mouseX/3),(mouseX/3));
  ellipse(60,30,(mouseX/3),(mouseX/3));
}


