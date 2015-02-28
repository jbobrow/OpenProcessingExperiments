
PGraphics bg;
void setup()
{
  size(770,500);
  frameRate(10);
  //pre-draw the conistent background image
  bg = createGraphics(1000,1000);
  
  bg.beginDraw();
  
  //background: white
  bg.fill(255,255,255);
  bg.rect(0,0,1000,1000);
  
  //M
  bg.fill(150,0,255);
  bg.noStroke();
  bg.rect(100,100,50,200);
  
  bg.fill(0,0,100);
  bg.stroke(0,0,0);
  bg.quad(250,100,280,110,390,340,320,330);
  
  bg.noFill();
  bg.arc(200,100,100,100,0,PI);
  
  //W
  bg.fill(0,30,0);
  bg.noStroke();
  bg.ellipse(475,200,40,250);
  
  bg.stroke(100,0,0);
  bg.strokeWeight(20);
  bg.strokeCap(PROJECT);
  bg.line(595,311,750,50);
  
  bg.noStroke();
  for(int i = 0; i < 15; i++) {
    bg.fill(255,100 + 10*i,0);
    bg.triangle(476 + 4*i,325,599 - 4*i,325,550,250);
  }

  //revealer
  bg.blendMode(DIFFERENCE);
  bg.fill(255,255,255);
  bg.ellipseMode(CORNER);
  bg.ellipse(300,200,400,300);
  
  bg.endDraw();
}

void draw()
{
  //draw the consistent background
  image(bg,0,0);
}
