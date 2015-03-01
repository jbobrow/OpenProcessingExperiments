
void setup()
{
  size(500,500);
  background(255);
  smooth();
  stroke(0,0,0);
  noFill();
}


void draw()
{  
background(255);
int time;
time = millis()/100;

fill(0);
ellipse(200,100,mouseY/20,mouseY/20);
println(millis()/100);
ellipse(300,100,mouseY/15.5,mouseY/15.5);
ellipse(400,100,mouseY/14,mouseY/14);
ellipse(100,200,mouseY/13,mouseY/13);
ellipse(200,200,mouseY/12,mouseY/12);
ellipse(300,200,mouseY/11,mouseY/11);
ellipse(400,200,mouseY/ 10,mouseY/10);
ellipse(100,300,mouseY/9,mouseY/9);
ellipse(200,300,mouseY/8,mouseY/8);
ellipse(300,300,mouseY/7,mouseY/7);
ellipse(400,300,mouseY/6,mouseY/6);
ellipse(100,400,mouseY/5.9,mouseY/5.9);
ellipse(200,400,mouseY/5.6,mouseY/5.6);
ellipse(300,400,mouseY/5.3,mouseY/5.3);
ellipse(400,400,mouseY/4.9,mouseY/4.9);
 noFill();
 
ellipseMode(CENTER);
  ellipse(100,100,100,100);
  ellipse(200,100,100,100);
  ellipse(300,100,100,100);
  ellipse(400,100,100,100);

  ellipse(100,200,100,100);
  ellipse(200,200,100,100);
  ellipse(300,200,100,100);
  ellipse(400,200,100,100);

  ellipse(100,300,100,100);
  ellipse(200,300,100,100);
  ellipse(300,300,100,100);
  ellipse(400,300,100,100);

  ellipse(100,400,100,100);
  ellipse(200,400,100,100);
  ellipse(300,400,100,100);
  ellipse(400,400,100,100);

}
