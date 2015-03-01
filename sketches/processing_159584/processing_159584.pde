
void setup() {
  size(400,400);
}

void draw() {
  background(150,150,150);
  //back wing
  noStroke();
  fill(30,30,30);
  quad(200,210,220,100,270,40,380,170);
  fill(0,0,0);
  //Neck, body and head
  ellipse(250,238,190,100);
  ellipse(160,210,55,55);
  ellipse(150,200,50,50);
  ellipse(140,175,50,50);
  ellipse(135,150,50,50);
  ellipse(130,125,45,45);
  ellipse(120,100,35,35);
  ellipse(105,90,35,35);
  ellipse(90,85,35,35);
  triangle(100,70,50,160,30,60);
  fill(200,200,200);
  triangle(30,60,40,40,50,63);
  triangle(100,70,90,47,80,66);
  fill(0,0,0);
  //Front wing
  quad(200,210,200,150,300,50,350,190);
  fill(200,150,0);
  //Eyes
  ellipse(50,80,15,10);
  ellipse(75,85,15,10);
  stroke(150,0,200);
  //Wing veins
  strokeWeight(4);
  line(220,190,290,90);
  line(250,150,300,130);
  line(250,150,330,170);
  noStroke();
  //Tail
  fill(0,0,0);
  arc(340,238,60,60,PI+QUARTER_PI, TWO_PI);
  ellipse(360,240,35,35);
  ellipse(355,255,35,35);
  ellipse(350,270,35,35);
  ellipse(345,285,35,35);
  ellipse(350,305,35,35);
  ellipse(360,320,35,35);
  ellipse(370,335,25,25);
  ellipse(380,335,25,25);
  ellipse(390,320,25,25);
  //Legs
  arc(200, 275, 100, 90, PI, PI+QUARTER_PI);
  ellipse(165,285,35,35);
  rect(150,270,30,60);
  ellipse(165,330,30,30);
  ellipse(180,285,35,35);
  rect(165,270,30,60);
  ellipse(180,330,30,30);
  ellipse(335,285,35,35);
  rect(320,250,30,80);
  ellipse(335,330,30,30);
}


