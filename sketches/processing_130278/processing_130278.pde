
void setup () {
  size(400,400);
  strokeWeight(random(5));
  frameRate(4);
}
void draw() {
  background (random(0,256), random(0,256), random(0,256));
  fill(100,215,90);
  ellipse(100,150,125,100);
  fill(65);
  rect(50,200,random(90),random(100));
  fill(10,120,210,30);
  quad(250,400,a+b,random(100),350,random(50),300,200);
  line(400,400,mouseX,mouseY);
  line(100,400,mouseX-c,mouseY+a);
  strokeCap(ROUND);
  line(0,15,400,0);
  line(0,40,400,30);
  line(0,70,400,100);
  ellipse(50,30,20,10);
  line(0,150,400,150);
  line(30,0,45,400);
  line(350,0,290,400);
  fill(0);
  ellipse(350,100,random(60),random(90));
  fill(45,190,200);
  triangle(0,350,30,320,50,350);
  fill(255);
  ellipse(400,random(250),10,10);
  ellipse(250,320,10,10);
  ellipse(random(200),400,10,10);
  ellipse(random(400),random(400),10,10);
  ellipse(random(150),310,10,10);
  ellipse(100,random(300),10,10);
  ellipse(random(400),mouseX,10,10);
  ellipse(mouseX,random(50),10,10);
  ellipse(mouseY,random(30),10,10);
  fill(32,48,190);
  rect(300,350,random(50),random(20));
  line(200,0,random(200,250),random(400,250));
  line(0,200,random(400,250),random(200,250));
  
}
int a=20;
int b=a+13;
int c=b+a-3;

