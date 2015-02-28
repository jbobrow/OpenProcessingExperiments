
//By Prince Jacob

int clickX, clickY, releaseX, releaseY;
boolean nowDragging;
int dragRed, moveBlue;
PFont font;
float x = 33; 
float y = 60; 
void setup() 
{
  background(255);
  size(1200,1000);
  smooth();
  strokeWeight(2);
  font = loadFont("AmericanTypewriter-24.vlw");
  textFont(font);
}

void draw() 
{ 
 // background(206,119,12);
  
   if ((mouseX >= x) && (mouseX <= x+55) &&
    (mouseY >= y-24) && (mouseY <= y)) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  fill(8,248,12);
  text("Over Here For New Size", x, y);
  fill(252,196,12);
  text("Drag The Circle", y, x);
  fill(250,248,12);
  stroke(0,0,0);
  ellipse(mouseY,mouseX,x,y);
  fill(0,0,0);
  stroke(240,27,12);
  ellipse(mouseX,mouseY,x,y);



 // stroke(255,255,255);
//ellipse(clickX,clickY, releaseX,releaseY);
 
  
  stroke(0,0,moveBlue);
  //ellipse(releaseX,releaseY, mouseX, mouseY);
  
  
 // if(nowDragging)
  {
   // stroke(dragRed,45,69);
   //ellipse(clickX,clickY, mouseX,mouseY);
  }

 moveBlue--;
  dragRed--;
}

void mouseMoved()
{
  moveBlue = 255;
}

void mousePressed()
{
  clickX = releaseX = mouseX;
  clickY = releaseY = mouseY;
  nowDragging = true;
}

void mouseDragged()
{
  dragRed = 255;
}

void mouseReleased()
{
  nowDragging = false;
  releaseX = mouseX;
  releaseY = mouseY;
}


