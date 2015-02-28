
//DiTang, EightBall, 14-15, CP1
boolean mode = false;
PImage bsod;

String [] answers = 
{

"STOP Error 0x00000001 to STOP Error 0x0000005F",
"DEVICE_QUEUE_NOT_BUSY",
"ERROR 404 ", 
"DRIVER_IRQL_NOT_LESS_OR_EQUAL", 
"error code:0x80070035",
"XNS_INTERNAL_ERROR"
};

void setup()
{
  noLoop();
  size(500,500);
  noStroke();
  bsod = loadImage("http://www.computertroublesolver.com/image-files/bsod.jpg");
}
void draw()
{
  background(255);
  if(mode == true)
  {
    fill(0);
    ellipse(250,250,400,400);
    fill(255);
    triangle(200,150,300,150,250,200);
    textAlign(CENTER);
    text(answers[(int(random(0,6)))],300,250);
    textAlign(0);
    
  }
  else
  {
    fill(0);
    ellipse(250,250,400,400);
    fill(255);
    ellipse(250,250,200,200);
    textSize(220);
    fill(0);
    text("8",190,330);
    textSize(20);
    fill(255);
    text("ASK A QUESTION", 170,400);
  }
}

void mouseClicked()
{
  mode = !mode;
  redraw();
}
