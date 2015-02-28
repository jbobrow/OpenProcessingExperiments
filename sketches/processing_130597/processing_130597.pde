
void setup () {
  size(400,400);
  strokeWeight(random(5));
  frameRate(10);
}
void draw(){
  background (random(0,150),random(0,400),random(0,400));

int a=10;
int b=a+7;
int c=b+a-3;

  fill(10,255,155);
  ellipse(220,100,random(50),100);
  ellipse(250,320,10,10);
  ellipse(random(100),280,a+c,30);
  ellipse(random(150),random(300),a,80);
  ellipse(random(300),180,100,100);
  
  fill(65,20,160);
  rect(20,150,random(100),random(100));
  
  fill(400,300,20);
  quad(250,200,a+b,random(100),20,random(80),30,76);
  
  stroke(100,310,150);
  fill(23,190,150);
  triangle (350,220,280,370,300,220);
  
  line(100,0,random(300,400),random(400,300));
  line(0,100,random(400,200),random(280,350));
  line((random(0,400)),0,(random(0,400)),400);
  
  stroke(0,520,250);
  fill(400,450,0);
  beginShape();
  vertex(200, 150);
  vertex(214, 180);
  vertex(247, 185);
  vertex(223, 207);
  vertex(229, 240);
  vertex(200, 225);
  vertex(171, 240);
  vertex(177, 207);
  vertex(153, 185);
  vertex(186, 180);
  endShape(CLOSE);

}

