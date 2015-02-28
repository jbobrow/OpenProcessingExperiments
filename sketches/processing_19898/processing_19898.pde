


void setup() {
  size(400,400);
  frameRate(3);

  background(110,16,157);
}



void draw() {
  background(110,16,157);
  float x = random(0,400);
  float y = random(0,400);

  strokeWeight(2);
  stroke(255);
  line(0,random(400),400,random(400));
  line(0,random(400),400,random(400));
  line(0,random(400),400,random(400));
  line(0,random(400),400,random(400));


  noStroke();
  /*
  for (float i = random(200,400), 
   rect(random(200,400),random(400),random(50,100),random(50,100));
   fill random((#aa096a),(#aa09b4));
   */


  fill (#aa096a);
  rect(random(200,400),random(400),random(50,100),random(50,100));
  fill(#aa09b4);
  rect(random(200,400),random(400),random(50,100),random(50,100));
  fill(#4c09b4);
  rect(random(200,400),random(400),random(50,100),random(50,100));
  fill(#1c09aa);
  rect(random(200,400),random(400),random(50,100),random(50,100));
  fill(#fe18b4);
  rect(random(200,400),random(400),random(50,100),random(50,100));


  fill(#2aff3d,100);
  noStroke();
  ellipse(x,y,200,200);

  noFill();
  strokeWeight(5);
  stroke(#1c09aa);
  beginShape();
  //v1
  vertex(100,0);
  //c1,c2,v2
  bezierVertex(random(-10,20), 130,random(-10),265, 100, 400 );
  endShape();

 stroke(#4c09b4);
  beginShape();
  //v1
  vertex(130,0);
  //c1,c2,v2
  bezierVertex(random(20), 130,random(20),265, 130, 400 );
  endShape();

 stroke(#aa09b4);
  beginShape();
  //v1
  vertex(160,0);
  //c1,c2,v2
  bezierVertex(random(50), 130,random(50),265, 160, 400 );
  endShape();


  /* rect(p1,p2,50,20);
   PShape s;
   s = loadShape("bezier.svg");
   smooth();
   shape(s, 100, 100, 100, 100);
   
   */
}


