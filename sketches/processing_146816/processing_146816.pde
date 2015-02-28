
int counter = 0;
int headShape;
int ra = 122;
int ga = 198;
int ba = 196;
int rb = 202;
int gb = 139;
int bb = 237;
int rc = 252;
int gc = 156;
int bc = 10;
float randEar;
float randNum;
float randHair = 200;
float randR;
float randB;
float randG;
float eye = 22;
float eye2 = 12;
float mouth = 40;
float mouth2 = 18;
float shoulders = 190;

void setup(){
  size(300,300);
}

void draw(){
  
  
  background(245,243,180);
  translate(150,150);
  noStroke();
  
  // hair
  fill(ra,ba,ga);
  rect(-130,-70,260,randHair);
  ellipse(0,-70,260,100);
  
  // head
  fill(rb,gb,bb);
  ellipse(-90,randEar,20,30);
  ellipse(90,randEar,20,30);
  fill(166,141,237);
  ellipse(-85,randEar,18,20);
  ellipse(85,randEar,18,20);
  fill(rb,gb,bb);
  rect(-30,60,60,100);
  fill(113);
  ellipse(0,92,60,25);
  fill(rb,gb,bb);
  ellipse(0,0,175,200);
  fill(randR);
  rectMode(CENTER);
  rect(0,145,shoulders,20,14);
  rectMode(CORNER);
  rect(-30,120,60,7);
  fill(randR,randG,randB);
  quad(-7,125,-3,133,4,123,3,115);
 
  // bangs
  noStroke();
  fill(ra,ba,ga);
  rect(-85,-106,170,76);
  stroke(rb,gb,bb);
  strokeWeight(3);
  pushMatrix();
  translate(randNum,0);
  line(35,-30,40,-70);
  popMatrix();
  strokeWeight(1);
  
  // eyes
  fill(255,255,255);
  strokeWeight(0.5);
  stroke(0,0,0);
  ellipse(-30,0,eye,eye);
  ellipse(30,0,eye,eye);
  noStroke();
  fill(106,180,178);
  ellipse(30,2,eye2,eye2);
  ellipse(-30,2,eye2,eye2);
  fill(0);
  ellipse(30,2,6,6);
  ellipse(-30,2,6,6);
  
  // nose
  stroke(0,0,0);
  line(0,-2,-8,25);
  line(-8,25,6,27);
  
  // mouth
  fill(rc,gc,bc);
  noStroke();
  ellipse(0,55,mouth,mouth2);
  fill(rb,gb,bb);
  triangle(0,51,-7,40,7,40);
  strokeWeight(2);
  stroke(rb,gb,bb);
  line(-50,55,50,55);
  
  
}

void keyPressed(){
  if (counter == 2){
    ra = 202;
    ba = 139;
    ga = 237;
    rb = 252;
    gb = 156;
    bb = 10;
    rc = 122;
    gc = 198;
    bc = 196; 
  }
  
  if (counter == 1){
    ra = 252;
    ba = 156;
    ga = 10;
    rb = 122;
    gb = 198;
    bb = 196;
    rc = 202;
    gc = 139;
    bc = 237;
  }
  
  if (counter == 0){
    ra = 122;
    ga = 198;
    ba = 196;
    rb = 202;
    gb = 139;
    bb = 237;
    rc = 252;
    gc = 156;
    bc = 10;
  }  
  counter++;
  if (counter == 3){
    counter = 0;
  }
  
  randEar = random(-10,15);
  randNum = random(-15,30);
  randHair = random(100,250);
  randR = random(0,255);
  randG = random(0,255);
  randB = random(0,255);
  eye = random(20,29);
  eye2 = random(10,16);
  mouth = random(15,45);
  mouth2 = random(12,25);
  shoulders = random(160,210);
}


