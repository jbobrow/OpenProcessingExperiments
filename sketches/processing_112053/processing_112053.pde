
// homework 5
// copyright Colleen Clifford Pittsburgh PA Sept 2013

//variables
float a, b;

void setup()
{
  size(800, 800);
  background (26, 255, 157);
  smooth();
  rectMode (CENTER);
  frameRate (5);
  
  a= width*.5;
  b= height*.5;
 
}
  
void prepScreen ()
{
  noStroke();
  fill (26, 255, 157, 60);
  rect (a, b, width, height);
  
  noFill();
  stroke(170, 5, 55);
  strokeWeight (4);
  rect(a, b, width*.75, height*.75);
}

void draw()
{
  prepScreen ();
  if (mouseX> width*.25 && 
      mouseX< width*.75 && 
      mouseY> height*.25 && 
      mouseY< height*.75) 
  {
    figure (mouseX, mouseY, random(30, 100), random(30, 100));
    figure (mouseY, mouseX, random(30, 100), random(30, 100));
  }
  
}


void figure (float x, float y, float wd, float ht)
{
   //head
  noStroke();
  fill(240, 216, 198);
  ellipse (x, y, wd, ht);
  ellipse (x, y+ ht*.15, wd*1.4,  ht);
  ellipse (x, y, wd*1.25, ht*1.5);

  //cheeks
  fill(255, 0, 255, 25);
  ellipse (x- wd*.45, y+ ht*.15, wd*.35, ht*.35);
  ellipse (x+ wd*.45, y+ ht*.15, wd*.35, ht*.35);
  
  fill(240, 216, 198);
  ellipse (x- wd*.3, y+ ht*.15, wd*.45, ht*.35);
  ellipse (x+ wd*.3, y+ ht*.15, wd*.45, ht*.35);
  
  //moustache
  noStroke();
  fill(210, 210, 210);
  arc(x, y+ ht*.3, wd*.5, ht*.35, radians(135), radians(405), 3);
  fill(240, 216, 198);
  ellipse(x, y+ ht*.15, wd*.1, ht*.2);
  
  //nose right half
  stroke(131, 68, 0, 70);
  if (wd < 0)
  {
     strokeWeight (wd* -.01); 
  }
  
  else
  {
      strokeWeight (wd* .01);
  }
  
  beginShape();
  curveVertex(x+ wd*.2,   y- ht*.25);
  //c
  curveVertex(x+ wd*.12,   y- ht*.2);
  //d
  curveVertex(x+ wd*.075, y- ht*.1);
  //e
  curveVertex(x+ wd*.1,   y+ ht*.05);
  //f
  curveVertex(x+ wd*.15,   y+ ht*.13);
  //g
  curveVertex(x+ wd*.07,  y+ ht*.2);
  //h
  curveVertex(x,          y+ ht*.25);
  curveVertex(x- wd*.25,  y+ ht*.2);
  endShape();
  
  //nose left half
  beginShape();
  curveVertex(x- wd*.2,   y- ht*.25);
  //c
  curveVertex(x- wd*.12,   y- ht*.2);
  //d
  curveVertex(x- wd*.075, y- ht*.1);
  //e
  curveVertex(x- wd*.1,   y+ ht*.05);
  //f
  curveVertex(x- wd*.15,   y+ ht*.13);
  //g
  curveVertex(x- wd*.07,  y+ ht*.2);
  //h
  curveVertex(x,          y+ ht*.25);
  curveVertex(x+ wd*.25,  y+ ht*.2);
  endShape();
  
  //eyes
  fill(85, 85, 85, 200);
  noStroke();
  ellipse(x- wd*.25, y- ht*.1, wd*.2, ht*.15);
  ellipse(x+ wd*.25, y- ht*.1, wd*.2, ht*.15);
  fill(240, 216, 198);
  ellipse(x- wd*.25, y- ht*.07, wd*.2, ht*.15);
  ellipse(x+ wd*.25, y- ht*.07, wd*.2, ht*.15);
  
  
  //mouth 
  stroke(219, 7, 0, 150);
  noFill();
  triangle(x+ wd*.035, y+ ht*.4, x+ wd*.07, y+ ht*.45, x, y+ ht*.45);
  triangle(x- wd*.035, y+ ht*.4, x- wd*.07, y+ ht*.45, x, y+ ht*.45);
  stroke(240, 216, 198);
  strokeWeight(6.5);
  line(x+ wd*.1, y+ ht*.46, x- wd*.1, y+ ht*.46);
  
  //glasses
  stroke(150, 150, 150);
  if (wd < 0)
  {
     strokeWeight (wd* -.02); 
  }
  
  else
  {
      strokeWeight (wd* .02);
  }
  
  line(x- wd*.6, y- ht*.25, x- wd*.1, y- ht*.25);
  line(x+ wd*.6, y- ht*.25, x+ wd*.1, y- ht*.25);
  arc(x, y- ht*.25, wd*.2, ht*.05, 0, PI);
  arc(x, y- ht*.12, wd*.2, ht*.1, PI, TWO_PI);
  arc(x+ wd*.3, y- ht*.25, wd*.4, ht*.6, 0, PI);
  arc(x- wd*.3, y- ht*.25, wd*.4, ht*.6, 0, PI);
  
  //hair
  stroke(210, 210, 210);
  fill(210, 210, 210);
  triangle(x- wd*.4, y- ht*.6, x- wd*.6, y- ht*.3, x- wd*.45, y- ht*.3);
  triangle(x+ wd*.4, y- ht*.6, x+ wd*.6, y- ht*.3, x+ wd*.45, y- ht*.3);

}


