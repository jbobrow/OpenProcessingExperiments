
void setup(){
  size(200,200);
}

void draw(){
  if(mouseX<60&&mouseX>20&&mouseY<180&&mouseY>160)
  {
    background(255);
    rectMode(CORNER);
    fill(255);
    rect(20,160,40,20);
    rectMode(CENTER);
    fill(255,255,0);
    rect(100,50,40,40);
    rect(100,120,40,80);
    fill(0,0,255);
    ellipse(90,40,10,10);
    ellipse(110,40,10,10);
    triangle(100,50,90,60,110,60);
    fill(255,0,0);
    ellipse(100,100,10,10);
    ellipse(100,140,10,10);
  }
  else
   {
    background(0);
    rectMode(CORNER);
    fill(255);
    rect(20,160,40,20);
    rectMode(CENTER);
    fill(255,255,0);
    rect(100,50,40,40);
    rect(100,120,40,80);
    fill(0,0,255);
    ellipse(90,40,10,10);
    ellipse(110,40,10,10);
    triangle(100,50,90,60,110,60);
    fill(255,0,0);
    ellipse(100,100,10,10);
    ellipse(100,140,10,10);
  }
}

