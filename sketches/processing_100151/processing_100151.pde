
int sl = 200;
int max_levels = 6;
int current_level = 0;
float sqrt34 = 0.866025404; //heigh of a triangle = sidelen * sqrt(3/4)

int elsize = 10;

void drawRecur(int x, int y, int step, int sidelen) {
  
  step++;
  
  if (step > max_levels || step > current_level)
    return;
  
  float triheight = -sidelen*sqrt34;
  float halfsidelen = sidelen/2;
  
  resetMatrix();
  translate(x,y);
  triangle(0,0, sidelen,0, halfsidelen, triheight);
  drawRecur(x,y, step, (int)halfsidelen);
  
  //ellipse(0,0, 20/step,20/step); ellipse(sidelen,0, 20/step,20/step); ellipse(halfsidelen,triheight, 20/step,20/step);
  
  resetMatrix();
  translate(x+sidelen,y);
  triangle(0,0, sidelen,0, halfsidelen, triheight);
  drawRecur(x+sidelen,y, step, (int)halfsidelen);
  
  resetMatrix();
  translate(x+halfsidelen,y+triheight);
  triangle(0,0, sidelen,0, halfsidelen, (int)triheight);
  drawRecur(x+(int)halfsidelen,y+(int)triheight, step, (int)halfsidelen);

}

void setup() {
  
  size(900,600);
  smooth(8);
  frameRate(120);
  noFill();
  background(255);
}

void draw() {
  noLoop();
}

void mousePressed() {
  
  background(255);   
  stroke(255,0,0);
  
  if (mouseButton == LEFT) {

    current_level++;
    if (current_level > max_levels)
      current_level = max_levels;
    drawRecur(mouseX,mouseY, 0, sl);
    
    loop();
  }
  
  if (mouseButton == RIGHT) {
    
    current_level--;
    if (current_level < 0)
      current_level = 0;
      
    drawRecur(mouseX,mouseY, 0, sl);
    loop();
  }
}
