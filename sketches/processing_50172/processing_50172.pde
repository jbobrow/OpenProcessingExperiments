

void setup()
{
size(200,200);
}

void draw()
{
background(255);

int y = 0;       
int spacing = 8; 
int linelength = 200;     


float xmouse = mouseX;
float ymouse = mouseY;

float strokesize = xmouse/20;
float fillhue = ymouse;
for (int x = 0; x <= 200; x += spacing) { 
  line(x,y,x,y + linelength);
  strokeCap(ROUND);
  strokeWeight(strokesize);
  stroke(fillhue);
}
}



