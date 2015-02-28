
//Martin C, Animation, CP1, Mods 4-5

void setup()
{
  size(600, 400);
  frameRate(60);
  background(125);
}

float x2 = 0;
float rot = PI/2;
float time = 0;
int x3 = 180;
int y3 = 262;
int x4 = 185;
int y4 = 265;
int speed = 20;
int fl = 25;

void draw()
{
  time = time + 0.025;
  recoil();
  shot();
  explosion();

  if (time > 1.5)
  {  
    x2 = 0;
    x3 = 180;
    x4 = 185;
    rot = PI/2;
    time = 0;
  }
}

void recoil()
{
  background(125);

  line(100, 350, 120, 310); //legs
  line(140, 350, 120, 310);
  line(120, 310, 120, 270); //body
  ellipse(120, 255, 30, 30); //head

  translate(120, 270);
  rotate(x2*rot);
  translate(-120, -270);

  line(120, 270, 130, 280); //arms
  line(120, 270, 135, 275);
  line(130, 280, 150, 270);
  line(135, 275, 150, 270);

  fill(0);
  strokeWeight(1);
  beginShape(); //gun
  vertex(150, 280);
  vertex(150, 260);
  vertex(180, 260);
  vertex(180, 270);
  vertex(160, 270);
  vertex(160, 280);
  vertex(150, 280);
  endShape();

  translate(120, 270);
  rotate(-1*(x2*rot));
  translate(-120, -270);

  if (x2 > -1.5)
  {
    x2 = x2 - 0.025;
    rot = PI/2 * x2+1.7;
  }
}

void shot()
{
  noStroke();
  fill(200, 200, 20);
  quad(x3, y3, x3, y4, x4, y4, x4, y3);
  fill(0);
  stroke(0);

  if (x3<470)
  {
    x3 = x3 + speed;
    x4 = x4 + speed;
  }
}

void explosion()
{
  //barrel
  fill(131, 41, 16);
  ellipse(470, 340, 70, 20);
  noStroke();
  rect(435, 240, 70, 100);
  stroke(0);
  ellipse(470, 240, 70, 20);
  noFill();
  arc(470, 260, 70, 20, 0, PI);
  arc(470, 280, 70, 20, 0, PI);
  arc(470, 300, 70, 20, 0, PI);
  arc(470, 320, 70, 20, 0, PI);
  line(435, 240, 435, 340);
  line(505, 240, 505, 340);
  fill(255, 0, 0);
  beginShape(); //flame icon
  vertex(470, 300);
  vertex(460, 296);
  vertex(454, 284);
  vertex(462, 290);
  vertex(460, 276);
  vertex(464, 284);
  vertex(470, 270);
  vertex(476, 284);
  vertex(480, 276);
  vertex(478, 290);
  vertex(486, 284);
  vertex(480, 296);
  vertex(470, 300);
  endShape();
  fill(0);
  noStroke();
  
  //flames
  
  if (time > 0.40)
  {
    beginShape();
    fill(250, 57, 35);
    vertex(random(422-fl, 422+fl), random(380-fl, 380+fl));
    vertex(random(287-fl, 287+fl), random(296-fl, 296+fl));
    vertex(random(304-fl, 304+fl), random(145-fl, 145+fl));
    vertex(random(343-fl, 343+fl), random(126-fl, 126+fl));
    vertex(random(407-fl, 407+fl), random(-46-fl, -46+fl));
    vertex(random(528-fl, 528+fl), random(52-fl, 52+fl));
    vertex(random(523-fl, 523+fl), random(158-fl, 158+fl));
    vertex(random(686-fl, 686+fl), random(118-fl, 118+fl));
    vertex(random(562-fl, 562+fl), random(274-fl, 274+fl));
    vertex(random(657-fl, 657+fl), random(413-fl, 413+fl));
    vertex(random(422-fl, 422+fl), random(380-fl, 380+fl));
    endShape();
    fill(0);
  }
  
  if (time > 0.375)
  {
    beginShape();
    fill(250, 100, 13);
    vertex(random(458-fl, 458+fl), random(358-fl, 358+fl));
    vertex(random(388-fl, 388+fl), random(282-fl, 282+fl));
    vertex(random(346-fl, 346+fl), random(256-fl, 256+fl));
    vertex(random(426-fl, 426+fl), random(243-fl, 243+fl));
    vertex(random(469-fl, 469+fl), random(197-fl, 197+fl));
    vertex(random(514-fl, 514+fl), random(284-fl, 284+fl));
    vertex(random(582-fl, 582+fl), random(308-fl, 308+fl));
    vertex(random(458-fl, 458+fl), random(358-fl, 358+fl));
    endShape();
    fill(0);
  }
  
  if (time > 0.35)
  {
    beginShape();
    fill(250, 143, 13);
    vertex(random(464-fl, 464+fl), random(341-fl, 341+fl));
    vertex(random(426-fl, 426+fl), random(292-fl, 292+fl));
    vertex(random(443-fl, 443+fl), random(246-fl, 246+fl));
    vertex(random(459-fl, 459+fl), random(280-fl, 280+fl));
    vertex(random(487-fl, 487+fl), random(234-fl, 234+fl));
    vertex(random(515-fl, 515+fl), random(280-fl, 280+fl));
    vertex(random(464-fl, 464+fl), random(341-fl, 341+fl));
    endShape();
    fill(0);
  }
  stroke(0);
}
