
void setup() {

  size(400,400);
  background(14,7,170);

  fill(0,25,40);
  smooth();
  noStroke();

  beginShape();
  vertex(400,400);
  vertex(390,390);
  vertex(10,390);
  vertex(380,20);
  vertex(380,380);
  vertex(50,350);
  vertex(350,50);
  vertex(300,20);
  vertex(20,300);
  vertex(10,10);
  vertex(10,20);
  vertex(30,60);
  vertex(60,30);
  vertex(10,40);
  vertex(390,10);
  vertex(30,30);
  vertex(5,300);
  vertex(10,230);
  vertex(100,30);
  vertex(90,400);
  vertex(250,300);
  vertex(300,250);
  vertex(375,10);


  endShape();


  fill(0,5,150);
  rect(10,10,10,10);

  fill(0,70,250);
  beginShape();
  vertex(190,130);
  vertex(190,100);
  vertex(170,120);
  endShape();

  fill(0,20,100);
  triangle(35,300,20,370,25,300);

  fill(0,100,300);
  rect(20,330,10,10);


  fill(150,250,250);
  beginShape();
  vertex(380,380);
  vertex(350,350);
  vertex(380,380);
  vertex(300,390);
  endShape();

  fill(250,250,250);
  beginShape();
  vertex(390,390);
  vertex(350,350);
  vertex(390,300);
  vertex(300,390);
  endShape();

  fill(50,150,250);
  triangle(190,130,140,100,150,140);

  fill(250,250,250);
  triangle(190,130,160,140,180,125); 

  fill(0,50,150);
  triangle(160,140,200,180,170,150);

  fill(0,0,100);
  triangle(170,120,190,100,200,100);

  fill(150,35,35);
  ellipse(350,292,35,35);

  fill(250,250,250);
  ellipse(350,292,20,20);

  fill(10,0,30);
  ellipse(350,292,5,5);

  fill(320,310,310);
    beginShape();
  vertex(350,250);
  vertex(300,270);
  vertex(360,230);
  endShape();

  fill(320,350,350);
  beginShape();
  vertex(300,200);
  vertex(320,270);
  vertex(350,140);
  endShape();

strokeWeight(0);
fill(10,10,250);
rect(157,297,20,20);
fill(10,10,150);
rect(150,290,13,13);



 strokeWeight(8);
  stroke(250);
  noFill();
  beginShape();
  vertex(137,287);
  bezierVertex(20,380,0,0,157,307);
  endShape();
  
}


