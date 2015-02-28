
void setup() {
  size (500,500) ;
  smooth();
   background(247,233,233);
}

void draw() {
  larva(0,0,0.2);
  larva(50,100,1.8);
  larva(150,100,3);
 larva(0,90,2);
}
void larva(int x, int y,float s) {
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  noStroke();

  //head line
  strokeWeight(4);
  stroke(83,178,126);
  line(250,50,270,100);
  line(280,50,260,100);
  stroke(83,234,150);
  strokeWeight(8);
  line(246,40,250,50);
  line(284,40,280,50);

  //leg
  strokeWeight(5);
  stroke(83,178,126);
  line(45,120,40,140);
  line(55,120,60,140);
  line(95,120,90,140);
  line(105,120,110,140);
  line(145,120,140,140);
  line(155,120,160,140);
  line(195,120,190,140);
  line(205,120,210,140);

  //body
  noStroke();
  fill(83,234,150);
  ellipse(260,100,70,70);
  ellipse(50,105,50,50);
  fill(114,206,114);
  ellipse(100,105,50,50);
  fill(83,234,150);
  ellipse(150,105,50,50);
  fill(114,206,114);
  ellipse(200,105,50,50);

  //eye
  noStroke();
  fill(255);
  ellipse(250,80,20,20);
  ellipse(275,80,20,20);
  fill(0);
  ellipse(253,75,10,10);
  ellipse(278,75,10,10);

  //mouse
  noStroke();
  fill(247,201,201);
  ellipse(240,90,18,8);
  ellipse(285,90,18,8);
  noStroke();
  fill(244,127,127);
  arc(260,100,70,70,0,QUARTER_PI);
  

}


