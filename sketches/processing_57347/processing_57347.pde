
int x, y;
int w, h;
int countClick;
color currentColor;
color idle;
color mouseOver;
color clicked;

int servetX;
int servetY;

String[] servetMsg = {
  "Servet: ah vurmasana",
  "Servet: olm vurma",
  "Servet: bak gerçekten rahatsız oluyorum",
  "Servet: ah!",
  "Servet: gülüyosam seni sevdiğimden",
  "Servet: bak sabrımdan karsilik vermiyorum"
};

String currentMsg;

void setup()
{
  size(400, 400);
  x = 100;
  y = 100;
  w = 200;
  h = 200;

  countClick = 0;
  
  idle         = color(0);
  mouseOver    = color(255);
  clicked      = color(255, 0,0);
  currentColor = idle;
 
  servetX = -1000;
  servetY = -1000;
  currentMsg = ""; 
}


void draw()
{
  background(255);
  fill(0);
  text("Click count: "+Integer.toString(countClick), 20, 20);
  
  fill(currentColor);
  rect(x, y, w, h);
  
  fill(0,255,00);
  kickServet();
}

void mouseMoved()
{
  if(mouseX > x && mouseX < x+w &&
     mouseY > y && mouseY < y+h)
  {
    currentColor = mouseOver;
  }
  else
  {
    currentColor = idle;
  }
}


void mousePressed()
{
  countClick++;
  if(mouseX > x && mouseX < x+w &&
     mouseY > y && mouseY < y+h)
  {
    currentColor = clicked;
    servetX = int(random(0, width-100));
    servetY = int(random(0, height-50));
    currentMsg = servetMsg[int(random(0, servetMsg.length))];
  }
  else
  {
    currentColor = idle;
  }
}

void mouseReleased()
{
  currentColor = idle;
}


void kickServet()
{
  text(currentMsg, servetX, servetY);
}

