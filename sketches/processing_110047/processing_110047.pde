
//Copyright William Aldrich, September 12 2013, Pittsburgh, PA

float n;

void setup()
{
  size(400,400);
  background(255);
}

void draw()
{
  snake(pmouseX,pmouseY);
  jim(mouseX,mouseY);
  if(mousePressed){
    tongue(mouseX,mouseY);
  }
}

void jim(float x, float y)
{
  noStroke();
  fill(240,196,121);
  ellipse(x-100,y-10,30,40);
  ellipse(x+100,y-10,30,40);

  stroke(0);
  strokeWeight(2);
  line(x-110,y-30,x-80,y-20);
  line(x+110,y-30,x+80,y-20);

  noStroke();
  fill(240,196,121);
  ellipse(x,y,200,170);

  stroke(0);
  strokeWeight(2);
  line(x-110,y-30,x+110,y-30);

  noFill();
  beginShape();
  curveVertex(x-75,y-35);
  curveVertex(x-70,y-30);
  curveVertex(x-60,y);
  curveVertex(x-20,y);
  curveVertex(x-10,y-30);
  curveVertex(x-5,y-35);
  endShape();

  beginShape();
  curveVertex(x+75,y-35);
  curveVertex(x+70,y-30);
  curveVertex(x+60,y);
  curveVertex(x+20,y);
  curveVertex(x+10,y-30);
  curveVertex(x+5,y-35);
  endShape();

  stroke(130);
  line(x-45,y-95,x-25,y-60);
  line(x-25,y-60,x,y-95);
  line(x,y-95,x+25,y-60);
  line(x+25,y-60,x+45,y-95);

  fill(255);
  noStroke();
  ellipse(x-40,y-15,30,20);
  ellipse(x+40,y-15,30,20);

  fill(120,255,120);
  stroke(0);
  strokeWeight(2);
  ellipse(x-40,y-15,10,10);
  ellipse(x+40,y-15,10,10);

  noStroke();
  fill(130);
  beginShape();
  curveVertex(x-45,y+45);
  curveVertex(x-40,y+40);
  curveVertex(x-20,y+20);
  curveVertex(x,y+10);
  curveVertex(x+20,y+20);
  curveVertex(x+40,y+40);
  curveVertex(x+45,y+45);
  endShape();

  fill(240,196,121);
  stroke(0);
  strokeWeight(1);
  beginShape();
  curveVertex(x-25,y);
  curveVertex(x-20,y+5);
  curveVertex(x-10,y+15);
  curveVertex(x+10,y+15);
  curveVertex(x+20,y+5);
  curveVertex(x+25,y);
  endShape();
}

void snake(float x, float y)
{
  n = n + .5;
  fill(0,n,0);
  noStroke();
  ellipse(x,y,250,170);
}

void tongue(float x, float y)
{
  fill(255,0,0);
  noStroke();
  rect(x-10,y+40,20,50);
  triangle(x-10,y+90,x-10,y+110,x,y+90);
  triangle(x+10,y+90,x+10,y+110,x,y+90);
}


