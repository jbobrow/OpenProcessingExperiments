
void setup() {
  //background
size(400,600);
fill(238,232,170);
rect(0,0,400,800);
}

void draw() {
  if (mouseX>200) {
  beam();
  rotate(PI/10);
  lightsaber();
}
else {
  fill(238,232,170);
rect(0,0,400,800);
  rotate(PI/10);
  lightsaber();
}
}

void lightsaber() {
noStroke();
//lightsaber body
noStroke();
fill(192,192,192);
rect(160,200,80,375);
//top triangle part
noStroke();
fill(0,0,0);
triangle(160,200,240,200,240,140);
//top black rectangle
rect(160,200,80,30);
//middle black rectangle
rect(160,300,80,80);
//bottom left rectangle
rect(153,420,18,155);
//bottom middle rectangle
rect(193,420,18,155);
//bottom right triangle
rect(231,420,18,155);
//middle silver rectangle
fill(192,192,192);
rect(130,303,30,74);
//black line on middle silver rectangle
fill(0,0,0);
rect(130,303,8,74);
//random thing on top right
fill(192,192,192);
ellipse(240,200,4,25);
//small rectangle on top right
rect(240,200,7,8);
//small ellipse on small rectangle on top right
ellipse(247,204,4,14);
//bottom rectangle details
stroke(50,50,50,200);
strokeWeight(4);
line(162,423,162,570);
line(202,423,202,570);
line(240,423,240,570);
//other small black rectangle on top right
noStroke();
fill(0,0,0);
rect(230,230,10,40);
  }
void beam () {
  //beam
  float r=random(75,100);
  float g=random(155,200);
  float b=random(15,20);
  float h=random(40,45);
  int x=1;
stroke(255,0,0,g);
strokeWeight(h);
line(135,230,195,0);
stroke(255,255,255,r);
strokeWeight(b);
line(135,230,195,0);
strokeWeight(3);
line(138,233,198,0);
}
