
void setup() {
  size(600,600);
  smooth();
  background(200);
}

void draw() {
  bird(100,100, 0.5, 120);
  bird(300,100,1,0);
  bird(600,80,0.4,180);

  baby(100,300,1);
  baby(250,540,0.7);
  baby(455,870,0.5);
  baby(270,300,1);
  baby(332,540,0.7);
  baby(555,870,0.5);
}



void bird(int x, int y, float s, int c) {
  pushMatrix();
  scale(s);
  translate(x,y);
  fill(c);

  //head
  arc(100,100,100,120,PI,TWO_PI);
  triangle(30,79,50,100,56,70);
  //body
  arc(150,100,200,200,0,PI);
  arc(130,120,100,100,0,PI);

  //eye
  fill(255);
  stroke(255);
  strokeWeight(1);

  line(78,65,76,62);
  line(81,65,81,60.5);
  line(84,65,86,62);
  noStroke();
  ellipse(80,70,10,10);

  //leg
  stroke(0);
  strokeWeight(2);
  line(130,198,130,220);
  line(180,195,180,220);
  line(130,220,115,215);
  line(180,220,165,215);
  popMatrix();
}





void baby(int x1, int y1, float s1) {
  pushMatrix();
  scale(s1);
  translate(x1,y1);
 

  fill(255);
  noStroke();
  triangle(93,221,105,221,92,205);
  triangle(95,221,110,205,108,221);
  //babyhead
  fill(0);
  ellipse(100,230,30,30);

  //babybody
  fill(0);
  ellipse(100,255,40,40);
  //babyeye
  fill(255);
  ellipse(92,227,3,3);
  ellipse(108,227,3,3);
  popMatrix();
}


