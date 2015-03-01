
void setup () {
  noCursor();
  size(500,500);

  
}

void draw () {
  background(0);
 
   fill(255);
  ellipse(250,250,3,3);
  ellipse(200,200,3,3);
  ellipse(500,50,3,3);
  ellipse(450,450,3,3);
  ellipse(100,100,3,3);
  ellipse(20,470,3,3);
  ellipse(30,300,3,3);
  ellipse(250,400,3,3);
  ellipse(350,50,3,3);
  ellipse(45,150,3,3);
  ellipse(380,200,3,3);
  ellipse(120,20,3,3);
  ellipse(220,30,3,3);
  ellipse(225,50,3,3);
  ellipse(100,380,3,3);
  ellipse(350,370,3,3);
  
 if (mousePressed) {
   stroke(255);
  line(250,250,mouseX,mouseY);
  line(200,200,mouseX,mouseY);
  line(500,50,mouseX,mouseY);
  line(450,450,mouseX,mouseY);
  line(100,100,mouseX,mouseY);
  line(20,470,mouseX,mouseY);
  line(30,300,mouseX,mouseY);
  line(250,400,mouseX,mouseY);
  line(350,50,mouseX,mouseY);
  line(45,150,mouseX,mouseY);
  line(380,200,mouseX,mouseY);
  line(120,20,mouseX,mouseY);
  line(220,30,mouseX,mouseY);
  line(225,50,mouseX,mouseY);
  line(100,380,mouseX,mouseY);
  line(350,370,mouseX,mouseY);
}
}
