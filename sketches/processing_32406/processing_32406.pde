
//Feilds
int level = 0;
boolean firstClick = false;
boolean rev = true;
int x = 0;
int y = 0;

void setup(){
  size(500, 1000);
  noStroke();
  smooth();
  noLoop();
  
}

void draw(){
  if(firstClick == false){
    background(0);
    fill(255);
  }
  else pattern(250, 900, 1000, level);
}

void pattern(float x, float y, int radius, int level){
  float c = random(y/4);
  float colour =  c / level*1.1;
  fill(colour, 10);
  drawCross(x, y, radius);
  if(level > 1){
    level--;
    pattern(x, y, radius/2, level);
    pattern(x, y - radius/2, radius/2, level);
    pattern(x, y + radius/2, radius/2, level);
    pattern(x - radius/2, y, radius/2, level);
    pattern(x + radius/2, y, radius/2, level);
    pattern(x - radius/2, y - radius/2, radius/2, level);
    pattern(x - radius/2, y + radius/2, radius/2, level);
    pattern(x + radius/2, y - radius/2, radius/2, level);
    pattern(x + radius/2, y + radius/2, radius/2, level);
  }
}

void drawCross(float x, float y, int rad){
  translate(x,y);
  rotate(PI/4);
  ellipse(0, 0, rad, rad*0.375);
  ellipse(0, 0, rad*0.375, rad);
  rotate(PI*3/4 + PI);
  translate(-x,-y);
}

void mouseClicked(){
  if (firstClick == false) firstClick = true;
  if (rev == false) level--;
  if (rev == true) level++;
  if (level >= 6){
  rev = false;
  level--;
  }
  if (level <= 0){
  rev = true;
  level++;
  } 
  redraw();  
}



