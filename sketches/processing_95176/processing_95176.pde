
int x=150;
int y=120;

void setup() {
  background(255,127,182);
  size(300,300);
  smooth();
  strokeWeight(2);
  strokeJoin(ROUND);
}

void draw() {
//ear
  background(255,127,182);
  fill(159,80,0);
  arc(x-45,y-90,20,20,x-30,y+240);
  arc(x+45,y-90,20,20,x+30,y+300);


// head
  fill(159,80,0);
  beginShape();
  vertex(x-45,y-90);
  vertex(x+45,y-90);
  vertex(x+60,y-60);
  vertex(x+45,y-30);
  vertex(x-45,y-30);
  vertex(x-60,y-60);
  endShape(CLOSE);

//eyes
  fill(0);
  ellipse(x-24,y-72,11,11);
  ellipse(x+24,y-72,11,11);
  fill(255);
  ellipse(x-22,y-72,6,6);
  ellipse(x+26,y-72,6,6);

//mouth area
  fill(255,205,127);
  beginShape();
  vertex(x-18,y-66);
  vertex(x+18,y-66);
  vertex(x+30,y-51);
  vertex(x+18,y-36);
  vertex(x-18,y-36);
  vertex(x-30,y-51);
  endShape(CLOSE);

//nose
  fill(0);
  triangle(x-6,y-57,x+6,y-57,x,y-51);
  line(x,y-51,x,y-45);
  line(x,y-45,x-6,y-39);
  line(x,y-45,x+6,y-39);

//body
  fill(159,80,0);
  beginShape();
  vertex(x-45,y-30);
  vertex(x+45,y-30);
  vertex(x+60,y+60);
  vertex(x,y+90);
  vertex(x-60,y+60);
  endShape(CLOSE);

//arms
  quad(x-45,y-30,x-51,y+6,x-90,y+21,x-90,y);
  rect(x-105,y,x-135,y-99);
  quad(x+45,y-30,x+90,y,x+90,y+21,x+51,y+6);
  rect(x+90,y,x-125,y-99);

//left leg
  beginShape();
  vertex(x-60,y+60);
  vertex(x-12,y+84);
  vertex(x-15,y+165);
  vertex(x-69,y+165);
  vertex(x-75,y+141);
  vertex(x-45,y+135);
  endShape(CLOSE);
  line(x-45,y+135,x-15,y+165);

//belly
  fill(255,205,127);
  beginShape();
  vertex(x-30,y-15);
  vertex(x+30,y-15);
  vertex(x+45,y+45);
  vertex(x,y+75);
  vertex(x-45,y+45);
  endShape(CLOSE);

//right leg
  fill(159,80,0);
  beginShape();
  vertex(x+60,y+60);
  vertex(x+45,y+135);
  vertex(x+75,y+141);
  vertex(x+69,y+165);
  vertex(x+15,y+165);
  vertex(x+12,y+84);
  endShape(CLOSE);
  line(x+15,y+165,x+45,y+135);
}

