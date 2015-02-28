
//caterpillar test

float x,y,wd,ht;
float easingCoefficient;

void setup()
{
  size(400,400);
  background(255);
  x=200;
  y=200;
  wd=width*.5;
  ht=height*.5;
  easingCoefficient=0.1;
  smooth();
}


void draw()
{
  backgroundprep();
  caterpillarbody();
  if (keyCode == UP)
  {
    background2();
    butterflybody();
  }
}
 

void backgroundprep()
{
 fill(255,255,255);
 rect(0,0,400,400); 
}



void background2()
{
 fill(232,248,255);
 rect(0,0,400,400); 
}




void caterpillarbody()
{
  float dx = mouseX-x;
  float dy = mouseY-y;
  
  x=x+(dx*easingCoefficient);
  y=y+(dy*easingCoefficient);
  
  //caterpillar body segmant 1
  ellipseMode(CORNER);
  noStroke();
  fill(0,175,13);
  ellipse(x,y,wd*.2,ht*.2);
  fill(0,216,16,200);
  ellipse(x,y,wd*.17,ht*.17);

  //caterpillar body segment 2
  ellipseMode(CORNER);
  noStroke();
  fill(0,175,13);
  ellipse(x-x*.05,y+y*.1,wd*.17,ht*.17);
  fill(0,216,16,200);
  ellipse(x-x*.05,y+y*.1,wd*.14,ht*.14);
  
  //caterpillar body segmant 3
  ellipseMode(CORNER);
  noStroke();
  fill(0,175,13);
  ellipse(x-x*.1,y+y*.2,wd*.14,ht*.14);
  fill(0,216,16,200);
  ellipse(x-x*.1,y+y*.2,wd*.11,ht*.11);

  //caterpillar body segmant 4
  ellipseMode(CORNER);
  noStroke();
  fill(0,175,13);
  ellipse(x-x*.15,y+y*.3,wd*.13,ht*.13);
  fill(0,216,16,200);
  ellipse(x-x*.15,y+y*.3,wd*.1,ht*.1);
  
  //antenna
  stroke(0);
  strokeWeight(1.5);
  noFill();
    //left antenna
    arc(x-wd*.17,y-ht*.15,wd*.25,ht*.25,radians(-20),radians(20));
    //right antenna
    arc(x+wd*.13,y-ht*.15,wd*.25,ht*.25,radians(160),radians(200));
}



void butterflybody()
{
  //butterfly wing left
  noStroke();
  fill(0,227,255,100);
  
  if (mousePressed == true)
  {  
    beginShape();
      curveVertex(x-x*.1,y+y*.15);
      curveVertex(x-x*.15,y+y*.25);
      curveVertex(x-x*.45,y+y*.25);
      curveVertex(x-x*.4,y-y*.25);
      curveVertex(x-x*.15,y-y*.15);
      curveVertex(x-x*.15,y+y*.25);
      curveVertex(x-x*.1,y+y*.15);
    endShape();
  }
  
  if (mousePressed == false)
  {
    beginShape();
      curveVertex(x-x*.05,y+y*.1);
      curveVertex(x-x*.1,y+y*.2);
      curveVertex(x-x*.4,y+y*.2);
      curveVertex(x-x*.35,y-y*.2);
      curveVertex(x-x*.1,y-y*.1);
      curveVertex(x-x*.1,y+y*.2);
      curveVertex(x-x*.05,y+y*.1);
    endShape(); 
    
    fill(0,159,255,50);
    beginShape();
      curveVertex(x-x*.1,y+y*.15);
      curveVertex(x-x*.15,y+y*.25);
      curveVertex(x-x*.45,y+y*.25);
      curveVertex(x-x*.4,y-y*.25);
      curveVertex(x-x*.15,y-y*.15);
      curveVertex(x-x*.15,y+y*.25);
      curveVertex(x-x*.1,y+y*.15);
    endShape(); 
  }
  
  //butterfly body segment 1
  ellipseMode(CORNER);
  noStroke();
  fill(277,213,226);
  ellipse(x,y,wd*.2,ht*.2);
  fill(255,211,254);
  ellipse(x,y,wd*.17,ht*.17);

  //butterfly body segment 2
  ellipseMode(CORNER);
  noStroke();
  fill(277,213,226);
  ellipse(x-x*.05,y+y*.1,wd*.17,ht*.17);
  fill(255,211,254);
  ellipse(x-x*.05,y+y*.1,wd*.14,ht*.14);
    
  //butterfly body segmant 3
  ellipseMode(CORNER);
  noStroke();
  fill(277,213,226);
  ellipse(x-x*.1,y+y*.2,wd*.14,ht*.14);
  fill(255,211,254);
  ellipse(x-x*.1,y+y*.2,wd*.11,ht*.11);

  //butterfly body segmant 4
  ellipseMode(CORNER);
  noStroke();
  fill(277,213,226);
  ellipse(x-x*.15,y+y*.3,wd*.13,ht*.13);
  fill(255,211,254);
  ellipse(x-x*.15,y+y*.3,wd*.1,ht*.1);  
    
  //antenna
  stroke(0);
  strokeWeight(1.5);
  noFill();
    //left antenna
    arc(x-wd*.17,y-ht*.15,wd*.25,ht*.25,radians(-20),radians(20));
    //right antenna
    arc(x+wd*.13,y-ht*.15,wd*.25,ht*.25,radians(160),radians(200));
  
  //butterfly wing right
    noStroke();
  fill(0,227,255,100);
  
  if (mousePressed == true)
  {  
    beginShape();
      curveVertex(x+x*.1,y+y*.15);
      curveVertex(x+x*.15,y+y*.25);
      curveVertex(x+x*.45,y+y*.25);
      curveVertex(x+x*.4,y-y*.25);
      curveVertex(x+x*.15,y-y*.15);
      curveVertex(x+x*.15,y+y*.25);
      curveVertex(x+x*.1,y+y*.15);
    endShape();
  }
  
  if (mousePressed == false)
  {
    beginShape();
      curveVertex(x+x*.05,y+y*.1);
      curveVertex(x+x*.1,y+y*.2);
      curveVertex(x+x*.4,y+y*.2);
      curveVertex(x+x*.35,y-y*.2);
      curveVertex(x+x*.1,y-y*.1);
      curveVertex(x+x*.1,y+y*.2);
      curveVertex(x+x*.05,y+y*.1);
    endShape(); 
    
    fill(0,159,255,50);
    beginShape();
      curveVertex(x+x*.1,y+y*.15);
      curveVertex(x+x*.15,y+y*.25);
      curveVertex(x+x*.45,y+y*.25);
      curveVertex(x+x*.4,y-y*.25);
      curveVertex(x+x*.15,y-y*.15);
      curveVertex(x+x*.15,y+y*.25);
      curveVertex(x+x*.1,y+y*.15);
    endShape();
  }
}


