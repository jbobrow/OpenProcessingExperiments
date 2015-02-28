
// Assignment #3
// Name: Emily Levine
// E-mail: eslevine@brynmawr.edu
// Date: 09/23/2010

//variables
float x,y,w,h;
float r,g,b,a;
int mouseP = 1;

void setup () {
  size(500,500);
  smooth();

  //color variables
  r = 0;
  g = 100;
  b = 80;
  a = 255;

  //create horizontal gradient for sky

  //create local constants for color
  float c1 = 64;
  float c2 = 144;
  float c3 = 245;

  //create local constants for line 
  float x1 = 0;
  float y1 = 0;
  float x2 = width;
  float y2 = 0;

  //horizontal gradient
  for(int i=0; i < height; i+=1) {
    stroke(c1, c2, c3);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    y1++;
    y2++;
    c1+=.18;
    c2+=.25;
    c3+=2;
  }
}

void draw () {

  x = random(width);
  y = random((height)/1.45);
  w = random(20,50);
  h = w;

  drawLeaf();
  drawTree();
  drawGrass();
}

void drawLeaf() {
  frameRate(50);
  fill (random(r),random(g),random(b));


  //maple leaf: left side:
  noStroke();
  beginShape();
  vertex(x,y);
  vertex(x-w/6.66,y+h/9.0);
  vertex(x-w/5.88,y+h/12.5);
  vertex(x-w/4,y+h/7.69);
  vertex(x-w/3.7,y+h/10);
  vertex(x-w/3.33,y+h/9.09); 
  vertex(x-w/2.7,y+h/7.14); //bottom left
  vertex(x-w/3.03,y+h/12.5);
  vertex(x-w/2.94,y+h/14.29);
  vertex(x-w/3.85,y-h/50); //bottom left corner, turning up
  vertex(x-w/2.56,y-h/25);
  vertex(x-w/2.7,y-h/16.66);
  vertex(x-w/2.27,y-h/12.5);
  vertex(x-w/2.38,y-h/10);
  vertex(x-w/2,y-h/8.33);
  vertex(x-w/2.7,y-h/6.25);//middle bottom left corner, turning up
  vertex(x-w/2.27,y-h/5);
  vertex(x-w/1.96,y-h/4.167);
  vertex(x-w/2.33,y-h/3.85);
  vertex(x-w/2.08,y-h/3.33);
  vertex(x-w/2.22,y-h/3.125);
  vertex(x-w/2.04,y-h/2.94);
  vertex(x-w/2.22,y-h/2.778);
  vertex(x-w/1.887,y-h/2.27); //left middle tip
  vertex(x-w/2.38,y-h/2.564);
  vertex(x-w/2.5,y-h/2.38);
  vertex(x-w/2.564,y-h/2.564);
  vertex(x-w/2.778,y-h/2.5);
  vertex(x-w/3.03,y-h/2.778);
  vertex(x-w/3.448,y-h/2.564);
  vertex(x-w/5,y-h/4);
  vertex(x-w/5.5,y-h/2.5);
  vertex(x-w/3.448,y-h/1.9);
  vertex(x-w/3.448,y-h/1.8);
  vertex(x-w/5.2,y-h/2);
  vertex(x-w/5.5,y-h/1.5);
  vertex(x-w/8,y-h/1.6);
  vertex(x-w/20,y-h/1.2);
  vertex(x,y-h/1.1);//up to the top
  vertex(x,y);   //right side:
  vertex(x+w/6.66,y+h/9.0);
  vertex(x+w/5.88,y+h/12.5);
  vertex(x+w/4,y+h/7.69);
  vertex(x+w/3.7,y+h/10);
  vertex(x+w/3.33,y+h/9.09); 
  vertex(x+w/2.7,y+h/7.14); //bottom left
  vertex(x+w/3.03,y+h/12.5);
  vertex(x+w/2.94,y+h/14.29);
  vertex(x+w/3.85,y-h/50); //bottom left corner, turning up
  vertex(x+w/2.56,y-h/25);
  vertex(x+w/2.7,y-h/16.66);
  vertex(x+w/2.27,y-h/12.5);
  vertex(x+w/2.38,y-h/10);
  vertex(x+w/2,y-h/8.33);
  vertex(x+w/2.7,y-h/6.25);//middle bottom left corner, turning up
  vertex(x+w/2.27,y-h/5);
  vertex(x+w/1.96,y-h/4.167);
  vertex(x+w/2.33,y-h/3.85);
  vertex(x+w/2.08,y-h/3.33);
  vertex(x+w/2.22,y-h/3.125);
  vertex(x+w/2.04,y-h/2.94);
  vertex(x+w/2.22,y-h/2.778);
  vertex(x+w/1.887,y-h/2.27); //left middle tip
  vertex(x+w/2.38,y-h/2.564);
  vertex(x+w/2.5,y-h/2.38);
  vertex(x+w/2.564,y-h/2.564);
  vertex(x+w/2.778,y-h/2.5);
  vertex(x+w/3.03,y-h/2.778);
  vertex(x+w/3.448,y-h/2.564);
  vertex(x+w/5,y-h/4);
  vertex(x+w/5.5,y-h/2.5);
  vertex(x+w/3.448,y-h/1.9);
  vertex(x+w/3.448,y-h/1.8);
  vertex(x+w/5.2,y-h/2);
  vertex(x+w/5.5,y-h/1.5);
  vertex(x+w/8,y-h/1.6);
  vertex(x+w/20,y-h/1.2);
  vertex(x,y-h/1.1);
  endShape(CLOSE);
}
void mousePressed() { 
  if (mouseP == -1) { //autumn leaves
    r = 255;
    g = 155;
    b = 0;

  }
  else if (mouseP == 1) { //back to summer leaves
    r = 0;
    g = 100;
    b = 80;
  }
  mouseP = mouseP * -1;
}


void drawTree() {
  // tree trunk
  strokeWeight(2);
  stroke(62,39,9,10);
  fill(70,47,18,10);
  beginShape();
  curveVertex(100,600);
  curveVertex(100,600);
  curveVertex(175,375);
  curveVertex(190,380);
  curveVertex(150,100);
  curveVertex(210,350);
  curveVertex(275,50);
  curveVertex(250,300);
  curveVertex(300,600);
  curveVertex(300,600);
  endShape(CLOSE); 
  //right branch high
  beginShape();
  curveVertex(215,350);
  curveVertex(215,350);
  curveVertex(445,10);
  curveVertex(300,200);
  curveVertex(270,445);
  curveVertex(270,445);
  endShape(OPEN);

  //right branch low
  beginShape();
  curveVertex(250,350);
  curveVertex(250,350);
  curveVertex(300,300);
  curveVertex(400,300);
  curveVertex(450,325);
  curveVertex(375,325);
  curveVertex(350,325);
  curveVertex(325,325);
  curveVertex(300,350);
  curveVertex(270,375);
  curveVertex(260,400);
  curveVertex(260,400);
  endShape(OPEN);

  //left branch high
  beginShape();
  curveVertex(150,450);
  curveVertex(150,450);
  curveVertex(125,300);
  curveVertex(50,25);
  curveVertex(150,300);
  curveVertex(180,365);
  curveVertex(180,365);
  endShape(OPEN);
}



void drawGrass() {
  float c;
  float d;
  for (c=0; c <= width; c=c+3) {
    for (d=499; d <= height; d++) {
      noFill();
      strokeWeight(.5);
      stroke (32,113,29,175);
      curve(c,d,c,d,c,d-20,c+60,d-1000);
    }
  }
}


