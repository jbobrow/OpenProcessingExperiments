
void setup(){
  size(500,500);
  //noLoop();
}
void draw(){
  background(255);
  float x = random(500);
  float y= random(500);
  float a = random(300);
  float b = random(300);
  float c = random(300);
  noFill();
  stroke(a,b,c);
  strokeWeight(4);
  bezier(20,480,x,y,x,y,480,480);
  noStroke();
  fill(83,162,229);
  rect(140,0,30,400);
  fill(245,142,40);
  rect(0,320,230,30);
  fill(56,191,88);
  rect(130,280,350,15);
  fill(0,62,142);
  rect(180,110,30,150);
  fill(45,155,79);
  triangle(210,260,360,260,360,110);
  fill(240,232,73);
  triangle(210,260,360,110,210,110);
  fill(125,84,155);
  rect(30,100,100,150);
  fill(37,89,175);
  quad(40,40,60,100,100,100,120,40);
  fill(240,242,132);
  triangle(60,100,100,100,80,160);
  fill(211,105,133);
  ellipse(420,290,80,80);
  fill(120);
  triangle(430,330,390,40,470,100);
  stroke(242,20,20);
  strokeWeight(4);
  line(10,450,100,400);
  line(10,50,100,100);
  line(110,385,180,340);
  line(110,115,180,160);
  line(490,450,400,400);
  line(490,50,400,100);
  line(390,385,320,340);
  line(390,115,320,160);
  strokeWeight(10);
  line(110,440,200,375);
  line(390,440,300,375);
  float s = random(500);
  float t= random(500);
  float d = random(300);
  float e = random(300);
  float f = random(300);
  noFill();
  stroke(d,e,f);
  strokeWeight(4);
  bezier(20,480,s,t,s,t,480,480);
}


