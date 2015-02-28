
PImage a,g,h,i,j;

void setup() {
  background(0);
  size(400,400);
  a = loadImage("bg.jpg");
  g = loadImage("003.png");
  h = loadImage("2r_1.png");
  i = loadImage("2r_2.png");
  j = loadImage("2r_3.png");
  smooth();
}

void draw() {
  image(a,0,-50);
  image(g,2,100);
 
  bird(65,20,1);
  baby(-55,100,1);
  baby(10,100,1);
  baby(75,100,1);
 
  image(h,10,340);
  image(i,78,340);
  image(j,145,340);
  

  strokeWeight(7);
  line(140,306,400,261);
}

void bird(int x, int y, float s) {
  pushMatrix();
  scale(s);
  translate(x,y);


  stroke(255);
  strokeWeight(5);
  noFill();
  //head
  arc(100,100,100,120,PI,TWO_PI);

  //mouse
  triangle(30,79,50,100,56,70);
  //body
  arc(150,100,200,200,0,PI);


  //leg
  line(130,198,130,225);
  line(130,225,115,225);

  line(180,195,180,220);
  line(180,220,165,218);

  //tail
  beginShape();
  vertex(150, 100);
  bezierVertex(260, 100, 245, 30, 250, 100);
  endShape();
  //tail2
  beginShape();
  vertex(250, 105);
  bezierVertex(280, 110, 285, 100, 243, 140);
  endShape();
  //wing
  beginShape();
  vertex(150, 100);
  bezierVertex(200, 130, 215, 80, 210, 120);
  bezierVertex(206, 130, 200, 167, 148, 155);
  endShape();

  //eye
  strokeWeight(1);
  ellipse(78,82,10,10);
  //eyelid
  strokeWeight(3);
  line(75,64,83,64);


  popMatrix();
}





void baby(int x1, int y1, float s1) {
  pushMatrix();
  scale(s1);
  translate(x1,y1);


  fill(255,0,0);
  noStroke();
  triangle(93,221,105,221,92,205);
  triangle(95,221,110,205,108,221);
  //babyhead
  fill(255);
  ellipse(100,230,30,30);

  //babybody
  ellipse(100,255,40,40);
  //babyeye
  fill(0);
  ellipse(92,227,3,3);
  ellipse(108,227,3,3);
  popMatrix();
}


