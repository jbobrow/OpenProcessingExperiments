

void setup() {
  size(300,300);
  frameRate(7);
  background(187,250,255);
  stroke(255);
  line(30,100,100,50);
}


void draw() {
  background(0);
   fill( random(205) ,0,35);
  stroke(0);
  rect(100,random(150),25,30);

  fill( random(205) ,0,35);
  stroke(0);
  rect( random(200),70, random(45),20);

fill( random(90) ,30,30);
ellipse(random(250),(150),30,30);

fill( random(90) ,30,30);
ellipse(random(100),(100),30,30);


fill( random(90) ,30,30);
ellipse(200, random(300),30,30);

fill( random(90) ,30,30);
ellipse(250, random(300),30,30);



text("CHAOS", mouseX,mouseY,random(100),250);

}
  
