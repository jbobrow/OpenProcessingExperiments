
size(300, 300);

int spacing = 25;
int margin = 50;

for (int y=margin; y <height-margin; y+=spacing) {
  for (int x=margin; x < width-margin; x+=spacing) {
    fill(255);
    rect(x,y,25,25);
    fill(1);
    rect(x,y,10,10);
    line(x+25,y,x,y+25);
  }
}


