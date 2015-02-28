
float x, y;
float w, h;

void setup () {
  size (500,500);
  smooth();
}

void draw () {
  drawBackground();
  drawBird();
  drawWorm();
}

void drawBackground () {
  x=150;
  y=100;
  w=60;
  h=50;
  
  noStroke();
  fill(167,255,106);
  rect(0,390,500,500);
  fill(85,89,255);
  rect(0,0,500,390);
  
  fill(200);
  ellipse(x-50,y,h,h);
  ellipse(x-40,y+10,w,w);
  ellipse(x-10,y+30,w,w);
  ellipse(x,y,w,w);
  ellipse(x+20,y+10,h,h);
  
  ellipse(x+230,y+10,h,h);
  ellipse(x+200,y+10,w,w);
  ellipse(x+210,y+30,w,w);
  ellipse(x+250,y+20,w,w);
  ellipse(x+260,y+30,h,h);
  ellipse(x+350,y+200,h,h);
  
  noStroke();
  fill(255,255,10);
  ellipse(450,50,65,65);

}
  
void drawWorm() {
  stroke(247,100,238);
  strokeWeight(10);
  line(370,430,395,440);
  stroke(0);
  strokeWeight(4);
  point(370,430);
  
}  

void drawBird() {
  strokeWeight(10);
  x = height/2;
  y = width/2;
  w = 200;
  h = 250;
  fill(mouseX,0,mouseY);
  noStroke();
  ellipse(x,y,w,h);
  ellipse(x,y/2,w/2,h/2);
  
  beginShape();
  curveVertex(x,y);
  curveVertex(250,175);
  curveVertex(100,250);
  curveVertex(250,260);
  endShape(CLOSE);
  
  beginShape();
  curveVertex(x,y);
  curveVertex(320,195);
  curveVertex(400,250);
  curveVertex(310,240);
  endShape(CLOSE);
 
  triangle(250,70,275,45,275,90);
  triangle(260,70,285,45,290,100);
  triangle(240,79,250,45,280,90);
  
  fill(255,182,85);
  triangle(x-20,y-100,x+10,y-100,x-5,y-80);
  stroke(255,182,85);
  
  x = 225;
  y = 390;
  w = 200;
  h = 405;
 
  line(x,y-20,w+15,h);
  
  line(x-6,y,w,h-10);
  line(x-6,y,w+5,h-5);
  
  line(x+50,y-20,w+85,h);
  line(x+57,y,w+95,h);
  line(282,y,w+105,h);
  
  
  fill(0);
  ellipse(x,w-70,3,3);
  ellipse(x+40,w-70,3,3);
}

  void mousePressed () {
  noLoop();
  stroke(247,100,238);
  strokeWeight(10);
  line(235,165,255,170);
  stroke(0);
  strokeWeight(4);
  point(235,165);
  noStroke();
  fill(167,255,106);
  rect(0,420,500,500);
 
  }

  

