
void setup () {
  size(480, 320);
  background(255);
  smooth();
}

void draw() {
  background(255);
  for(int x = 10; x<480; x+=10) {
    line(x,0,x,height);
    line(10,x, x, height);
  }

  for(int y = 10; y<480; y+=10) {
    line(y,0,width,y);
  }

  fill(255);
  beginShape();
  vertex(40,320);
  vertex(35, 280);
  vertex(100,100);
  vertex(150, 50);
  vertex(320,100);
  vertex(340, 200);
  vertex(330, 200);
  vertex(300, 320);
  endShape();
  //hair  

  //bezier 2 (right)
  float cp3x = 180;
  float cp3y = 10;
  float cp4x = 450;
  float cp4y = 10;

  fill(0,255,0);
  noStroke();
  ellipse(cp3x, cp3y, 3, 3);
  ellipse(cp4x, cp4y, 3, 3);

  noStroke();
   if(mousePressed) {
    fill(240,0,55,150);
  } 
  else { 
    fill(242,204,47,245);
  }
  bezier(150,50, cp3x, cp3y, cp4x, cp4y, 330, 200);

  //bezier 1 (right)
  float cp1x = 70;
  float cp1y = 10;
  float cp2x = 450;
  float cp2y = 10;

  fill(255,0,0);
  noStroke();
  ellipse(cp1x, cp1y, 3, 3);
  ellipse(cp2x, cp2y, 3, 3);

  stroke(0);
  fill(255);
  bezier(150,50, cp1x, cp1y, cp2x, cp2y, 330, 200);

  //bezier 3 (left)
  float cp5x = 20;
  float cp5y = 10;
  float cp6x = 20;
  float cp6y = 200;

  fill(0,0,255);
  noStroke();
  ellipse(cp5x, cp5y, 3, 3);
  ellipse(cp6x, cp6y, 3, 3);

  noStroke();
  if(mousePressed) {
    fill(240,0,55,150);
  } 
  else { 
    fill(0,0,255,200);
  }
  bezier(170,50, cp5x, cp5y, cp6x, cp6y, 40, 320);

  

  //bezier 4 (left)
  float cp7x = 20;
  float cp7y = 80;
  float cp8x = 20;
  float cp8y = 200;

  fill(0,0,255);
  noStroke();
  ellipse(cp7x, cp7y, 3, 3);
  ellipse(cp8x, cp8y, 3, 3);

  stroke(0);
  fill(255);
  bezier(170,50, cp7x, cp7y, cp8x, cp8y, 40, 320);

  //eyes
  //right eye
  //eyebrow bezier 5
  float cp9x = 240;
  float cp9y = 80;
  float cp10x = 300;
  float cp10y = 100;

  fill(255,0,255);
  noStroke();
  ellipse(cp9x, cp9y, 3, 3);
  ellipse(cp10x, cp10y, 3, 3);

  stroke(0);
  noFill();
  bezier(220,120, cp9x, cp9y, cp10x, cp10y, 300, 125);

  //eye edges
  ellipse(260,160,60,30);
  ellipse(260,160,20,30);

  //left eye
  //eyebrow
  float cp11x = 100;
  float cp11y = 80;
  float cp12x = 220;
  float cp12y = 100;

  fill(255,0,255);
  noStroke();
  ellipse(cp11x, cp11y, 3, 3);
  ellipse(cp12x, cp12y, 3, 3);

  stroke(0);
  noFill();
  bezier(100,100, cp11x, cp11y, cp12x, cp12y, 180, 120);

  //eye edges
  ellipse(120,140,60,30);
  ellipse(120,140,20,30);

  //nose
  float cp13x = 200;
  float cp13y = 300;
  float cp14x = 200;
  float cp14y = 350;

  fill(255,255,0);
  noStroke();
  ellipse(cp13x, cp13y, 3, 3);
  ellipse(cp14x, cp14y, 3, 3);

  stroke(0);
  fill(255);
  bezier(185,165, cp13x, cp13y, cp14x, cp14y, 140, 310);
}


