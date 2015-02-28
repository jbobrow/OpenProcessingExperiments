
void setup() {
  size (500,500);
  smooth();
}

void draw() {
  background(255);

  myEEEE(0,0,1,255);
  myEEEE(300,0, 0.5,0);
  myEEEE(0,320, 2.2,100);
}

void myEEEE(int x, int y, float s, int c) {
  translate(x,y);
  scale(s);
  strokeWeight(1);
  //bottom line
  line(0,280,30,280);
  line(150,280,200,280);

  //basic line
  line(20,50,20,280);
  line(30,50,30,280);
  line(60,90,120,90);
  line(160,50,160,280);
  line(150,50,150,280);
  line(40,270,140,270);
  line(60,90,60,230);
  line(120,90,120,230);
  line(60,230,120,230);
  line(60,230,40,260);
  line(120,230,140,260);

  //ZangSic line
  line(80,90,80,230);
  line(100,90,100,230);
  line(65,50,80,90);
  line(115,50,100,90);
  line(60,225,120,225);
  line(40,60,140,60);
  line(35,57,145,57);
  line(53,80,127,80);

  noFill();
  rect(60,10,60,20);
  rect(170,140,20,40);
  quad(110,160,110,170,130,180,130,170);
  quad(50,170,50,180,70,170,70,160);
  rect(40,170,10,10);
  rect(130,170,10,10);

  fill(c, 0,0);
  ellipse(30,30,5,5);
  ellipse(50,30,5,5);
  ellipse(130,30,5,5);
  ellipse(150,30,5,5);
  rect(20,40,140,10);
  quad(30,53,40,65,40,270,30,280);
  quad(140,65,150,50,150,280,140,270);
  quad(40,170,50,170,70,160,60,160);
  quad(110,160,120,160,140,170,130,170);
  //button
  ellipse(180,150,8,8);
  ellipse(180,170,8,8);

  //up
  fill(255,0,0);
  ellipse(180,60,14,14);
  ellipse(180,60,9,9);
  //down
  fill(0,255,0);
  ellipse(180,90,14,14);
  ellipse(180,90,9,9);

  strokeWeight(3);
  line(30,50,60,90);
  line(150,50,120,90);
}

// line();
// ellipse();

                
                
